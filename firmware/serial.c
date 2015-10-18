#include "lpc812.h"
#include "serial.h"

static uart_buffer rx_buffer;

void UART0_isr(void);

void uart_init() {
    // Put the UART in reset mode.
    SYSCON_PRESETCTRL &= ~BIT3;

    rx_buffer.count = 0;
    rx_buffer.head = 0;
    rx_buffer.tail = 0;

    // Enable USART0 clock
    SYSCON_SYSAHBCLKCTRL |= BIT14;

    // Take the UART out of reset mode,
    SYSCON_PRESETCTRL |= BIT3;

    // Enable USART0 IRQs
    NVIC_ISER0 |= BIT3;

    // Map the USART0 pins to match the ISP pins.
    PINENABLE0 |= BIT0;
    PINASSIGN0 &= 0xffff0000;
    PINASSIGN0 |= 4; // TXD on PIO0_4
    PINASSIGN0 |= 0; // RXD on PIO0_0

    // UART Clock Divider for 9600 baud on 12MHz base clock.
    SYSCON_UARTCLKDIV = 1;
    // RX data is sampled 16 times faster than baud rate, so
    // we need to multiply the intended baud rate by 16.
    USART0_BRG = 78; // (12000000) / (9600*16);

    // Rnable RX interrupt
    USART0_INTENSET = BIT0;
    USART0_CTL = 0;

    // 8 data bits, 1 stop bit, no parity bit
    USART0_CFG |= BIT2 + BIT9 + BIT0;
}

void UART0_isr(void) {
    int source = USART0_INTSTAT;
    // If it's the RX interrupt
    if (source & BIT0) {
        uart_buffer_put(&rx_buffer, USART0_RXDAT);
    }
}

void uart_buffer_put(uart_buffer *sbuf, char c) {
    if (sbuf->count < SBUFSIZE) {
        disable_interrupts();
        sbuf->count++;
        sbuf->buffer[sbuf->head] = c;
        sbuf->head = (sbuf->head + 1) % SBUFSIZE;
        enable_interrupts();
    }
}

char uart_buffer_get(uart_buffer *sbuf) {
    char c = 0;
    if (sbuf->count >0 ) {
        disable_interrupts();
        sbuf->count--;
        c = sbuf->buffer[sbuf->tail];
        sbuf->tail = (sbuf->tail+1) % SBUFSIZE;
        enable_interrupts();
    }
    return c;
}

int uart_rx_buffer_count() {
    return rx_buffer.count;
}

void uart_putc(char c) {
    int timeout=0xffff;
    // Poll for the transmitter to become ready, but
    // time out if it doesn't become ready in time.
    while ((timeout--) && ((USART0_STAT & BIT2)==0));

    USART0_TXDAT = c;
}

void uart_puts(const char *s) {
    for (; *s; s++) {
        uart_putc(*s);
        s++;
    }
}

char uart_getc() {
    return uart_buffer_get(&rx_buffer);
}

void uart_println(const char *s) {
    uart_puts(s);
    uart_puts("\r\n");
}
