
#include "display_states.h"
#include "clock.h"
#include "chars.h"
#include "digits.h"

typedef enum {
    SECOND_UNITS,
    SECOND_TENS,
    MINUTE_UNITS,
    MINUTE_TENS,
    HOUR_UNITS,
    HOUR_TENS,
    WEEKDAY,
    DATE_UNITS,
    DATE_TENS,
    MONTH,
    YEAR_UNITS,
    YEAR_TENS,
} TIME_ELEMENT;

unsigned char display_elastic_space_size = 0;

const unsigned char space_row_data = 0;
const unsigned char colon_row_data = 0b00010100;

const unsigned char* display_space_row(int num, int row) {
    return row < num ? &space_row_data : 0;
}

// The "elastic space" element allows a state to include a
// space whose size can vary at runtime. This is used for
// certain state-to-state transitions where a full-screen
// transition is not appropriate.
const unsigned char* display_elastic_space_row(int dummy, int row) {
    return row < display_elastic_space_size ? &space_row_data : 0;
}

const unsigned char* display_colon_row(int dummy, int row) {
    return row == 0 ? &colon_row_data : 0;
}

const unsigned char* clock_element_row(int element, int row) {
    int val = 0;
    switch (element) {
    case HOUR_TENS:
        val = clock_time.hours_bcd >> 4;
        goto digit;
    case HOUR_UNITS:
        val = clock_time.hours_bcd & 0b1111;
        goto digit;
    case MINUTE_TENS:
        val = clock_time.minutes_bcd >> 4;
        goto digit;
    case MINUTE_UNITS:
        val = clock_time.minutes_bcd & 0b1111;
        goto digit;
    case SECOND_TENS:
        val = clock_time.seconds_bcd >> 4;
        goto digit;
    case SECOND_UNITS:
        val = clock_time.seconds_bcd & 0b1111;
        goto digit;
    default:
        // Invalid clock element
        return 0b00000000;
    }

 digit:
    return digits_row(val, row);
}

display_elem elems_empty[] = {
    { display_space_row, 1, 0 },
    { 0, 0, 0 },
};

display_elem elems_time_hm[] = {
    { display_space_row, 2, 0 },
    { clock_element_row, HOUR_TENS, 0 },
    { display_space_row, 1, 0 },
    { clock_element_row, HOUR_UNITS, 0 },
    { display_space_row, 1, 0 },
    { display_colon_row, 0, 1 },
    { display_space_row, 1, 0 },
    { clock_element_row, MINUTE_TENS, 0 },
    { display_space_row, 1, 0 },
    { clock_element_row, MINUTE_UNITS, 0 },
    { 0, 0, 0 },
};

display_elem elems_time_ms[] = {
    { display_space_row, 2, 0 },
    { display_elastic_space_row, 0, 0 },
    { clock_element_row, MINUTE_TENS, 0 },
    { display_space_row, 1, 0 },
    { clock_element_row, MINUTE_UNITS, 0 },
    { display_space_row, 1, 0 },
    { display_colon_row, 0, 1 },
    { display_space_row, 1, 0 },
    { clock_element_row, SECOND_TENS, 0 },
    { display_space_row, 1, 0 },
    { clock_element_row, SECOND_UNITS, 0 },
    { 0, 0, 0 },
};

display_elem elems_menu_set_time[] = {
    { chars_row, (int)'C', 0 },
    { chars_row, (int)'h', 0 },
    { chars_row, (int)'T', 0 },
    { chars_row, (int)'i', 0 },
    { chars_row, (int)'m', 0 },
    { chars_row, (int)'e', 0 },
    { 0, 0, 0 },
};

display_elem elems_menu_set_date[] = {
    { chars_row, (int)'C', 0 },
    { chars_row, (int)'h', 0 },
    { chars_row, (int)'D', 0 },
    { chars_row, (int)'a', 0 },
    { chars_row, (int)'t', 0 },
    { chars_row, (int)'e', 0 },
    { 0, 0, 0 },
};

display_elem* display_elems_for_state(ui_state state) {
    switch (state) {
    case UI_TIME_HM:
      return (display_elem*)elems_time_hm;
    case UI_TIME_MS:
      return (display_elem*)elems_time_ms;
    case UI_MENU_SET_TIME:
      return (display_elem*)elems_menu_set_time;
    case UI_MENU_SET_DATE:
      return (display_elem*)elems_menu_set_date;
    default:
      return (display_elem*)elems_empty;
    }
}
