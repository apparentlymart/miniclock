#ifndef SPI_H
#define SPI_H

#include <stdint.h>
#include "scheduler.h"

typedef struct {
    SCHED_TASK_COMMON;
    uint32_t txdatctl;
} spi_tx_task;

void spi_init(void);
void spi_tx_8(uint8_t);
void spi_tx_16(uint16_t);

#endif
