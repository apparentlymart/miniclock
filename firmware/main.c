
#include "lpc812.h"
#include "serial.h"

void main() {
    enable_interrupts();

    uart_init();
    while (1) {
        uart_println("Hello world!\r\n");
    }
}
