# https://makefiletutorial.com
# Quick makefile to compile the assembly and run the vm

%.bin:
	nasm -f bin $*.asm -o boot.bin

run:
	qemu-system-x86_64 boot.bin

clean:
	rm -f boot.bin
