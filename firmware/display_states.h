#ifndef DISPLAY_STATES_H
#define DISPLAY_STATES_H

#include "ui.h"

typedef const unsigned char * (*display_elem_func)(int arg, int row);

typedef struct {
    display_elem_func impl;
    int arg;
    unsigned char blink;
} display_elem;

extern unsigned char display_elastic_space_size;

display_elem* display_elems_for_state(ui_state state);

#endif
