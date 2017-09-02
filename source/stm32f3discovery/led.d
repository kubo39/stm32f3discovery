module stm32f3discovery.led;

import cortexm;
import stm32f3discovery.gpio;

version (ARM_Thumb)  :
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
        auto bsrr = cast(uint*)&GPIOE.bsrr;
        volatileStore(bsrr, *bsrr | 1 << (i + 16));
    }

    void on() nothrow @nogc
    {
        auto bsrr = cast(uint*)&GPIOE.bsrr;
        volatileStore(bsrr, *bsrr | 1 << i);
    }
}

__gshared LED[8] LEDS = [LED(8), LED(9), LED(10), LED(11), LED(12), LED(13), LED(14), LED(15)];

void initLED()
{
    powerOnGpioe();
    GPIOE.setMode(15, Mode.Out);
    GPIOE.setMode(14, Mode.Out);
    GPIOE.setMode(13, Mode.Out);
    GPIOE.setMode(12, Mode.Out);
    GPIOE.setMode(11, Mode.Out);
    GPIOE.setMode(10, Mode.Out);
    GPIOE.setMode(9, Mode.Out);
    GPIOE.setMode(8, Mode.Out);
}
