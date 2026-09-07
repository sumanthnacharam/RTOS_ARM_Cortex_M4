#include <stdint.h>
#include "delay.h"
#include "rtos/rtos.h"
#include "uart/uart.h"
void delay(volatile uint32_t count) {
    while(count--);
}

/*int main(void) {
    // Enable GPIOA clock
    RCC_AHB1ENR |= (1 << 0);

    // Set PA5 as output
    GPIOA_MODER &= ~(3 << (5 * 2));
    GPIOA_MODER |=  (1 << (5 * 2));

    // Initialize SysTick
    SysTick_Init(16000);
 
    while (1) {
        GPIOA_ODR ^= (1 << 5);
        delay_ms(1000);
    }
}*/

void task1(void){
    while(1){
        GPIOA_ODR = (1 << 5);
        uart_print("Task 1 is running\n");
        RTOS_TaskDelay(1000);
        
    }
     

}

void task2(void){
     while(1){
     uart_print("Task 2 is running\n");
     RTOS_TaskDelay(1000);
     GPIOA_ODR = ~(1 << 5);
     }
   
}

void idle_task(void){
     while (1)
    {
        // Nothing to do
        // Optionally enter low-power mode
    }
}


int main(void) {
    // Enable GPIOA clock
    RCC_AHB1ENR |= (1 << 0);

    // Set PA5 as output
    GPIOA_MODER &= ~(3 << (5 * 2));
    GPIOA_MODER |=  (1 << (5 * 2));

    // Initialize SysTick
    SysTick_Init(16000);
    uart_init();

    uart_print("UART initialized\r\n");
    RTOS_init();
    RTOS_CreateTask(idle_task, 0);
    RTOS_CreateTask(task1, 2);
    RTOS_CreateTask(task2, 1);
    RTOS_CreateTask(idle_task, 0);
    uart_print("Starting RTOS\r\n");
    RTOS_Start();
    while (1)
    {
        
    }
}