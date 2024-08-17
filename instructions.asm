jmp main;

hex_string:
  db 6*32+9
  times 78 db 6*32+13
  db 5*32+27
  db 5*32+26
  db "                                                                              "
  db 5*32+26
  db 5*32+26
  db "                            ChillOS Instructions                              "
  db 5*32+26
  db 5*32+26
  db "  Memory Read and Write:                                                      "
  db 5*32+26
  db 5*32+26
  db "    All inputs must be in hexadecimal with caps on.                           "
  db 5*32+26
  db 5*32+26
  db "    For reads, first enter the ES register and then BX fegister. (ES:BX)      "
  db 5*32+26
  db 5*32+26
  db "    For writing a byte, the first prompt is byte value followed by ES:BX.     "
  db 5*32+26
  db 5*32+26
  db "  Hard Drives Count:                                                          "
  db 5*32+26
  db 5*32+26
  db "    Gets the number of hard drives from the Bios Data Area (BDA, byte 40:75). "
  db 5*32+26
  db 0xC8
  times 78 db 6*32+13
  db 0xBC
  db 0x00

io:
  %include "io.asm"
video:
  %include "video.asm"
sys:
  %include "sys.asm"

main:
  call VideoInit;
  mov si, hex_string;
  call Print;
  call GetChar;
  mov ax, 0x50;
  mov ds, ax;
  jmp 0x50:0x00;
  hlt;
