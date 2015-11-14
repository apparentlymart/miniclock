#ifndef DISPLAY_STATES_H
#define DISPLAY_STATES_H

#include "ui.h"

typedef const unsigned char * (*display_elem_func)(int arg, int row);

typedef struct {
    display_elem_func impl;
    int arg;
} display_elem;

display_elem* display_elems_for_state(ui_state state);

#endif
