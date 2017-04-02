import stm32f3discovery;

extern(C):
@nogc:
nothrow:

pragma(LDC_no_moduleinfo);

void main()
{
    pragma(LDC_never_inline);
    powerOnGpioe();

    auto gpioe = cast(GPIO*) GPIOE;
    putPe9InOutputMode(gpioe);

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
    foreach (_; 0 .. n)
    {
        // nop
    }
}

void powerOnGpioe()
{
    auto rcc = cast(Rcc*) RCC;
    // Pointer to the AHBENR register
    auto ahbenr = cast(uint*) &rcc.ahbenr;
    *ahbenr |= RCC_AHBENR_IOPEEN;
}

void putPe9InOutputMode(GPIO* gpioe)
{
    // Pointer to the MODER register
    auto moder = cast(uint*) &gpioe.moder;
    *moder = (*moder & !(0b11 << 18)) | (0b01 << 18);
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
