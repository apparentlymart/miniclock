#include <stdint.h>
#include "lpc812.h"
#include "i2c.h"

// This module is written to support only one device at a time,
// which in this case is the DS3231M real-time clock module.
#define I2C_DEVICE_ADDR 0xd0

static i2c_buffer rx_buffer;

void I2C_isr(void);

void i2c_init() {
    // Enable clock to I2C
    SYSCON_SYSAHBCLKCTRL |= 1 << 5;

    // Take the I2C device out of reset
    SYSCON_PRESETCTRL |= 1 << 6;

    // SCL assigned to pin 11
    PINASSIGN8 &= ~0xff;
    PINASSIGN8 |= 11;

    // SDA assigned to pin 10
    PINASSIGN7 &= ~(0xff << 24);
    PINASSIGN7 |= 10 << 24;

    // Enable Master mode, and disable everything else.
    I2C_CFG = 1;

    // Enable "Master Pending" interrupt, and disable all others.
    I2C_INTENCLR = ~1;
    I2C_INTENSET = 1;

    // Divide system clock (60MHz) by 256 to get 234kHz I2C clock.
    // DS3231M has a maximum clock rate of 400kHz.
    I2C_CLKDIV = 256;

    // Minimum clock low/high times are two clock periods, or 2*4266us
    // This is much higher than the DS3131M's min periods of 1.3us
    // and 0.6us respectively.
    I2C_MSTTIME = 0;
}

void I2C_isr(void) {
    // We're not yet doing anything with the interrupt because the
    // prototype implementation is a polling/blocking one.
    int status = I2C_INTSTAT;
    // If it's the MSTPENDING interrupt
    if (status & BIT0) {
        // ...
    }
}

static inline void i2c_wait_for_master(void) {
    while (! (I2C_STAT & 1)) {
        // Just wait...
    }
}

void i2c_puts(const char *s, int len) {

    i2c_wait_for_master();

    // Device addr without read flag
    I2C_MSTDAT = I2C_DEVICE_ADDR;

    // Start transmission
    I2C_MSTCTL = 1 << 1;

    const char *end = s + len;
    for (; s < end; s++) {
        i2c_wait_for_master();

        // Write current data byte.
        I2C_MSTDAT = *s;

        // Continue transmission
        I2C_MSTCTL = 1;
    }

    i2c_wait_for_master();

    // End transmission
    I2C_MSTCTL = 1 << 2;

}

void i2c_gets(char *s, int len) {

    i2c_wait_for_master();

    // Device addr with read flag
    I2C_MSTDAT = I2C_DEVICE_ADDR | 1;

    // Start transmission
    I2C_MSTCTL = 1 << 1;

    char *end = s + len;
    for (; s < end; s++) {
        i2c_wait_for_master();

        // Read current data byte.
        *s = I2C_MSTDAT;

        // Continue transmission
        I2C_MSTCTL = 1;
    }

    i2c_wait_for_master();

    // End transmission
    I2C_MSTCTL = 1 << 2;
}
