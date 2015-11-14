
#include "scheduler.h"
#include "i2c.h"
#include "lpc812.h"
#include "clock.h"
#include "serial.h"

clock_instant clock_time;
sched_list_head clock_change_tasks;
sched_task clock_update_task;

void clock_notify_change(void) {
    // There's no reason why many different callers can't all listen
    // for time updates at once, so unusually here we schedule *all*
    // the waiting tasks, rather than just the head of the queue
    // as we do for most other blocking operations.
    sched_list_head *next;
    for (
        sched_list_head *current = clock_change_tasks.next;
        current != &clock_change_tasks;
        current = next
    ) {
        next = current->next;
        sched_run_task((sched_task*)current);
    }
}

void clock_update_task_impl(void) {
    // Currently our I2C driver is a polling one, so
    // we don't actually need to do anything task-y in here
    // but this is set up this way so we can have an
    // interrupt-driven I2C interface in future.
    //TASK_START(clock_update_task_impl);

    i2c_puts("", 1); // write null for address 0
    i2c_gets(&clock_time.seconds_bcd, 7); // Load RTC data directly to struct

    // The square wave signal itself gives us our half-second indication.
    clock_time.half_second = (unsigned char)GPIO_W16;

    // Normalize the values we got from the clock to be truly BCD values.
    clock_time.hours_bcd &= 0b111111; // Assume 24-hour clock mode
    clock_time.month_bcd &= 0b11111; // Mask out the "century" bit

    // Unschedule this task until we get another tick.
    sched_dequeue_task(&clock_update_task);

    // Schedule any tasks that are waiting for a change in time.
    clock_notify_change();
}

void clock_init(void) {
    i2c_init();

    // Set control register 0xe to enable the 1Hz SQW signal.
    i2c_puts("\x0e\x00", 2);

    // Detect change of the 1Hz square wave signal
    // from the RTC, which will cause us to wake up each
    // half-second and run RTC_tick_isr.
    // The second value changes on the falling edge.
    SYSCON_PINTSEL4 = 16;
    NVIC_ISER0 |= BIT28;
    PINT_SIENF |= 1 << 4;
    PINT_SIENR |= 1 << 4;

    sched_init_task_head(&clock_change_tasks);
    sched_init_task(&clock_update_task, &clock_update_task_impl);

    // Schedule our updating task to do an initial read of the time.
    sched_run_task(&clock_update_task);
}

void clock_await_change(sched_task *task) {
    sched_queue_task(&clock_change_tasks, task);
}

void RTC_tick_isr(void) {
    // Schedule our updating task, unless it's already scheduled for
    // some reason.
    if (clock_update_task.list.next == (sched_list_head*)&clock_update_task) {
        sched_run_task(&clock_update_task);
    }

    // Clear the interrupt flag.
    PINT_IST = 0b10000;
}
