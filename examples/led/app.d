import stm32f3discovery;

extern(C):
@nogc:
nothrow:

pragma(LDC_no_moduleinfo);

void main()
{
    pragma(LDC_never_inline);

    initLED();

    auto gpioe = gpioe();

    auto ticks = 100000;

    while (true)
    {
        setPe9High(gpioe);
        delay(ticks);
        setPe9Low(gpioe);
        delay(ticks);
    }
}

void delay(uint n)
{
    pragma(LDC_never_inline);

    foreach (_; 0 .. n)
    {
        // nop
    }
}


void setPe9High(GPIO* gpioe)
{
    // Pointer to the BSRR register
    auto bsrr = cast(uint*) &gpioe.bsrr;
    *bsrr = 1 << 9;
}

void setPe9Low(GPIO* gpioe)
{
    // Pointer to the BSRR register
    auto bsrr = cast(uint*) &gpioe.bsrr;
    *bsrr = 1 << (16 + 9);
}
