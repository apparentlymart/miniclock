
#include "lpc812.h"
#include "serial.h"
#include "i2c.h"
#include "scheduler.h"

volatile int pressed = 0;

void GPIO_isr(void) {
    pressed = !GPIO_W13;
    GPIO_B15 = pressed;
    PINT_IST = 0b11111;
}

void test_task(void) {
    TASK_START(test_task);

    while (1) {
        uart_println("I'm a test task");
        TASK_SLEEP(1000);
        uart_println("I'm still a test task");
        TASK_SLEEP(1000);
    }
}

void main() {
    enable_interrupts();

    // Set up the GPIO interrupts.
    SYSCON_PINTSEL0 = 17; // Up
    SYSCON_PINTSEL1 = 13; // Down
    SYSCON_PINTSEL2 = 3; // Left
    SYSCON_PINTSEL3 = 2; // Right
    SYSCON_PINTSEL4 = 16; // 1Hz square wave from RTC

    // Enable IRQs for the GPIO interrupts.
    NVIC_ISER0 |= BIT24;
    NVIC_ISER0 |= BIT25;
    NVIC_ISER0 |= BIT26;
    NVIC_ISER0 |= BIT27;
    NVIC_ISER0 |= BIT28;

    // Turn on detection of both rising and falling edges,
    // except for the 1Hz square wave where we only care
    // about falling, since that's where the second
    // increments.
    PINT_SIENR = 0b01111;
    PINT_SIENF = 0b11111;

    // Enable GPIO port clock
    SYSCON_SYSAHBCLKCTRL |= BIT6;

    // Pins 15 and 1 is a outputs, as temporary debugging signals.
    GPIO_DIRP0 |= 1 << 15;
    GPIO_DIRP0 |= 1 << 1;

    uart_init();
    uart_println("\x1b[2J\x1b[0;0Hbegin");
    sched_init();
    test_task();
    sched_main_loop(); // does not return

    uart_init();
    i2c_init();
    uart_puts("\x1b[2J");
    // Set control register 0xe to enable the 1Hz SQW signal.
    i2c_puts("\x0e\x00", 2);
    while (1) {

        // Wait until we get an interrupt.
        // Since we have a 1Hz square wave coming in on
        // GPIO16, we'll wake up at least twice per second.
        __asm volatile ("wfi");

        if (pressed) {
            uart_println("Button press world!\r\n");
        }
        else {
            i2c_puts("", 1); // write null for address 0
            char buf[3];
            i2c_gets((char*)&buf, 3);
            int time_val = ((buf[2] & 0b11111) << 16) | (buf[1] << 8) | buf[0] | (GPIO_W16 << 24);
            uart_puts("\x1b[0;0H");
            uart_put_int_hex(time_val);
        }
    }
}
