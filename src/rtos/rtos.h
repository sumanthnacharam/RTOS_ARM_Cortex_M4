#ifndef RTOS_H
#define RTOS_H

#include <stdint.h>
#define MAX_TASKS 4
#define STACK_SIZE      256

typedef enum{
    TASK_READY,
    TASK_RUNNING,
    TASK_BLOCKED,
} task_state_t;

typedef struct{
   
    uint32_t *sp;
    uint32_t priority;
    uint32_t delay;
    uint32_t id;
    task_state_t state;
    
    void (*task_function)(void);

}TCB_t;

void RTOS_init(void);

int RTOS_CreateTask(
    void (*task_function)(void), 
    uint32_t priority
);

void RTOS_Start(void);
void RTOS_Schedule(void);
void RTOS_TaskDelay(uint32_t ms);
void RTOS_Tick(void);

/* Called by PendSV assembly */
void RTOS_ContextSwitch(void);
void idle_task(void);

#endif // RTOS_H