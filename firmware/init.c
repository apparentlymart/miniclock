#include "lpc812.h"

void init(void);
void clock_init();
void default_irq_handler(void);

// Exported by serial.o
extern void UART0_isr(void);

// The linker script refers to these, placing them at the boundaries
// between sections.
extern unsigned char INIT_DATA_VALUES;
extern unsigned char INIT_DATA_START;
extern unsigned char INIT_DATA_END;
extern unsigned char BSS_START;
extern unsigned char BSS_END;

// Vector table placed at the beginning of flash by the linker script.
const void * Vectors[] __attribute__((section(".vectors"))) = {
    (void *)(RAM_START+RAM_SIZE),   /* Top of stack */
    init,                           /* Reset Handler */
    default_irq_handler,            /* NMI */
    default_irq_handler,            /* Hard Fault */
    0,                              /* Reserved */
    0,                              /* Reserved */
    0,                              /* Reserved */
    0,                              /* Reserved */
    0,                              /* Reserved */
    0,                              /* Reserved */
    0,                              /* Reserved */
    default_irq_handler,            /* SVC */
    0,                              /* Reserved */
    0,                              /* Reserved */
    default_irq_handler,            /* PendSV */
    default_irq_handler,            /* SysTick */

    // Interrupt handlers
    default_irq_handler,            /* 0 SPI0_IRQ */
    default_irq_handler,            /* 1 SPI1_IRQ */
    default_irq_handler,            /* 2 RESERVED */
    UART0_isr,                      /* 3 UART0_IRQ */
    default_irq_handler,            /* 4 UART1_IRQ */
    default_irq_handler,            /* 5 UART2_IRQ */
    default_irq_handler,            /* 6 RESERVED */
    default_irq_handler,            /* 7 RESERVED */
    default_irq_handler,            /* 8 I2C0_IRQ */
    default_irq_handler,            /* 9 SCT_IRQ */
    default_irq_handler,            /* 10 MRT_IRQ */
    default_irq_handler,            /* 11 CMP_IRQ */
    default_irq_handler,            /* 12 WDT_IRQ */
    default_irq_handler,            /* 16 RESERVED */
    default_irq_handler,            /* 17 RESERVED */
    default_irq_handler,            /* 18 RESERVED */
    default_irq_handler,            /* 19 RESERVED */
    default_irq_handler,            /* 20 RESERVED */
    default_irq_handler,            /* 21 RESERVED */
    default_irq_handler,            /* 22 RESERVED */
    default_irq_handler,            /* 23 RESERVED */
    default_irq_handler,            /* 24 PININT0_IRQ */
    default_irq_handler,            /* 25 PININT1_IRQ */
    default_irq_handler,            /* 26 PININT2_IRQ */
    default_irq_handler,            /* 27 PININT3_IRQ */
    default_irq_handler,            /* 28 PININT4_IRQ */
    default_irq_handler,            /* 29 PININT5_IRQ */
    default_irq_handler,            /* 30 PININT6_IRQ */
    default_irq_handler,            /* 31 PININT7_IRQ */
};

void init() {
    // Copy global/static variables from ROM to RAM
    unsigned char *src;
    unsigned char *dest;
    unsigned len;
    src = &INIT_DATA_VALUES;
    dest = &INIT_DATA_START;
    for (len = &INIT_DATA_END - &INIT_DATA_START; len > 0; len--) {
        *dest++ = *src++;
    }

    // Zero out uninitialized global/static data
    dest = &BSS_START;
    for (len = &BSS_END - &BSS_START; len > 0; len--) {
        *dest++ = 0;
    }

    // Configure system to run at 60MHz using the internal
    // oscillator and the PLL.
    // (Main clock 60MHz, System clock 30MHz)
    SYSCON_SYSPLLCLKUEN = 0;
    SYSCON_SYSPLLCLKSEL = 0;
    SYSCON_SYSPLLCLKUEN = 1;
    while (!(SYSCON_SYSPLLCLKUEN & 0x01));
    SYSCON_SYSPLLCTRL = 4;
    SYSCON_PDRUNCFG &= ~(0x1 << 7); // Enable PLL
    while (!(SYSCON_SYSPLLSTAT & 0x01));

    SYSCON_MAINCLKUEN = 0;
    SYSCON_MAINCLKSEL = 3;
    SYSCON_MAINCLKUEN = 1;
    while (!(SYSCON_MAINCLKUEN & 0x01));

    SYSCON_SYSOSCCTRL = 0;


    // Run the main program.
    main();
}

void default_irq_handler() {
    // Sadly we don't have any simple output devices through which we
    // can signal an error safely, so we'll just halt.
    while(1);
}
