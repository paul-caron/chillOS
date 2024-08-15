org 0x00500
bits 16
start: jmp main;

kernel_version: db "KERNEL: ChillOS v0.0.0", 0x0A, 0x0D, 0x00
canonical: db 0x00 ;
clock_string: db "00:00:00", 0x00
menu_string: db "Menu : ", 0x0A, 0x0D
             db "   1 - Display Time", 0x0A, 0x0D
             db "   2 - Reboot", 0x0A, 0x0D
             db "   3 - Read Memory Word", 0x0A, 0x0D
             db "   4 - Write Memory Byte", 0x0a, 0x0D
             db "   (ctrl+a,x) - Exit QEMU", 0x0A, 0x0D, 0x00
hex_string: db "0123456789ABCDEF"
hex_byte_buffer: db "1234", 0x00
hex_word_buffer: db "12345678", 0x00

video:
  %include "video.asm"
io:
  %include "io.asm"
memory:
  %include "memory.asm"
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
  ; splash screen ;
  mov si, kernel_version;
  call Print;
  call WaitFive;
  ; start menu ;
  call Menu;

  hlt;








