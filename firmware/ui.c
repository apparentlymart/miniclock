
#include "scheduler.h"
#include "buttons.h"
#include "serial.h"
#include "ui.h"

typedef enum {
    UI_BEGIN = 0,
    UI_TIME_HM, // Time: HH:MM
    UI_TIME_MS, // Time: MM:SS
    UI_DATE_WD, // Date: Weekday, Day of month
    UI_DATE_DM, // Date: Day of month, month
    UI_MENU_SET_TIME, // "Set Time" menu option
    UI_MENU_SET_DATE, // "Set Date" menu option
    UI_SET_HOUR, // Hour selected to set
    UI_SET_MIN,  // Minute selected to set
    UI_SET_SEC,  // Second selected to set
    UI_SET_YEAR, // Year selected to set
    UI_SET_MONTH, // Month selected to set
    UI_SET_DAY,  // Day of month selected to set
} ui_state;

void ui_task(void) {
    TASK_START(ui_task);

    static unsigned int buttons = 0;
    static int state = UI_TIME_HM;
    static int old_state = UI_BEGIN;

    while (1) {
        if (state != old_state) {
            // TODO: Notify the display of the state change.
            // State change is a blocking operation so that the
            // display can do an animation.
            // For now, some debug output.
            uart_println("UI state changed");
            uart_println_int_hex("Old State: ", (unsigned int)old_state);
            uart_println_int_hex("New State: ", (unsigned int)state);
        }
        BUTTONS_READ(&buttons);
        old_state = state;

        switch (state) {
        case UI_TIME_HM:
            switch (buttons) {
                case BUTTON_UP:    state = UI_DATE_WD;       continue;
                case BUTTON_DOWN:  state = UI_DATE_WD;       continue;
                case BUTTON_LEFT:  state = UI_TIME_MS;       continue;
                case BUTTON_RIGHT: state = UI_MENU_SET_TIME; continue;
                default: continue;
            }

        case UI_TIME_MS:
            switch (buttons) {
                case BUTTON_UP:    state = UI_DATE_DM;       continue;
                case BUTTON_DOWN:  state = UI_DATE_DM;       continue;
                case BUTTON_RIGHT: state = UI_TIME_HM;       continue;
                default: continue;
            }

        case UI_DATE_WD:
            switch (buttons) {
                case BUTTON_UP:    state = UI_TIME_HM;       continue;
                case BUTTON_DOWN:  state = UI_TIME_HM;       continue;
                case BUTTON_LEFT:  state = UI_DATE_DM;       continue;
                case BUTTON_RIGHT: state = UI_MENU_SET_DATE; continue;
                default: continue;
            }

        case UI_DATE_DM:
            switch (buttons) {
                case BUTTON_UP:    state = UI_TIME_MS;       continue;
                case BUTTON_DOWN:  state = UI_TIME_MS;       continue;
                case BUTTON_RIGHT: state = UI_DATE_WD;       continue;
                default: continue;
            }

        case UI_MENU_SET_TIME:
            switch (buttons) {
                case BUTTON_UP:    state = UI_MENU_SET_DATE; continue;
                case BUTTON_DOWN:  state = UI_MENU_SET_DATE; continue;
                case BUTTON_LEFT:  state = UI_TIME_HM;       continue;
                case BUTTON_RIGHT: state = UI_SET_HOUR;      continue;
                default: continue;
            }

        case UI_MENU_SET_DATE:
            switch (buttons) {
                case BUTTON_UP:    state = UI_MENU_SET_TIME; continue;
                case BUTTON_DOWN:  state = UI_MENU_SET_TIME; continue;
                case BUTTON_LEFT:  state = UI_DATE_WD;       continue;
                case BUTTON_RIGHT: state = UI_SET_YEAR;      continue;
                default: continue;
            }

        case UI_SET_HOUR:
            switch (buttons) {
                case BUTTON_LEFT:  state = UI_MENU_SET_TIME; continue;
                case BUTTON_RIGHT: state = UI_SET_MIN;       continue;
                case BUTTON_UP:
                    // TODO: Increment the hour
                    continue;
                case BUTTON_DOWN:
                    // TODO: Decrement the hour
                    continue;
                default: continue;
            }

        case UI_SET_MIN:
            switch (buttons) {
                case BUTTON_LEFT:  state = UI_SET_HOUR;      continue;
                case BUTTON_RIGHT: state = UI_SET_SEC;       continue;
                case BUTTON_UP:
                    // TODO: Increment the minute
                    continue;
                case BUTTON_DOWN:
                    // TODO: Decrement the minute
                    continue;
                default: continue;
            }

        case UI_SET_SEC:
            switch (buttons) {
                case BUTTON_LEFT:  state = UI_SET_MIN;       continue;
                case BUTTON_UP:
                case BUTTON_DOWN:
                    // TODO: Reset the second
                    continue;
                default: continue;
            }

        case UI_SET_YEAR:
            switch (buttons) {
                case BUTTON_LEFT:  state = UI_MENU_SET_DATE; continue;
                case BUTTON_RIGHT: state = UI_SET_MONTH;     continue;
                case BUTTON_UP:
                    // TODO: Increment the year
                    continue;
                case BUTTON_DOWN:
                    // TODO: Decrement the year
                    continue;
                default: continue;
            }

        case UI_SET_MONTH:
            switch (buttons) {
                case BUTTON_LEFT:  state = UI_SET_YEAR;      continue;
                case BUTTON_RIGHT: state = UI_SET_DAY;       continue;
                case BUTTON_UP:
                    // TODO: Increment the month
                    continue;
                case BUTTON_DOWN:
                    // TODO: Decrement the month
                    continue;
                default: continue;
            }

        case UI_SET_DAY:
            switch (buttons) {
                case BUTTON_LEFT:  state = UI_SET_MONTH;    continue;
                case BUTTON_UP:
                    // TODO: Increment the day
                    continue;
                case BUTTON_DOWN:
                    // TODO: Decrement the day
                    continue;
                default: continue;
            }
        }
    }
}
