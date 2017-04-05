import stm32f3discovery;

extern(C):
@nogc:
nothrow:

void main()
{
    auto boundary = *cast(uint*) 0x0000_0000;
    auto crash = *cast(uint*) boundary;

    while (true) {}
}
