org 0x00500
bits 16
start: jmp main;

kernel_version: db "KERNEL: ChillPillOS v0.0.0", 0x0A, 0x0D, 0x00
canonical: db 0x00 ;
clock_string: db "00:00:00", 0x00
menu_str: db "Menu : ", 0x0A, 0x0D
          db "   1 - Display Time", 0x0A, 0x0D
          db "   2 - Reboot", 0x0A, 0x0D
          db "   3 - REPL", 0x0A, 0x0D, 0x00
hex_string: db "01234567890ABCDEF"


video:
  %include "video.asm"
io:
  %include "io.asm"
rtc:
  %include "rtc.asm"
sys:
  %include "sys.asm"
repl:
  %include "repl.asm"
menu:
  %include "menu.asm"

main:
  call VideoInit;
  mov si, kernel_version;
  call Print;
  mov dx, 0x4321;
  call PutHex;
  call WaitFive;
  ; start menu ;
  call Menu;

  hlt;








