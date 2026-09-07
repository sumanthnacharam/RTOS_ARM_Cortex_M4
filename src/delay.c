#include "delay.h"
#include "rtos/rtos.h"
#define SYST_CSR    (*(volatile uint32_t*)0xE000E010)
#define SYST_RVR    (*(volatile uint32_t*)0xE000E014)
#define SYST_CVR    (*(volatile uint32_t*)0xE000E018)
#define SYST_CALIB  (*(volatile uint32_t*)0xE000E01C)

static volatile uint32_t ms_ticks = 0; // incremented in SysTick handler

void SysTick_Init(uint32_t ticks) {
    SYST_RVR = 16000 - 1;      // reload value
    SYST_CVR = 0;               // clear current value
    SYST_CSR = 0x07;            // enable SysTick, interrupt, processor clock
}

// Call in SysTick interrupt:
void SysTick_Handler(void) {
    //GPIOA_ODR ^= (1 << 5);
    ms_ticks++;
    RTOS_Tick();

}

// Delay function
void delay_ms(uint32_t ms) {
    uint32_t start = ms_ticks;
    while ((ms_ticks - start) < ms);
}