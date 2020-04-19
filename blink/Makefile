TARGET=main.elf

build: $(TARGET)

main.o: main.s
	arm-none-eabi-as -g main.s -o main.o

main.elf: main.o
	arm-none-eabi-ld -Ttext=0x8000000 main.o -o main.elf

clean:
	rm main.elf main.o