#include <stddef.h>
#include "rtos.h"
#include "../uart/uart.h"

static TCB_t task_list[MAX_TASKS];
static uint32_t task_stacks[MAX_TASKS][STACK_SIZE]; // To save the stacks for each task.

static uint32_t task_count = 0;

TCB_t *current_task = NULL;
TCB_t *next_task = NULL;

void RTOS_init(void)
{
    task_count = 0;
    current_task = NULL;
    next_task = NULL;
}

int RTOS_CreateTask(
    void (*task_function)(void),
    uint32_t priority)
{
    if (task_count >= MAX_TASKS)
    {
        return -1; // Error: Maximum number of tasks reached
    }

    TCB_t *task = &task_list[task_count];

    task->id = task_count + 1; // Assign a unique ID to the task;
    task->priority = priority;
    task->state = TASK_READY;
    task->task_function = task_function;

     /*
     * Start at the top of the task's stack.
     */

    uint32_t *sp =
        &task_stacks[task_count][STACK_SIZE];


    /*
     * Cortex-M exception return frame.
     *
     * When the task starts, the CPU will
     * restore these values automatically.
     */

    *(--sp) = 0x01000000;              // xPSR

    *(--sp) = (uint32_t)task_function; // PC

    *(--sp) = 0xFFFFFFFD;              // LR

    *(--sp) = 0;                       // R12

    *(--sp) = 0;                       // R3

    *(--sp) = 0;                       // R2

    *(--sp) = 0;                       // R1

    *(--sp) = 0;                       // R0

   /*
     * Software-saved registers R4-R11.
     */

    *(--sp) = 0; // R11
    *(--sp) = 0; // R10
    *(--sp) = 0; // R9
    *(--sp) = 0; // R8
    *(--sp) = 0; // R7
    *(--sp) = 0; // R6
    *(--sp) = 0; // R5
    *(--sp) = 0; // R4

    task->sp = sp;


    task_count++;
    return 0; // Success
}

void RTOS_Schedule(void)
{
    TCB_t *Selected_task = NULL;
    for (uint32_t task_index = 0; task_index < task_count; task_index++)
    {
        if (task_list[task_index].state == TASK_READY)
        {

            if (Selected_task == NULL || task_list[task_index].priority > Selected_task->priority)
            {
                Selected_task = &task_list[task_index];
            }
        }
    }

        if(Selected_task != NULL)
        {
            next_task = Selected_task;
        }
        
    
}

/* -----------------------------------------
 * Task Delay
 * ----------------------------------------- */

void RTOS_TaskDelay(uint32_t ms)
{
    current_task->delay = ms;

    current_task->state = TASK_BLOCKED;

    RTOS_Schedule();

    /*
     * Request context switch.
     *
     * PendSV = exception number 14.
     *
     * ICSR = 0xE000ED04
     * PENDSVSET = bit 28
     */

    (*(volatile uint32_t *)0xE000ED04)
        |= (1UL << 28);

    // uart_print("Selected task: ");
    // uart_putc(current_task->id + 0x30);
}


/* -----------------------------------------
 * RTOS Tick
 * ----------------------------------------- */

void RTOS_Tick(void)
{
    for (uint32_t task_index = 0;
         task_index < task_count;
         task_index++)
    {
        if (task_list[task_index].state == TASK_BLOCKED)
        {
            if (task_list[task_index].delay > 0)
            {
                // uart_print("T ");
                // uart_putc(task_list[task_index].id + 0x30);
                task_list[task_index].delay--;
                // uart_putc('B');
                // uart_putc(task_list[task_index].id + 0x30);
                if (task_list[task_index].delay == 0)
                {
                    task_list[task_index].state = TASK_READY;
                        RTOS_Schedule();
                        if(next_task != current_task){
                            (*(volatile uint32_t *)0xE000ED04)
                                |= (1UL << 28);
                        }
                    // uart_putc(task_list[task_index].id+ 0x30);
                    // uart_print(" is now ready.\r\n");
                }
            }
        }
    }
}


void RTOS_Start(void)
{
    /*
     * Select the highest-priority task.
     */
    uart_print("RTOS_Start\r\n");

    RTOS_Schedule();

    uart_print("Schedule done\r\n");

    current_task = next_task;
    current_task->state = TASK_RUNNING;

    uart_print("Calling SVC\r\n");

    __asm volatile ("svc #0");
    /*
     * Should never return here.
     */
    while (1)
    {
    }
}