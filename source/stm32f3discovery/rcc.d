module stm32f3discovery.rcc;

version(ARM_Thumb):
extern(C):
@nogc:
nothrow:

/**
 *  Rcc
 */

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

