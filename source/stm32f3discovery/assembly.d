module stm32f3discovery.assembly;

version(ARM_Thumb):
extern(C):
@nogc:
nothrow:

pragma(LDC_no_moduleinfo);
pragma(LDC_no_typeinfo);

import ldc.llvmasm;

void bkpt()
{
    pragma(LDC_allow_inline);
    __asm("bkpt", "");
}

void nop()
{
    pragma(LDC_allow_inline);
    __asm("nop", "");
}
