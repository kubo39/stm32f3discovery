include build/main.mk

.PHONY: all clean

TARGET = libstm32f3discovery.a

SRCS = $(shell find ./source -name "*.d")
OBJS = constants.o gpio.o led.o rcc.o package.o cortexm.o assmbly.o
EXDIR = examples

LDCFLAGS = -mtriple=thumbv7em-none-linux-gnueabihf -defaultlib= -release -g -lib -of$(TARGET)

all: $(TARGET)

$(TARGET): $(SRCS)
	$(LDC) $(LDCFLAGS) $^

clean:
	$(RM) $(OBJS) $(TARGET)
	$(MAKE) -C $(EXDIR)/led clean
	$(MAKE) -C $(EXDIR)/crash clean

examples: $(TARGET)
	$(MAKE) -C $(EXDIR)/led
	$(MAKE) -C $(EXDIR)/crash

led-run: $(TARGET)
	$(MAKE) -C $(EXDIR)/led run

crash-run: $(TARGET)
	$(MAKE) -C $(EXDIR)/crash run
