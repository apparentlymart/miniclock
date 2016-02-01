#include "spi.h"
#include "scheduler.h"
#include "lpc812.h"

// TEMP DEBUG
#include "serial.h"

sched_list_head spi_tx_tasks;
sched_task *active_tx_task = 0;

void spi_init(void) {
    // Init our task queue first, since the code above will
    // cause our interrupt handler to fire and we need to make
    // sure the queue is valid (though empty) before that happens.
    sched_init_task_head(&spi_tx_tasks);

    // Put the SPI device in reset mode
    SYSCON_PRESETCTRL &= ~BIT0;

    // Enable SPI clock
    SYSCON_SYSAHBCLKCTRL |= BIT11;

    // Pin assignments for SPI0
    PINASSIGN3 |= (8 << 24);  // SCK
    PINASSIGN4 |= (9 << 0);   // MOSI
    PINASSIGN4 |= (1 << 8);   // MISO
    PINASSIGN4 |= (15 << 16); // SSEL

    // Take SPI out of reset mode
    SYSCON_PRESETCTRL |= BIT0;

    SPI0_CFG = (
        BIT0 |  // Enable
        BIT2    // Master Mode
    );
    SPI0_DLY = (
        (0xf << 0) |  // pre delay
        (0xf << 4) |  // post delay
        (0xf << 12)   // transfer delay
    );
    SPI0_DIV = 0xffff; // slowest SPI clock speed
}

static inline void spi_wait_for_master_idle(void) {
    while (! (SPI0_STAT & BIT8)) {
        // Just wait...
    }
}

void spi_tx_8(uint8_t val) {
    uint32_t txdatctl = (
        (7 << 24) | // Transmission length is 8 bits
        BIT22 |     // RXIGNORE
        BIT20 |     // End of transmission
        val
    );

    spi_wait_for_master_idle();
    SPI0_TXDATCTL = txdatctl;
}

void spi_tx_16(uint16_t val) {
    uint32_t txdatctl = (
        (15 << 24) | // Transmission length is 16 bits
        BIT22 |      // RXIGNORE
        BIT20 |      // End of transmission
        val
    );

    spi_wait_for_master_idle();
    SPI0_TXDATCTL = txdatctl;
}
