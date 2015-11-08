#ifndef BUTTONS_H
#define BUTTONS_H

#include "scheduler.h"

// These correspond to the bits that will be set in
// the GPIO port interrupt when each button is pressed.
typedef enum {
    BUTTON_UP = 1 << 17,
    BUTTON_DOWN = 1 << 13,
    BUTTON_LEFT = 1 << 3,
    BUTTON_RIGHT = 1 << 2
} button;

typedef struct {
    SCHED_TASK_COMMON;
    unsigned int *output;
} button_task;

void buttons_init(void);
void buttons_read(sched_task *task, unsigned int *output);

#define BUTTONS_READ(output) TASK_AWAIT_RAW(buttons_read(&__task, (output)))

#endif
