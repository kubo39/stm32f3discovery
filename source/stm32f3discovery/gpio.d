module stm32f3discovery.gpio;

import stm32f3discovery.rcc;

version(ARM_Thumb):
extern(C):
@nogc:
nothrow:

pragma(LDC_no_moduleinfo);
pragma(LDC_no_typeinfo);

/**
 *  GPIO
 */

__gshared GPIO* GPIOA = cast(GPIO*) 0x48000000;  // Start address of the GPIOA register
__gshared GPIO* GPIOB = cast(GPIO*) 0x48000400;  // Start address of the GPIOB register
__gshared GPIO* GPIOC = cast(GPIO*) 0x48000800;  // Start address of the GPIOC register
__gshared GPIO* GPIOD = cast(GPIO*) 0x48000c00;  // Start address of the GPIOD register
__gshared GPIO* GPIOE = cast(GPIO*) 0x48001000;  // Start address of the GPIOE register
__gshared GPIO* GPIOF = cast(GPIO*) 0x48001400;  // Start address of the GPIOF register
__gshared GPIO* GPIOG = cast(GPIO*) 0x48001800;  // Start address of the GPIOG register
__gshared GPIO* GPIOH = cast(GPIO*) 0x48001c00;  // Start address of the GPIOH register


struct GPIO
{
    uint moder;  /* offser address of the CRH register */
    uint otyper;
    uint ospeedr;
    uint pupdr;
    uint idr;
    uint odr;
    uint bsrr;  // Offset address of the BSRR register
    uint lckr;
    uint afrl;
    uint afrh;
    uint brr;
}

void powerOnGpioe()
{
    // Pointer to the AHBENR register
    auto ahbenr = &RCC.ahbenr;
    *ahbenr |= RCC_AHBENR_IOPEEN;
}

void putPe15InOutputMode()
{
    auto moder = &GPIOE.moder;
    *moder |= (*moder & ~(0b11 << 30)) | (0b01 << 30);
}

void putPe14InOutputMode()
{
    auto moder = &GPIOE.moder;
    *moder |= (*moder & ~(0b11 << 28)) | (0b01 << 28);
}

void putPe13InOutputMode()
{
    auto moder = &GPIOE.moder;
    *moder |= (*moder & ~(0b11 << 26)) | (0b01 << 26);
}

void putPe12InOutputMode()
{
    auto moder = &GPIOE.moder;
    *moder |= (*moder & ~(0b11 << 24)) | (0b01 << 24);
}

void putPe11InOutputMode()
{
    auto moder = &GPIOE.moder;
    *moder |= (*moder & ~(0b11 << 22)) | (0b01 << 22);
}

void putPe10InOutputMode()
{
    auto moder = &GPIOE.moder;
    *moder |= (*moder & ~(0b11 << 20)) | (0b01 << 20);
}

void putPe9InOutputMode()
{
    auto moder = &GPIOE.moder;
    *moder |= (*moder & ~(0b11 << 18)) | (0b01 << 18);
}

void putPe8InOutputMode()
{
    auto moder = &GPIOE.moder;
    *moder |= (*moder & ~(0b11 << 16)) | (0b01 << 16);
}
