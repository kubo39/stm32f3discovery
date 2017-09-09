module stm32f3discovery.rcc;

version (ARM_Thumb)  :
@nogc:
nothrow:

pragma(LDC_no_moduleinfo);
pragma(LDC_no_typeinfo);

/**
 *  Rcc
 */

__gshared Rcc* RCC = cast(Rcc*) 0x40021000; // Start address of the RCC register

enum uint RCC_AHBENR_IOPEEN = 1 << 21; // IOPCEN bit mask

struct Rcc
{
    uint cr;
    uint cfgr;
    uint cir;
    uint apb2rstr;
    uint apb1rstr;
    uint ahbenr;
    uint apb2enr;
    uint apb1enr;
    uint bdcr;
    uint csr;
    uint ahbrstr;
    uint cfgr2;
    uint cfgr3;
}
