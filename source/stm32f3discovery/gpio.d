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


enum Mode
{
    In = 0b00,
    Out = 0b01,
    AltFunc = 0b10,
    Analog = 0b11,
}

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

void setMode(GPIO* gpio, ubyte pin, Mode mode)
{
    auto moder = &gpio.moder;
    *moder |= (*moder & ~(0b11 << pin * 2)) | (mode << pin * 2);
}
