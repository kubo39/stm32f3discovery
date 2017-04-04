.PHONY: all clean

TARGET = led.bin

SRC = $(shell find ./ -name "*.d")
OBJ = app.o

LDC = ldc2
LDCFLAGS = -mtriple=thumbv7em-none-linux-gnueabihf -c -g -defaultlib= -release
LD = arm-none-eabi-ld
LDFLAGS = -T ../../layout.ld --gc-section -nostartfiles

LIBLARY = libstm32f3discovery.a
LINKFLAGS = -I../../source

.SUFFIXES: .d .o

all: $(TARGET)

run: $(TARGET)
	@arm-none-eabi-gdb -q -iex "set auto-load safe-path ./" $(TARGET)

$(TARGET): $(OBJ)
	$(LD) $< $(LDFLAGS) -o $@ -L../.. -lstm32f3discovery

.d.o: $(SRC)
	$(LDC) $(LDCFLAGS) -op $(LINKFLAGS) $<

clean:
	$(RM) $(OBJ) $(TARGET)
