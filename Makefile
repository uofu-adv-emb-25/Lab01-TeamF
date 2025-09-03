PICO_TOOLCHAIN_PATH?=$(HOME)/ece6785/pico-sdk/toolchain/13_2_Rel1
CPP=arm-none-eabi-cpp

main.i: main.c
	$(CPP) main.c > main.i

hello.txt:
	echo "hello world!" > hello.txt