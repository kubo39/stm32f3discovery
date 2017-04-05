module gpio;

import constants;
import rcc;

version(ARM_Thumb):
extern(C):
@nogc:
nothrow:

pragma(LDC_no_moduleinfo);
pragma(LDC_no_typeinfo);

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
    *moder |= (*moder & ~(0b11 << 30)) | (0b01 << 30);
}

void putPe14InOutputMode()
{
    auto gpioe = gpioe();
    auto moder = cast(uint*) &gpioe.moder;
    *moder |= (*moder & ~(0b11 << 28)) | (0b01 << 28);
}

void putPe13InOutputMode()
{
    auto gpioe = gpioe();
    auto moder = cast(uint*) &gpioe.moder;
    *moder |= (*moder & ~(0b11 << 26)) | (0b01 << 26);
}

void putPe12InOutputMode()
{
    auto gpioe = gpioe();
    auto moder = cast(uint*) &gpioe.moder;
    *moder |= (*moder & ~(0b11 << 24)) | (0b01 << 24);
}

void putPe11InOutputMode()
{
    auto gpioe = gpioe();
    auto moder = cast(uint*) &gpioe.moder;
    *moder |= (*moder & ~(0b11 << 22)) | (0b01 << 22);
}

void putPe10InOutputMode()
{
    auto gpioe = gpioe();
    auto moder = cast(uint*) &gpioe.moder;
    *moder |= (*moder & ~(0b11 << 20)) | (0b01 << 20);
}

void putPe9InOutputMode()
{
    auto gpioe = gpioe();
    auto moder = cast(uint*) &gpioe.moder;
    *moder |= (*moder & ~(0b11 << 18)) | (0b01 << 18);
}

void putPe8InOutputMode()
{
    auto gpioe = gpioe();
    auto moder = cast(uint*) &gpioe.moder;
    *moder |= (*moder & ~(0b11 << 16)) | (0b01 << 16);
}
