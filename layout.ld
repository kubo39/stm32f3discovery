ENTRY(_reset)

MEMORY
{
  CCRAM : ORIGIN = 0x10000000, LENGTH = 8K
  FLASH : ORIGIN = 0x08000000, LENGTH = 256K
  RAM : ORIGIN = 0x20000000, LENGTH = 40K
}

SECTIONS
{
  .text :
  {
    /* Vector table */
    LONG(ORIGIN(RAM) + LENGTH(RAM))
    LONG(_reset + 1);
    KEEP(*(.rodata._EXCEPTIONS));
    /* Reset handler */
    _reset = .;
    *(.text._reset)

    /* the code */
    *(.text*)
  }>FLASH

  /DISCARD/ :
  {
    *(.ARM.exidx*)
    *(.note.gnu.build-id*)
  }
}
