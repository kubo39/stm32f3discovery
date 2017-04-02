import stm32f3discovery;

import ldc.llvmasm;
import ldc.attributes;

version(ARM_Thumb):
extern(C):
@nogc:
nothrow:

pragma(LDC_no_moduleinfo);

void main()
{
    auto boundary = *cast(uint*) 0x0000_0000;
    auto crash = *cast(uint*) boundary;

    while (true) {}
}

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
