#include <stdint.h>
#include "../src/delay.h"

extern int main(void);

extern uint32_t _estack;
extern uint32_t _sidata, _sdata, _edata;
extern uint32_t _sbss, _ebss;



extern void Reset_Handler(void);
void Default_Handler(void);
extern void PendSV_Handler(void);
extern void SVC_Handler(void);



// Vector table
__attribute__((section(".isr_vector")))
void (*vector_table[])(void) = {
    (void*)0x20020000,     // Initial MSP
    Reset_Handler,         // 1
    0, // NMI
    0, // HardFault
    0, // MemManage
    0, // BusFault
    0, // UsageFault
    0, 0, 0, 0,            // Reserved
    SVC_Handler, // SVC
    0, // DebugMon
    0, // Reserved
    PendSV_Handler, // PendSV
    SysTick_Handler        // ⭐ THIS MUST BE HERE (index 15)
};

// Reset handler
void Reset_Handler(void) {
    // Copy .data from FLASH to RAM
    uint32_t *src = &_sidata;
    uint32_t *dst = &_sdata;

    while (dst < &_edata) {
        *dst++ = *src++;
    }

    // Zero initialize .bss
    dst = &_sbss;
    while (dst < &_ebss) {
        *dst++ = 0;
    }

  // __asm("cpsie i"); // enable global interrupts
    main();

    while (1);
}

void Default_Handler(void) {
    while (1);
}