import stm32f3discovery;

// For writting messages to host's console.
import semihosting;

@nogc:
nothrow:

extern (C) void main()
{
    pragma(LDC_never_inline);

    string words = "Hello\n";
    writeString(words);
    while (true)
        wfi();
}
