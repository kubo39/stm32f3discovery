module constants;

version(ARM_Thumb):
extern(C):
@nogc:
nothrow:

/**
 *  Constants.
 */

const uint GPIOA = 0x48000000;  // Start address of the GPIOA register
const uint GPIOB = 0x48000400;  // Start address of the GPIOB register
const uint GPIOC = 0x48000800;  // Start address of the GPIOC register
const uint GPIOD = 0x48000c00;  // Start address of the GPIOD register
const uint GPIOE = 0x48001000;  // Start address of the GPIOE register
const uint GPIOF = 0x48001400;  // Start address of the GPIOF register
const uint GPIOG = 0x48001800;  // Start address of the GPIOG register
const uint GPIOH = 0x48001c00;  // Start address of the GPIOH register

const uint RCC = 0x40021000;  // Start address of the RCC register

const uint RCC_AHBENR_IOPEEN = 1 << 21;  // IOPCEN bit mask

