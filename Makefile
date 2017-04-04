.PHONY: all clean

TARGET = libstm32f3discovery.a

SRC = $(shell find ./source -name "*.d")
OBJ = stm32f3discovery.o
EXDIR = examples

LDC = ldc2
LDCFLAGS = -mtriple=thumbv7em-none-linux-gnueabihf -defaultlib= -release -g -lib -of$(TARGET)

all: $(TARGET)

$(TARGET): $(SRC)
	$(LDC) $(LDCFLAGS) $<

clean:
	$(RM) $(OBJ) $(TARGET)

examples: $(TARGET)
	$(MAKE) -C $(EXDIR)/led
	$(MAKE) -C $(EXDIR)/crash
