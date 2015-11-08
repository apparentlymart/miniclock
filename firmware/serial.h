#ifndef SERIAL_H
#define SERIAL_H

#define SBUFSIZE 16

typedef struct {
	volatile unsigned head;
	volatile unsigned tail;
	volatile unsigned count;
	char buffer[SBUFSIZE];
} uart_buffer;

void uart_init(void);
void uart_buffer_put(uart_buffer *sbuf, char c);
char uart_buffer_get(uart_buffer *sbuf);
int uart_rx_buffer_count();

char uart_getc(void);
void uart_putc(const char c);
void uart_puts(const char *s);
void uart_put_int_hex(unsigned int val);

void uart_println(const char *s);
void uart_println_int_hex(const char *caption, unsigned int val);

#endif
