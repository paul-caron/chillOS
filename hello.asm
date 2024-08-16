jmp main;

hex_string: db "Hello, this is not an X string.", 0x00

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
  call WaitOne;
  mov ax, 0x50;
  mov ds, ax;
  jmp 0x50:0x00;
  hlt;
