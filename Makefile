PICO_TOOLCHAIN_PATH=/usr/local/bin/
CPP=arm-none-eabi-cpp
CC=arm-none-eabi-gcc
AS=arm-none-eabi-as
LD=arm-none-eabi-ld

SRC=main.c second.c
OBJS=$(patsubst %.c,%.o,$(SRC))

all: firmware.elf 

firmware.elf: $(OBJS)
	$(LD) -o $@ $^

%.o: %.s
	$(AS) $< -o $@

%.s: %.i
	$(CC) -S $<

%.i: %.c
	$(CPP) $< > $@

hello.txt:
	echo "hello world!" > hello.txt

clean:
	rm -f *.i *.o *.s hello.txt firmware.elf

.PHONY: clean all
