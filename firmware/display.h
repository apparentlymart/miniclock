#ifndef DISPLAY_H
#define DISPLAY_H

#include "scheduler.h"
#include "buttons.h"
#include "ui.h"

typedef struct {
    SCHED_TASK_COMMON;
    ui_state new_state;
    ui_state old_state;
    button buttons;
} display_transition_task;

typedef const unsigned char * (*display_elem_func)(int arg, int row);

typedef struct {
    display_elem_func impl;
    int arg;
} display_elem;

void display_init(void);

void display_state_change(
    sched_task *task,
    ui_state new_state,
    ui_state old_state,
    button buttons
);

#define DISPLAY_STATE_CHANGE(new_state, old_state, buttons) \
    TASK_AWAIT_RAW( \
        display_state_change(&__task, (new_state), (old_state), (buttons)) \
    )

#endif
