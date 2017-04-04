import stm32f3discovery;

version(ARM_Thumb):
extern(C):
@nogc:
nothrow:

pragma(LDC_no_moduleinfo);

void main()
{
    auto boundary = *cast(uint*) 0x0000_0000;
    auto crash = *cast(uint*) boundary;

    while (true) {}
}
