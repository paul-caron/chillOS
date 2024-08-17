BUILD_DIR=build


all: bootloader.o kernel.o instructions.o hello.o bootdisk hda


bootloader.o:
	nasm -f bin bootloader.asm -o bootloader.o

kernel.o:
	nasm -f bin kernel.asm -o kernel.o

instructions.o:
	nasm -f bin instructions.asm -o instructions.o

hello.o:
	nasm -f bin hello.asm -o hello.o

bootdisk: bootloader.o kernel.o
	dd if=/dev/zero of=bootDisk.flp bs=512 count=9
	dd conv=notrunc if=bootloader.o of=bootDisk.flp bs=512 count=1 seek=0
	dd conv=notrunc if=kernel.o of=bootDisk.flp bs=512 count=3 seek=1
	dd conv=notrunc if=instructions.o of=bootDisk.flp bs=512 count=5 seek=4

hda:
	dd if=/dev/zero of=hda.img bs=512 count=2
	dd conv=notrunc if=hello.o of=hda.img bs=512 count=1 seek=0

clean:
	rm *.o
	rm bootDisk.flp
	rm hda.img


