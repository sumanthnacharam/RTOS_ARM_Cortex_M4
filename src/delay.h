#include <stdint.h>
#define PERIPH_BASE     0x40000000UL
#define AHB1_OFFSET     0x00020000UL
#define AHB1_BASE       (PERIPH_BASE + AHB1_OFFSET)

#define GPIOA_OFFSET    0x0000
#define RCC_OFFSET      0x3800

#define GPIOA_BASE      (AHB1_BASE + GPIOA_OFFSET)
#define RCC_BASE        (AHB1_BASE + RCC_OFFSET)

#define RCC_AHB1ENR     (*(volatile uint32_t*)(RCC_BASE + 0x30))
#define GPIOA_MODER     (*(volatile uint32_t*)(GPIOA_BASE + 0x00))
#define GPIOA_ODR       (*(volatile uint32_t*)(GPIOA_BASE + 0x14))

void SysTick_Init(uint32_t ticks);
void SysTick_Handler(void);
void delay_ms(uint32_t ms);