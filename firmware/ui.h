#ifndef UI_H
#define UI_H

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

void ui_task(void);

#endif
