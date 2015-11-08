#include "lpc812.h"

void init(void);
void clock_init();
void default_irq_handler(void);
void hard_fault_handler(void);
void nmi_handler(void);

// Exported by serial.o
extern void UART0_isr(void);

// Exported by i2c.o
extern void I2C_isr(void);

// Exported by main.o
extern void GPIO_isr(void);

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
    nmi_handler,                    /* NMI */
    hard_fault_handler,             /* Hard Fault */
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
    I2C_isr,                        /* 8 I2C0_IRQ */
    default_irq_handler,            /* 9 SCT_IRQ */
    default_irq_handler,            /* 10 MRT_IRQ */
    default_irq_handler,            /* 11 CMP_IRQ */
    default_irq_handler,            /* 12 WDT_IRQ */
    default_irq_handler,            /* 13 BOD_IRQ */
    default_irq_handler,            /* 14 RESERVED */
    default_irq_handler,            /* 15 WKT_IRQ */
    default_irq_handler,            /* 16 RESERVED */
    default_irq_handler,            /* 17 RESERVED */
    default_irq_handler,            /* 18 RESERVED */
    default_irq_handler,            /* 19 RESERVED */
    default_irq_handler,            /* 20 RESERVED */
    default_irq_handler,            /* 21 RESERVED */
    default_irq_handler,            /* 22 RESERVED */
    default_irq_handler,            /* 23 RESERVED */
    GPIO_isr,                       /* 24 PININT0_IRQ */
    GPIO_isr,                       /* 25 PININT1_IRQ */
    GPIO_isr,                       /* 26 PININT2_IRQ */
    GPIO_isr,                       /* 27 PININT3_IRQ */
    GPIO_isr,                       /* 28 PININT4_IRQ */
    GPIO_isr,                       /* 29 PININT5_IRQ */
    GPIO_isr,                       /* 30 PININT6_IRQ */
    GPIO_isr,                       /* 31 PININT7_IRQ */
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
    // (Main clock 60MHz, System clock 60MHz)
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
    SYSCON_SYSAHBCLKDIV = 1; // System clock == Main clock ( / 1 )
    while (!(SYSCON_MAINCLKUEN & 0x01));

    SYSCON_SYSOSCCTRL = 0;


    // Run the main program.
    main();
}

void spin_wave(unsigned char threshold) {
    // For the moment we have pin 15 available to probe as a debugging
    // output. This will stop being true once we have a display
    // connected, but for the moment we'll pulse GPIO0_15 in a loop
    // as the signal that we've executed an invalid interrupt.
    unsigned char count;
    while (1) {
        count++;
        if (count < threshold) {
            GPIO_B15 = 1;
        }
        else {
            GPIO_B15 = 0;
        }
    }
}

void default_irq_handler() {
    // For the moment we have pin 15 available to probe as a debugging
    // output. This will stop being true once we have a display
    // connected, but for the moment we'll pulse GPIO0_15 in a loop
    // as the signal that we've executed an invalid interrupt.
    spin_wave(127);
    /*
    // Sadly we don't have any simple output devices through which we
    // can signal an error safely, so we'll just halt.
    while(1);*/
}

void hard_fault_handler() {
    spin_wave(63);
}

void nmi_handler() {
    spin_wave(63 + 127);
}
