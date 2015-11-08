#ifndef SCHEDULER_H
#define SCHEDULER_H

#define MILLIS_PER_WKT_TICK 100

typedef void (*sched_task_impl)(void);

struct sched_list_head_s {
    struct sched_list_head_s *next;
    struct sched_list_head_s *prev;
};

typedef struct sched_list_head_s sched_list_head;

#define SCHED_TASK_COMMON sched_list_head list; sched_task_impl impl

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

// sched_ functions are API for drivers to call.
void sched_init_task_head(sched_list_head *task);
void sched_init_task(sched_task *task, sched_task_impl impl);
void sched_run_task(sched_task *task);
void sched_queue_task(sched_list_head *queue, sched_task *task);

void sched_init(void);
void sched_main_loop(void);

// task_ functions are API for tasks to call.
void task_sleep(sched_task *task, int millis);

#endif
