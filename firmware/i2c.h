#ifndef I2C_H
#define I2C_H

#define I2CBUFSIZE 16

typedef struct {
	volatile unsigned head;
	volatile unsigned tail;
	volatile unsigned count;
	char buffer[I2CBUFSIZE];
} i2c_buffer;

void i2c_init(void);

void i2c_puts(const char *s, int len);
void i2c_gets(char *s, int len);

#endif
