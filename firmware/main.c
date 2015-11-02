
#include "lpc812.h"
#include "serial.h"

volatile int pressed = 0;

void GPIO_isr(void) {
    pressed = !GPIO_W13;
    GPIO_B15 = pressed;
    PINT_IST = 0b11111;
}

void main() {
    enable_interrupts();

    // Set up the GPIO interrupts.
    SYSCON_PINTSEL0 = 17; // Up
    SYSCON_PINTSEL1 = 13; // Down
    SYSCON_PINTSEL2 = 3; // Left
    SYSCON_PINTSEL3 = 2; // Right
    SYSCON_PINTSEL4 = 10; // 1Hz square wave from RTC

    // Enable IRQs for the GPIO interrupts.
    NVIC_ISER0 |= BIT24;
    NVIC_ISER0 |= BIT25;
    NVIC_ISER0 |= BIT26;
    NVIC_ISER0 |= BIT27;
    //NVIC_ISER0 |= BIT28;

    // Turn on detection of both rising and falling edges.
    PINT_SIENR = 0b11111;
    PINT_SIENF = 0b11111;

    // Enable GPIO port clock
    SYSCON_SYSAHBCLKCTRL |= BIT6;

    // Pin 15 is an output, as a temporary debugging signal.
    GPIO_DIRP0 |= 1 << 15;

    uart_init();
    while (1) {
        if (pressed) {
            uart_println("Button press world!\r\n");
        }
        else {
            uart_println("Hello world!\r\n");
        }
    }
}
