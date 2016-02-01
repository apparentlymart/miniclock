#include "spi.h"
#include "scheduler.h"
#include "lpc812.h"

// TEMP DEBUG
#include "serial.h"

#define SCLK GPIO_B8
#define MOSI GPIO_B9
#define SSEL GPIO_B15

void spi_init(void) {

    // For now we use bit-bang SPI. Honestly, this is just because I
    // couldn't figure out how to get the SPI bus to work as needed
    // for these devices. In future I might have another go at it.

    // GPIO pin configuration
    GPIO_DIRP0 |= BIT8;  // SCLK output
    GPIO_DIRP0 |= BIT9;  // MOSI output
    GPIO_DIRP0 |= BIT15; // SSEL output

    // SSEL is active low, so start high for unasserted
    SSEL = 1;

    // Rising edge of clock is data transmit
    SCLK = 0;
}

static void _spi_tx(uint32_t val, int bits) {
    for (int i = 0; i < 256; i++) {
        SSEL = 0;
    }
    int ofs = bits - 1;
    for (int i = bits; i > 0; i--) {
        for (int j = 0; j < 128; j++) {
            MOSI = (val >> ofs) & 1;
        }
        for (int j = 0; j < 128; j++) {
            SCLK = 1;
        }
        val <<= 1;
        for (int j = 0; j < 128; j++) {
            MOSI = 0;
        }
        for (int j = 0; j < 128; j++) {
            SCLK = 0;
        }
    }
    MOSI = 0;
    for (int i = 0; i < 512; i++) {
        SSEL = 1;
    }
}

void spi_tx_8(uint8_t val) {
    _spi_tx(val, 8);
}

void spi_tx_16(uint16_t val) {
    _spi_tx(val, 16);
}
