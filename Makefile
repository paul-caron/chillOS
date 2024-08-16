BUILD_DIR=build


all: bootloader.o kernel.o program.o bootdisk


bootloader.o:
	nasm -f bin bootloader.asm -o bootloader.o

kernel.o:
	nasm -f bin kernel.asm -o kernel.o

program.o:
	nasm -f bin program.asm -o program.o

bootdisk: bootloader.o kernel.o
	dd if=/dev/zero of=bootDisk.flp bs=512 count=9
	dd conv=notrunc if=bootloader.o of=bootDisk.flp bs=512 count=1 seek=0
	dd conv=notrunc if=kernel.o of=bootDisk.flp bs=512 count=3 seek=1
	dd conv=notrunc if=program.o of=bootDisk.flp bs=512 count=5 seek=4



clean:
	rm *.o
	rm bootDisk.flp


