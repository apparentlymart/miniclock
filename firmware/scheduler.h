#ifndef SCHEDULER_H
#define SCHEDULER_H

#define MILLIS_PER_WKT_TICK 100

struct sched_list_head_s;

typedef struct {
    struct sched_list_head_s *next;
    struct sched_list_head_s *prev;
} sched_list_head;

#define SCHED_TASK_COMMON sched_list_head list; void (*impl)(void)

typedef struct {
    SCHED_TASK_COMMON;
    // "subtypes" get 16 bytes into which they
    // can pack whatever state they want.
    char data_space[16];
} sched_task;

typedef struct {
    SCHED_TASK_COMMON;
    int wake_time;
} sched_timer_task;

void sched_run_task(sched_list_head *task);
void sched_queue_task(sched_list_head *queue, sched_list_head *task);

void sched_main_loop(void);

void sched_sleep(sched_task *task, int millis);

#endif
