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

const uint RCC = 0x40021000;  // Start address of the RCC register block

const uint RCC_AHBENR = 0x14;  // Offset address of the AHBENR register

const uint RCC_AHBENR_IOPEEN = 1 << 21;  // IOPCEN bit mask

const uint GPIOE = 0x48001000;  // Start address of the GPIOC register block

const uint GPIOE_MODER = 0x0;  // Offset address of the CRH register
const uint GPIOE_BSRR = 0x18;  // Offset address of the BSRR register


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
