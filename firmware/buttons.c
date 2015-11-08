
#include "lpc812.h"
#include "buttons.h"
#include "scheduler.h"

// List of tasks that are blocked waiting for button presses.
// The head of the list will become runnable each time at least
// one button is pressed at the end of the debounce period.
sched_list_head button_tasks;

volatile int debouncing = 0;
sched_task debounce_task;

void Buttons_debounce_timeout(void) {
    // Mask for only the GPIO pins that have buttons
    // connected. We don't care about the others.
    unsigned int buttons = (~GPIO_PORT0) & (
        BUTTON_UP |
        BUTTON_DOWN |
        BUTTON_LEFT |
        BUTTON_RIGHT
    );
    // Are any buttons actually pressed?
    if (buttons != 0) {
        // Do we have anyone waiting for a button press?
        sched_list_head *waiter = button_tasks.next;
        if (waiter != &button_tasks) {
            button_task *button_waiter = (button_task*)waiter;
            *(button_waiter->output) = buttons;
            sched_run_task((sched_task*)waiter);
        }
    }
    sched_dequeue_task(&debounce_task);
    debouncing = 0;
}

void Buttons_isr(void) {
    if (! debouncing) {
        debouncing = 1;
        // Wait ~50ms for things to settle before we
        // actually sample the GPIO port.
        task_sleep(&debounce_task, 50);
    }

    // Clear all the button interrupt flags.
    PINT_IST = 0b1111;
}

void buttons_init(void) {

    // Set up the GPIO interrupts.
    SYSCON_PINTSEL0 = 17; // Up
    SYSCON_PINTSEL1 = 13; // Down
    SYSCON_PINTSEL2 = 3; // Left
    SYSCON_PINTSEL3 = 2; // Right

    // Enable IRQs for the GPIO interrupts.
    NVIC_ISER0 |= BIT24;
    NVIC_ISER0 |= BIT25;
    NVIC_ISER0 |= BIT26;
    NVIC_ISER0 |= BIT27;

    // Turn on detection of both rising and falling edges.
    PINT_SIENR |= 0b1111;
    PINT_SIENF |= 0b1111;

    sched_init_task_head(&button_tasks);
    sched_init_task(&debounce_task, Buttons_debounce_timeout);
}

void buttons_read(sched_task *task, unsigned int *output) {
    button_task *button_waiter = (button_task*)task;
    button_waiter->output = output;
    *output = 0;

    sched_queue_task(&button_tasks, task);
}
