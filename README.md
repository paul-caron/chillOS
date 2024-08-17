# chillOS
ChillOS is a very lightweight combination of a bootloader and a kernel

# requirements
You need QEMU to run this operating system (unless you have a x86 kind of old PC with floppy drive)
Kindly install QEMU before executing the 'run.sh' script

# run
```
./run.sh
```
# technical details
## memory map
The bootloader is loaded into address 0x00:0x7c00
The stack is set at 0x00:0x7c00 and grows downwards
The kernel is then loaded into address 0x00:0x0500
Any program loaded into memory, will be loaded at address 0x00:0x8000
The loaded program can then be executed or inspected

