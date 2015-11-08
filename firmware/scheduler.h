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

// Helper macros to produce the protothread boilerplate for
// task implementations.

// TASK_START must be the very first "statement" in a task implementation
// function, and its argument must be the name of the task function.
#define TASK_START(name)                 \
    static void *__task_pos = 0;         \
    static sched_task __task;            \
    if (__task_pos != 0) {               \
        goto *__task_pos;                \
    }                                    \
    sched_init_task(&__task, name);      \
    sched_run_task(&__task);             \
    __task_pos = &&__task_start;         \
    return;                              \
    __task_start:

// This extra indirection is required to get __LINE__ to actually expand.
#define TASK_LINE_LABEL_ACTUAL(line) __task_cont_ ## line
#define TASK_LINE_LABEL(line) TASK_LINE_LABEL_ACTUAL(line)
#define TASK_AWAIT_RAW(setup_expr)            \
    __task_pos = &&TASK_LINE_LABEL(__LINE__); \
    (setup_expr);                             \
    return;                                   \
    TASK_LINE_LABEL(__LINE__):

#define TASK_SLEEP(sleep_time) TASK_AWAIT_RAW(task_sleep(&__task, (sleep_time)))

#endif
