.PHONY: all clean

TARGET = libstm32f3discovery.a

SRC = $(shell find ./source -name "*.d")
OBJ = stm32f3discovery.o

LDC = ldc2
LDCFLAGS = -mtriple=thumbv7em-none-linux-gnueabihf -defaultlib= -release -g -lib -of$(TARGET)

all: $(TARGET)

$(TARGET): $(SRC)
	$(LDC) $(LDCFLAGS) $<

clean:
	$(RM) $(OBJ) $(TARGET)
