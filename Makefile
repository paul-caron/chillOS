BUILD_DIR=build


all: bootloader.o kernel.o bootdisk


bootloader.o:
	nasm -f bin bootloader.asm -o bootloader.o

kernel.o:
	nasm -f bin kernel.asm -o kernel.o

bootdisk: bootloader.o kernel.o
	dd if=/dev/zero of=bootDisk.flp bs=512 count=4
	dd conv=notrunc if=bootloader.o of=bootDisk.flp bs=512 count=1 seek=0
	dd conv=notrunc if=kernel.o of=bootDisk.flp bs=512 count=3 seek=1



clean:
	rm *.o
	rm bootDisk.flp


