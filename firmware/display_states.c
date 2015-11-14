
#include "display_states.h"
#include "digits.h"

const unsigned char space_row_data = 0;
const unsigned char colon_row_data = 0b00010100;

const unsigned char* display_space_row(int num, int row) {
    return row < num ? &space_row_data : 0;
}

const unsigned char* display_colon_row(int dummy, int row) {
    return row == 0 ? &colon_row_data : 0;
}

display_elem elems_empty[] = {
    { display_space_row, 1 },
    { 0, 0 },
};

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

display_elem* display_elems_for_state(ui_state state) {
    switch (state) {
    case UI_TIME_HM:
      return (display_elem*)elems_time_hm;
    default:
      return (display_elem*)elems_empty;
    }
}
