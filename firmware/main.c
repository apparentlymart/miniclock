#include "lpc812.h"
#include "serial.h"
#include "i2c.h"
#include "buttons.h"
#include "ui.h"
#include "display.h"
#include "clock.h"
#include "scheduler.h"

volatile int pressed = 0;

void main() {
    enable_interrupts();

    // Enable GPIO port clock
    SYSCON_SYSAHBCLKCTRL |= BIT6;

    uart_init();
    uart_println("\x1b[2J\x1b[0;0Hbegin");
    sched_init();
    clock_init();
    buttons_init();
    display_init();
    ui_task();
    sched_main_loop(); // does not return
}
