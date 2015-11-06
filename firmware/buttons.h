#ifndef BUTTONS_H
#define BUTTONS_H

// These correspond to the bits that will be set in
// the "falling edge" interrupt status when each button
// is pressed.
typedef enum {
    BUTTON_UP = 1,
    BUTTON_DOWN = 2,
    BUTTON_LEFT = 4,
    BUTTON_RIGHT = 8
} button;

void buttons_init(void);
void buttons_get(void)

#endif
