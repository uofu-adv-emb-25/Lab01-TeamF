PICO_TOOLCHAIN_PATH=$(HOME)/modules/pico-sdk
CPP=arm-none-eabi-cpp
CC=arm-none-eabi-gcc
AS=arm-none-eabi-as

%.o: %.s
	$(AS) $< -o $@

%.s: %.i
	$(CC) -S $<

%.i: %.c
	$(CPP) $< > $@

hello.txt:
	echo "hello world!" > hello.txt

.PHONY: clean
clean:
	rm -f main.i hello.txt