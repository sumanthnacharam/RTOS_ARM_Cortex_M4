#include "uart.h"

/* ============================
 * RCC Registers
 * ============================ */

#define RCC_BASE        0x40023800UL

#define RCC_AHB1ENR     (*(volatile uint32_t *)(RCC_BASE + 0x30))
#define RCC_APB1ENR     (*(volatile uint32_t *)(RCC_BASE + 0x40))


/* ============================
 * GPIOA Registers
 * ============================ */

#define GPIOA_BASE      0x40020000UL

#define GPIOA_MODER     (*(volatile uint32_t *)(GPIOA_BASE + 0x00))
#define GPIOA_AFRL      (*(volatile uint32_t *)(GPIOA_BASE + 0x20))


/* ============================
 * USART2 Registers
 * ============================ */

#define USART2_BASE     0x40004400UL

#define USART2_SR       (*(volatile uint32_t *)(USART2_BASE + 0x00))
#define USART2_DR       (*(volatile uint32_t *)(USART2_BASE + 0x04))
#define USART2_BRR      (*(volatile uint32_t *)(USART2_BASE + 0x08))
#define USART2_CR1      (*(volatile uint32_t *)(USART2_BASE + 0x0C))


/* ============================
 * USART2 Initialization
 * ============================ */

void uart_init(void)
{
    /*
     * 1. Enable GPIOA clock
     */
    RCC_AHB1ENR |= (1 << 0);


    /*
     * 2. Enable USART2 clock
     *
     * USART2 is connected to APB1.
     */
    RCC_APB1ENR |= (1 << 17);


    /*
     * 3. Configure PA2 as Alternate Function
     *
     * PA2 = USART2_TX
     *
     * MODER:
     * 00 = Input
     * 01 = Output
     * 10 = Alternate Function
     * 11 = Analog
     */

    GPIOA_MODER &= ~(3 << (2 * 2));
    GPIOA_MODER |=  (2 << (2 * 2));


    /*
     * 4. Configure PA2 for Alternate Function 7
     *
     * AF7 = USART1 / USART2 / USART3
     *
     * PA2 is in AFRL because pin number < 8.
     */

    GPIOA_AFRL &= ~(0xF << (2 * 4));
    GPIOA_AFRL |=  (7 << (2 * 4));


    /*
     * 5. Configure baud rate
     *
     * Assuming USART2 clock = 16 MHz
     *
     * Baud rate = 115200
     *
     * BRR ≈ 139
     */

    USART2_BRR = 139;


    /*
     * 6. Enable USART
     *
     * UE  = bit 13
     * TE  = bit 3
     */

    USART2_CR1 = (1 << 13) |
                 (1 << 3);
}


/* ============================
 * Send One Character
 * ============================ */

void uart_putc(char c)
{
    /*
     * Wait until transmit data register is empty.
     *
     * TXE = bit 7
     */

    while (!(USART2_SR & (1 << 7)))
    {
    }

    USART2_DR = c;
}


/* ============================
 * Send String
 * ============================ */

void uart_print(const char *str)
{
    while (*str)
    {
        uart_putc(*str);
        str++;
    }
}