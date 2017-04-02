module stm32f3discovery;

import ldc.llvmasm;
import ldc.attributes;

version(ARM_Thumb):
extern(C):
@nogc:
nothrow:

pragma(LDC_no_moduleinfo);


/**
 *  Entorypont.
 */

// User must call `start()`
extern void start();

void _reset()
{
    start();
}


/**
 *  Constants.
 */

const uint GPIOA = 0x48000000;  // Start address of the GPIOA register block
const uint GPIOB = 0x48000400;  // Start address of the GPIOB register block
const uint GPIOC = 0x48000800;  // Start address of the GPIOC register block
const uint GPIOD = 0x48000c00;  // Start address of the GPIOD register block
const uint GPIOE = 0x48001000;  // Start address of the GPIOE register block
const uint GPIOF = 0x48001400;  // Start address of the GPIOF register block
const uint GPIOG = 0x48001800;  // Start address of the GPIOG register block
const uint GPIOH = 0x48001c00;  // Start address of the GPIOH register block

const uint RCC = 0x40021000;  // Start address of the RCC register block

const uint RCC_AHBENR = 0x14;  // Offset address of the AHBENR register

const uint RCC_AHBENR_IOPEEN = 1 << 21;  // IOPCEN bit mask


/**
 *  GPIO
 */

struct GPIO
{
    align (1):
    uint* moder;  /* offser address of the CRH register */
    uint* otyper;
    uint* ospeedr;
    uint* pupdr;
    uint* idr;
    uint* odr;
    uint* bsrr;  // Offset address of the BSRR register
    uint* lckr;
    uint* afrl;
    uint* afrh;
    uint* brr;
}

GPIO* gpioe()
{
    return cast(GPIO*) GPIOE;
}



/**
 *  Exceptions.
 */

@section(".rodata._EXCEPTIONS")
typeof(&handler)[14] _EXCEPTIONS = [
    &handler, // NMI
    &handler, // Hard fault
    &handler, // Memmanage fault
    &handler, // Bus fault
    &handler, // Usage fault
    null, // Reserved
    null, // Reserved
    null, // Reserved
    null, // Reserved
    &handler, // SVCall
    null, // Reserved for Debug
    null, // Reserved
    &handler, // PendSV
    &handler]; // Systick


void bkpt()
{
    pragma(LDC_allow_inline);
    __asm("bkpt", "");
}

void handler()
{
    pragma(LDC_never_inline);
    bkpt();
    while (true) {}
}
