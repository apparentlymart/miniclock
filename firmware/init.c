#include "lpc812.h"

void init(void);
void clock_init();
void default_irq_handler(void);
void hard_fault_handler(void);
void nmi_handler(void);

// Exported by serial.o
extern void UART0_isr(void);
extern void uart_println(const char *s);

// Exported by i2c.o
extern void I2C_isr(void);

// Exported by scheduler.o
extern void SysTick_isr(void);

// Exported by buttons.o
extern void Buttons_isr(void);

// Exported by clock.o
extern void RTC_tick_isr(void);

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
    SysTick_isr,                    /* SysTick */

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
    Buttons_isr,                    /* 24 PININT0_IRQ */
    Buttons_isr,                    /* 25 PININT1_IRQ */
    Buttons_isr,                    /* 26 PININT2_IRQ */
    Buttons_isr,                    /* 27 PININT3_IRQ */
    RTC_tick_isr,                   /* 28 PININT4_IRQ */
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

void default_irq_handler() {
    uart_println("Invalid IRQ");
    __builtin_trap();
}

void hard_fault_handler() {
    uart_println("Hard Fault");
    __builtin_trap();
}

void nmi_handler() {
    uart_println("NMI");
    __builtin_trap();
}
