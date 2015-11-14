
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

void display_render_to_uart_horiz(void) {
    // For Horiz, we visit rows in the first state first,
    // and then rows in the second state, until we've
    // filled the screen.
    int elem_row = 0;
    int state_row = 0;
    int screen_row = 0;
    int state_idx = 0;
    int skipped_rows = 0;
    display_elem *elems = (display_elem*)&elems_time_hm;
    while (1) {
        if (state_row == 24 || screen_row == 24 || ! elems->impl) {
            // If we're still on the first state, we must complete it
            // with blank rows before moving on to the second state.
            if (state_idx == 0) {
                while (state_row < 24 && screen_row < 24) {
                    display_render_row_to_uart(0);
                    state_row++;
                    screen_row++;
                }
                if (screen_row < 24) {
                    state_idx++;
                    state_row = 0;
                    elems = (display_elem*)&elems_time_hm;
                }
                else {
                    break;
                }
            }
            else {
                // If we're already on the second state then we'll
                // just complete the screen and then we're done.
                while (screen_row < 24) {
                    display_render_row_to_uart(0);
                    screen_row++;
                }
                break;
            }
        }
        const unsigned char *data_p = elems->impl(elems->arg, elem_row);
        if (! data_p) {
            elem_row = 0;
            elems++;
            continue;
        }

        if (skipped_rows < offset_amt) {
            elem_row++;
            state_row++;
            skipped_rows++;
            // but not screen_row, because we didn't actually
            // render anything.
            continue;
        }

        display_render_row_to_uart(*data_p);

        elem_row++;
        screen_row++;
        state_row++;
    }
}

void display_render_to_uart_vert(void) {
    // For vert, we visit both states concurrently and then shift their
    // pixel data about to make them render one on top of the other.

    // Keep track of where we are in the elems of both states.
    int elem_rows[2] = {0, 0};
    display_elem *elems[2] = {
        (display_elem*)&elems_time_hm,
        (display_elem*)&elems_time_hm
    };
    unsigned char data[2] = {0, 0};

    for (int screen_row = 0; screen_row < 24; screen_row++) {
        for (int state_idx = 0; state_idx < 2; state_idx++) {
            while (1) {
                if (elems[state_idx]->impl) {
                    const unsigned char *data_p = elems[state_idx]->impl(
                        elems[state_idx]->arg, elem_rows[state_idx]
                    );

                    if (data_p) {
                        data[state_idx] = *data_p;
                        elem_rows[state_idx]++;
                        break;
                    }

                    // Try the next element, then.
                    elem_rows[state_idx] = 0;
                    elems[state_idx]++;
                }
                else {
                    // We ran out of elements for this state, so
                    // we'll just fill the rest of the screen with
                    // blanks.
                    data[state_idx] = 0b00000000;
                    break;
                }
            }
        }
        unsigned char merged_data = (
            data[0] >> offset_amt |
            data[1] << (8 - offset_amt)
        );
        display_render_row_to_uart(merged_data);
    }

}

inline void display_render_to_uart(void) {
    switch (offset_dir) {
    case 'h':
        display_render_to_uart_horiz();
        break;
    case 'v':
        display_render_to_uart_vert();
        break;
    default:
        uart_println("Invalid offset direction");
    }
}

void display_render(void) {
    uart_println_int_hex("\x1b[0;0HState 0: ", display_states[0]);
    uart_println_int_hex("State 1: ", display_states[1]);
    uart_println("");
    uart_println_int_hex("Transition Offset:    ", (int)offset_amt);
    uart_println_int_hex("Transition Direction: ", (int)offset_dir);

    display_render_to_uart();
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

void anim_down_task(void) {
    TASK_START_EXT(anim_task, anim_task_pos);

    offset_dir = 'v';
    for (offset_amt = 0; offset_amt < 8; offset_amt++) {
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
        if (trans_task->buttons == BUTTON_DOWN) {
            display_states[0] = trans_task->new_state;
            display_states[1] = trans_task->old_state;
            anim_task.impl = anim_down_task;
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
