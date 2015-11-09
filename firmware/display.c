
#include "scheduler.h"
#include "serial.h"
#include "buttons.h"
#include "ui.h"
#include "display.h"

int anim_active = 0;
sched_list_head transition_tasks;
sched_task *active_transition_task = 0;

// During animation, the first index of this array points to either
// the topmost or the leftmost state, depending on which direction we're
// animating in, with the second index pointing to the bottom or right
// state. When we're not showing two states on-screen, only the first
// index is significant.
ui_state display_states[2];
ui_state current_state = UI_BEGIN;
ui_state previous_state = UI_BEGIN;
int anim_frame = 0;

sched_task anim_dispatch_task;
sched_task anim_task;

void anim_dispatch_task_impl(void) {

    // This task impl expects to be called only when either there is no
    // active transition, or when the transition is over. We distinguish
    // these cases by whether active_transition_task is set.
    if (active_transition_task) {
        // The transition is complete, so we'll schedule the task
        // to be run on the next loop iteration.
        sched_run_task(active_transition_task);
        active_transition_task = 0;
    }

    // Is there a new transition waiting in the queue?
    if (transition_tasks.next != &transition_tasks) {
        sched_task *task = (sched_task*)transition_tasks.next;
        display_transition_task *trans_task = (display_transition_task*)task;
        // Take the task out of the pending queue.
        sched_dequeue_task(task);
        active_transition_task = task;

        previous_state = trans_task->old_state;
        current_state = trans_task->new_state;

        // TODO: Choose an anim implementation, assign it into anim_task,
        // and then schedule anim_task to run.
    }
    else {
        // No longer any animations active.
        anim_active = 0;
    }

    // Always dequeue after a run. If we started an animation above
    // then it will queue us back again when it ends, so we'll get
    // an opportunity to start a new animation.
    sched_dequeue_task(&anim_dispatch_task);
}

void display_init(void) {
    sched_init_task_head(&transition_tasks);
    sched_init_task(&anim_dispatch_task, anim_dispatch_task_impl);

    // The anim task's implementation will be assigned by the
    // dispatch task, once it decides what kind of animation to use.
    sched_init_task(&anim_task, 0);
}

void display_state_change(
    sched_task *task,
    ui_state new_state,
    ui_state old_state,
    button buttons
) {
    display_transition_task *trans_task = (display_transition_task*)task;
    trans_task->new_state = new_state;
    trans_task->old_state = old_state;
    trans_task->buttons = buttons;

    sched_queue_task(&transition_tasks, task);

    if (! anim_active) {
        anim_active = 1;
        sched_run_task(&anim_dispatch_task);
    }
}
