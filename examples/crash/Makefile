.PHONY: all clean

TARGET = crash.bin

SRC = $(shell find ./ -name "*.d")
OBJ = app.o

LDC = ldc2
LDCFLAGS = -mtriple=thumbv7em-none-linux-gnueabihf -c -g
LD = arm-none-eabi-ld
LDFLAGS = -T ../../layout.ld -nostartfiles

LIBLARY = libstm32f3discovery.a
LINKFLAGS = -I../../source -L../../$(LIBLARY)

.SUFFIXES: .d .o

all: $(TARGET)

run: $(TARGET)
	@arm-none-eabi-gdb -q -iex "set auto-load safe-path ./" $(TARGET)

$(TARGET): $(OBJ)
	$(LD) $< $(LDFLAGS) -o $@

.d.o: $(SRC)
	$(LDC) $(LDCFLAGS) -op $(LINKFLAGS) $<

clean:
	$(RM) $(OBJ) $(TARGET)
