#include "lpc812.h"
#include "scheduler.h"

// Temporarily for debugging
#include "serial.h"

// List of tasks that are currently runnable.
// On each main loop iteration these all get to progress to their next
// blocking operation.
sched_list_head runnable_tasks;

// List of tasks that are blocked on timers.
// This list is maintained in increasing order of target time, so the
// first item is always the next timer.
sched_list_head timer_tasks;

// Number of milliseconds counted since power on.
// This gets incremented by our wake-up timer interrupt, but the wake-up
// timer is only accurate to +/-40% so this *will* drift.
// For more accurate timing at only 1 second resolution, use the 1Hz
// signal from the external real-time clock.
volatile unsigned int millis = 0;

void SysTick_isr(void) {
    millis += 10;
}

static inline void init_systick(void) {
    // Enable SysTick interrupt
    SYST_CSR |= (
        1 << 0 |
        1 << 1 |
        1 << 2
    );

    // SysTick reset value (60MHz clock * 10ms) - 1
    SYST_RVR = 599999;
}

static inline void handle_timer_tasks(int loop_millis) {
    // Walk timer_tasks and make runnable any task whose
    // target time is less than loop_millis.
    sched_list_head *next;
    for (
        sched_list_head *current = timer_tasks.next;
        current != &timer_tasks;
        current = next
    ) {
        sched_timer_task *current_timer = (sched_timer_task*)current;
        if (current_timer->wake_time > loop_millis) {
            // The timer tasks list is maintained in order of ascending
            // wake_time, so this task and all tasks after it are in
            // the future and won't be processed on this iteration.
            return;
        }

        next = current->next;
        sched_run_task((sched_task*)current);
    }
}

static inline void handle_runnable_tasks() {
    // Walk runnable_tasks and run each task so it can
    // progress to its next blocking operation.
    sched_list_head *next;
    for (
        sched_list_head *current = runnable_tasks.next;
        current != &runnable_tasks;
        current = next
    ) {
        sched_task *current_task = (sched_task*)current;
        sched_task_impl impl = current_task->impl;
        // The implementation should proceed to its next blocking call,
        // remove itself from runnable_tasks (by putting itself into
        // a different queue) and then return.
        next = current->next;
        impl();
    }
}

void sched_init(void) {
    init_systick();
    sched_init_task_head(&runnable_tasks);
    sched_init_task_head(&timer_tasks);
}

void sched_main_loop(void) {
    while (1) {
        // Pass in a snapshot of millis so that we know it'll remain
        // constant through the call, and so the volatility of
        // millis doesn't inhibit optimizations within this function.
        handle_timer_tasks(millis);

        handle_runnable_tasks();

        // Wait until we get an interrupt.
        __asm volatile ("wfi");

        // If the interrupt unblocked something then there will now
        // be at least one new member of runnable_tasks that we'll
        // call into on the next iteration.
    }
}

void sched_init_task_head(sched_list_head *task) {
    // A task that's alone in a list points to itself.
    task->next = task;
    task->prev = task;
}

// Always call this on a newly-allocated task to ensure that its
// linked list pointers are correctly initialized before using it
// with other list-manipulation functions.
void sched_init_task(sched_task *task, sched_task_impl impl) {
    sched_init_task_head(&(task->list));
    task->impl = impl;
}

void sched_run_task(sched_task *task) {
    sched_queue_task(&runnable_tasks, task);
}

void sched_queue_task(sched_list_head *queue, sched_task *task) {
    disable_interrupts();

    // Heal the hole we're leaving in any list we're already in.
    task->list.prev->next = task->list.next;
    task->list.next->prev = task->list.prev;

    task->list.prev = queue->prev;
    task->list.next = queue;
    queue->prev->next = (sched_list_head*)task;
    queue->prev = (sched_list_head*)task;

    enable_interrupts();
}

void sched_dequeue_task(sched_task *task) {
    disable_interrupts();

    // Heal the hole we're leaving in any list we're already in.
    task->list.prev->next = task->list.next;
    task->list.next->prev = task->list.prev;

    // A task that's alone points to itself.
    task->list.next = (sched_list_head*)task;
    task->list.prev = (sched_list_head*)task;

    enable_interrupts();
}

void task_sleep(sched_task *task, int wake_after_millis) {
    // Reinterpret the given generic task as a timer task
    // so we can write our target time into the data area.
    sched_timer_task *timer_task = (sched_timer_task*)task;
    timer_task->wake_time = millis + wake_after_millis;

    // Find a suitable place to insert the task into the timer tasks,
    // retaining the ascending order of wake_time.
    sched_list_head *current;
    for (
        current = timer_tasks.next;
        current != &timer_tasks;
        current = current->next
    ) {
        sched_timer_task *current_timer = (sched_timer_task*)current;
        if (current_timer->wake_time > timer_task->wake_time) {
            break;
        }
    }

    // Once we fall out here, "current" will either be the first task
    // whose wake_time is larger then the new task, or the timer_tasks
    // list head if no wake_time is larger.
    // Here we kinda-abuse sched_queue_task by giving it what might
    // actually not be a queue as its "queue", depending on the fact
    // that it'll insert our task before whatever we give it.
    sched_queue_task(current, task);
}
