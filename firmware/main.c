
#include "lpc812.h"
#include "serial.h"
#include "i2c.h"
#include "buttons.h"
#include "scheduler.h"

volatile int pressed = 0;

void GPIO_isr(void) {
    PINT_IST = 0b10000;
}

void test_task(void) {
    TASK_START(test_task);

    static unsigned int buttons = 0;

    uart_println("I'm a test task");
    TASK_SLEEP(1000);
    uart_println("Try pressing the direction keys");
    while (1) {
        BUTTONS_READ(&buttons);
        if (buttons & BUTTON_UP) {
            uart_println("up");
        }
        if (buttons & BUTTON_DOWN) {
            uart_println("down");
        }
        if (buttons & BUTTON_LEFT) {
            uart_println("left");
        }
        if (buttons & BUTTON_RIGHT) {
            uart_println("right");
        }
    }
}

void main() {
    enable_interrupts();

    buttons_init();

    // Detect falling edge of the 1Hz square wave signal
    // from the RTC, which will cause us to wake up each
    // time the second value changes.
    SYSCON_PINTSEL4 = 16;
    NVIC_ISER0 |= BIT28;
    PINT_SIENF |= 1 << 4;

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
