module stm32f3discovery.led;

import stm32f3discovery.gpio;

version(ARM_Thumb):
extern(C):
@nogc:
nothrow:

pragma(LDC_no_moduleinfo);
pragma(LDC_no_typeinfo);

/**
 *  LED
 */

struct LED
{
    ubyte i;

    void off() nothrow @nogc
    {
        auto bsrr = cast(uint*) &gpioe.bsrr;
        *bsrr |= 1 << (i + 16);
    }

    void on() nothrow @nogc
    {
        auto bsrr = cast(uint*) &gpioe.bsrr;
        *bsrr |= 1 << i;
    }
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
