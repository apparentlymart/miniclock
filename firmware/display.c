
#include "scheduler.h"
#include "serial.h"
#include "buttons.h"
#include "ui.h"
#include "digits.h"
#include "display.h"

int anim_active = 0;
sched_list_head transition_tasks;
sched_task *active_transition_task = 0;

// During animation, the first index of this array points to either
// the topmost or the leftmost state, depending on which direction we're
// animating in, with the second index pointing to the bottom or right
// state. When we're not showing two states on-screen, only the first
// index is significant.
ui_state display_states[2] = {UI_BEGIN, UI_BEGIN};
char offset_amt;
unsigned char offset_dir = 'h';

sched_task anim_dispatch_task;
sched_task anim_task;
void *anim_task_pos;

const unsigned char space_row_data = 0;
const unsigned char colon_row_data = 0b00010100;

const unsigned char* display_space_row(int num, int row) {
    return row < num ? &space_row_data : 0;
}

const unsigned char* display_colon_row(int dummy, int row) {
    return row == 0 ? &colon_row_data : 0;
}

display_elem elems_time_hm[] = {
    { display_space_row, 2 },
    { digits_row, 4 },
    { display_space_row, 1 },
    { digits_row, 3 },
    { display_space_row, 1 },
    { display_colon_row, 0 },
    { display_space_row, 1 },
    { digits_row, 2 },
    { display_space_row, 1 },
    { digits_row, 1 },
    { 0, 0 },
};

void display_render_row_to_uart(unsigned char data) {
    for (int i = 0; i < 8; i++) {
        uart_putc(data & 0b10000000 ? 'O' : ' ');
        data <<= 1;
    }
    uart_puts("\r\n");
}

void display_render_to_uart(display_elem *elems) {
    if (! elems) {
        // Was given elems for a state that isn't implemented yet.
    }
    int elem_row = 0;
    int screen_row = 0;
    while (1) {
        if (! elems->impl) {
            // Elements terminator.
            break;
        }
        const unsigned char *data_p = elems->impl(elems->arg, elem_row);
        if (! data_p) {
            elem_row = 0;
            elems++;
            continue;
        }

        if (screen_row >= offset_amt) {
            display_render_row_to_uart(*data_p);
        }

        elem_row++;
        screen_row++;
    }
    // Blank out any rows we skipped due to the offset.
    for (int i = 0; i < offset_amt; i++) {
        display_render_row_to_uart(0);
    }
}

void display_render(void) {
    uart_println_int_hex("\x1b[0;0HState 0: ", display_states[0]);
    uart_println_int_hex("State 1: ", display_states[1]);
    uart_println("");
    uart_println_int_hex("Transition Offset:    ", (int)offset_amt);
    uart_println_int_hex("Transition Direction: ", (int)offset_dir);

    display_render_to_uart((display_elem*)&elems_time_hm);
}

void anim_to_right_task(void) {
    TASK_START_EXT(anim_task, anim_task_pos);

    offset_dir = 'h';
    for (offset_amt = 1; offset_amt < 24; offset_amt++) {
        display_render();
        TASK_AWAIT_EXT_RAW(anim_task_pos, task_sleep(&anim_task, 10));
    }

    // End with the new state filling the whole screen.
    offset_amt = 0;
    display_states[0] = display_states[1];
    display_render();

    sched_dequeue_task(&anim_task);
    sched_run_task(&anim_dispatch_task);
}

void anim_to_left_task(void) {
    TASK_START_EXT(anim_task, anim_task_pos);

    offset_dir = 'h';
    for (offset_amt = 23; offset_amt > 0; offset_amt--) {
        display_render();
        TASK_AWAIT_EXT_RAW(anim_task_pos, task_sleep(&anim_task, 10));
    }

    // End with the new state filling the whole screen.
    offset_amt = 0;
    display_render();

    sched_dequeue_task(&anim_task);
    sched_run_task(&anim_dispatch_task);
}

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

        if (trans_task->buttons == BUTTON_LEFT) {
            display_states[0] = trans_task->new_state;
            display_states[1] = trans_task->old_state;
            anim_task.impl = anim_to_left_task;
        }
        else {
            display_states[0] = trans_task->old_state;
            display_states[1] = trans_task->new_state;
            anim_task.impl = anim_to_right_task;
        }

        anim_task_pos = 0;
        // Call the task implementation to let it initialize
        // and schedule itself.
        anim_task.impl();
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
