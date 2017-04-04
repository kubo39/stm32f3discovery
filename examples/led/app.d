import stm32f3discovery;

extern(C):
@nogc:
nothrow:

pragma(LDC_no_moduleinfo);

void main()
{
    pragma(LDC_never_inline);

    initLED();

    // Use shared to avoid __tls_get_addr error.
    shared ticks = 100000;

    while (true)
    {
        foreach (led; LEDS)
        {
            led.on;
            delay(ticks);
            led.off();
            delay(ticks);
        }
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
