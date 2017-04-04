module stm32f3discovery;

import ldc.llvmasm;
import ldc.attributes;

version(ARM_Thumb):
extern(C):
@nogc:
nothrow:

pragma(LDC_no_moduleinfo);
pragma(LDC_no_typeinfo);

/**
 *  Entorypont.
 */

// User must call `main()`
extern void main();

void _reset()
{
    main();
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

const uint RCC_AHBENR_IOPEEN = 1 << 21;  // IOPCEN bit mask

/**
 *  Rcc
 */

struct Rcc
{
    align (1):
    uint* cr;
    uint* cfgr;
    uint* cir;
    uint* apb2rstr;
    uint* apb1rstr;
    uint* ahbenr;
    uint* apb2enr;
    uint* apb1enr;
    uint* bdcr;
    uint* csr;
    uint* ahbrstr;
    uint* cfgr2;
    uint* cfgr3;
}

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

void powerOnGpioe()
{
    auto rcc = cast(Rcc*) RCC;
    // Pointer to the AHBENR register
    auto ahbenr = cast(uint*) &rcc.ahbenr;
    *ahbenr |= RCC_AHBENR_IOPEEN;
}

void putPe15InOutputMode()
{
    auto gpioe = gpioe();
    auto moder = cast(uint*) &gpioe.moder;
    *moder |= (*moder & !(0b11 << 30)) | (0b01 << 30);
}

void putPe14InOutputMode()
{
    auto gpioe = gpioe();
    auto moder = cast(uint*) &gpioe.moder;
    *moder |= (*moder & !(0b11 << 28)) | (0b01 << 28);
}

void putPe13InOutputMode()
{
    auto gpioe = gpioe();
    auto moder = cast(uint*) &gpioe.moder;
    *moder |= (*moder & !(0b11 << 26)) | (0b01 << 26);
}

void putPe12InOutputMode()
{
    auto gpioe = gpioe();
    auto moder = cast(uint*) &gpioe.moder;
    *moder |= (*moder & !(0b11 << 24)) | (0b01 << 24);
}

void putPe11InOutputMode()
{
    auto gpioe = gpioe();
    auto moder = cast(uint*) &gpioe.moder;
    *moder |= (*moder & !(0b11 << 22)) | (0b01 << 22);
}

void putPe10InOutputMode()
{
    auto gpioe = gpioe();
    auto moder = cast(uint*) &gpioe.moder;
    *moder |= (*moder & !(0b11 << 20)) | (0b01 << 20);
}

void putPe9InOutputMode()
{
    auto gpioe = gpioe();
    auto moder = cast(uint*) &gpioe.moder;
    *moder |= (*moder & !(0b11 << 18)) | (0b01 << 18);
}

void putPe8InOutputMode()
{
    auto gpioe = gpioe();
    auto moder = cast(uint*) &gpioe.moder;
    *moder |= (*moder & !(0b11 << 16)) | (0b01 << 16);
}

/**
 *  LED
 */

struct LED
{
    ubyte i;
}

void off(LED led) nothrow @nogc
{
    // Pointer to the BSRR register
    auto bsrr = cast(uint*) &gpioe.bsrr;

    if (led.i == 8)
        *bsrr |= 1 << 24;
    else if (led.i == 9)
        *bsrr |= 1 << 25;
    else if (led.i == 10)
        *bsrr |= 1 << 26;
    else if (led.i == 11)
        *bsrr |= 1 << 27;
    else if (led.i == 12)
        *bsrr |= 1 << 28;
    else if (led.i == 13)
        *bsrr |= 1 << 29;
    else if (led.i == 14)
        *bsrr |= 1 << 30;
    else if (led.i == 15)
        *bsrr |= 1 << 31;
    // else
    //     TODO: raise exception!
}

void on(LED led) nothrow @nogc
{
    // Pointer to the BSRR register
    auto bsrr = cast(uint*) &gpioe.bsrr;
    if (led.i == 8)
        *bsrr |= 1 << 8;
    else if (led.i == 9)
        *bsrr |= 1 << 9;
    else if (led.i == 10)
        *bsrr |= 1 << 10;
    else if (led.i == 11)
        *bsrr |= 1 << 11;
    else if (led.i == 12)
        *bsrr |= 1 << 12;
    else if (led.i == 13)
        *bsrr |= 1 << 13;
    else if (led.i == 14)
        *bsrr |= 1 << 14;
    else if (led.i == 15)
        *bsrr |= 1 << 15;
    // else
    //     TODO: raise exception!
}


__gshared LED[8] LEDS = [
    LED(8),
    LED(9),
    LED(10),
    LED(11),
    LED(12),
    LED(13),
    LED(14),
    LED(15),
    ];


void initLED()
{
    powerOnGpioe();
    putPe15InOutputMode();
    putPe14InOutputMode();
    putPe13InOutputMode();
    putPe12InOutputMode();
    putPe11InOutputMode();
    putPe10InOutputMode();
    putPe9InOutputMode();
    putPe8InOutputMode();
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
