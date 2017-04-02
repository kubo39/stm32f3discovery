import ldc.attributes;

import stm32f3discovery;

extern(C):
@nogc:
nothrow:

pragma(LDC_no_moduleinfo);

void start()
{
    pragma(LDC_never_inline);
    powerOnGpioe();
    putPe9InOutputMode();

    auto ticks = 100000;

    while (true)
    {
        setPe9High();
        delay(ticks);
        setPe9Low();
        delay(ticks);
    }
}

void delay(uint n)
{
    foreach (_; 0 .. n)
    {
        // nop
    }
}

void powerOnGpioe()
{
    // Pointer to the AHBENR register
    auto ahbenr = cast(uint*) (RCC + RCC_AHBENR);
    *ahbenr |= RCC_AHBENR_IOPEEN;
}

void putPe9InOutputMode()
{
    // Pointer to the MODER register
    auto moder = cast(uint*) (GPIOE + GPIOE_MODER);
    *moder = (*moder & !(0b11 << 18)) | (0b01 << 18);
}

void setPe9High()
{
    // Pointer to the BSRR register
    auto bsrr = cast(uint*) (GPIOE + GPIOE_BSRR);
    *bsrr = 1 << 9;
}

void setPe9Low()
{
    // Pointer to the BSRR register
    auto bsrr = cast(uint*) (GPIOE + GPIOE_BSRR);
    *bsrr = 1 << (16 + 9);
}
