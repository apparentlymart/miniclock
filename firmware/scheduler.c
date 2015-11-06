#include "lpc812.h"
#include "scheduler.h"

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
volatile int millis = 0;

void sched_main_loop(void) {
    while (1) {
        // Take a snapshot of millis so that we know it'll remain
        // constant through a single loop, and so the volatility of
        // millis doesn't inhibit optimizations after this point.
        int loop_millis = millis;

        // TODO: Walk timer_tasks and make runnable any task whose
        // target time is less than loop_millis.

        // TODO: Walk runnable_tasks and run each task so it can
        // progress to its next blocking operation.

        // TODO: Inspect the next timer task and set up the wake-up timer
        // so we'll get interrupted no later than that task is due.

        // Wait until we get an interrupt.
        __asm volatile ("wfi");

        // If the interrupt unblocked something then there will now
        // be at least one new member of runnable_tasks that we'll
        // call into on the next iteration.
    }
}

void sched_run_task(sched_list_head *task) {
    sched_queue_task(&runnable_tasks, task);
}

void sched_queue_task(sched_list_head *queue, sched_list_head *task) {
    // TODO: Twiddle the pointers in both the queue and the task
    // so that the given task is at the end of the given queue.
}

void sched_sleep(sched_task *task, int wake_after_millis) {
    // Reinterpret the given generic task as a timer task
    // so we can write our target time into the data area.
    sched_timer_task *timer_task = (sched_timer_task*)task;
    timer_task->wake_time = millis + wake_after_millis;

    sched_queue_task(&timer_tasks, (sched_list_head*)task);
}
