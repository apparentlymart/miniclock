#ifndef CLOCK_H
#define CLOCK_H

#include "scheduler.h"

typedef struct {
    unsigned char half_second;
    unsigned char seconds_bcd;
    unsigned char minutes_bcd;
    unsigned char hours_bcd;
    unsigned char weekday;
    unsigned char date_bcd;
    unsigned char month_bcd;
    unsigned char year_bcd;
} clock_instant;

extern clock_instant clock_time;

void clock_init(void);
void clock_await_change(sched_task *task);

#define CLOCK_AWAIT_CHANGE() TASK_AWAIT_RAW(clock_await_change(&__task))

void clock_update_hour(signed char delta);
void clock_update_min(signed char delta);
void clock_reset_sec(void);

#endif
