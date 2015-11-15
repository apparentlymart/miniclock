
#include "scheduler.h"
#include "buttons.h"
#include "serial.h"
#include "ui.h"
#include "clock.h"
#include "display.h"

void ui_task(void) {
    TASK_START(ui_task);

    static unsigned int buttons = 0;
    static int state = UI_TIME_HM;
    static int old_state = UI_BEGIN;

    while (1) {
        if (state != old_state) {
            DISPLAY_STATE_CHANGE(state, old_state, buttons);
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
                    clock_update_hour(1);
                    continue;
                case BUTTON_DOWN:
                    clock_update_hour(-1);
                    continue;
                default: continue;
            }

        case UI_SET_MIN:
            switch (buttons) {
                case BUTTON_LEFT:  state = UI_SET_HOUR;      continue;
                case BUTTON_RIGHT: state = UI_SET_SEC;       continue;
                case BUTTON_UP:
                    clock_update_min(1);
                    continue;
                case BUTTON_DOWN:
                    clock_update_min(-1);
                    continue;
                default: continue;
            }

        case UI_SET_SEC:
            switch (buttons) {
                case BUTTON_LEFT:  state = UI_SET_MIN;       continue;
                case BUTTON_UP:
                case BUTTON_DOWN:
                    clock_reset_sec();
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
