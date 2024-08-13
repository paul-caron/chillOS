bits 16
start: jmp main;

kernel_version: db "KERNEL: ChillPillOS v0.0.0", 0x0A, 0x0D, 0x00
canonical: db 0x00 ;
clock_string: db "00:00:00", 0x00
menu_str: db "Menu : ", 0x0A, 0x0D
          db "   1 - PrintTime", 0x0A, 0x0D
          db "   2 - Reboot", 0x0A, 0x0D
          db "   3 - REPL", 0x0A, 0x0D, 0x00

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
  ; setup segments ;
  mov ax, 0x50 ;
  mov ds, ax ;
  mov es, ax ;

  ; set video mode
  mov ah, 0x00 ;
  mov al, 0x03 ; text color mode
  int 0x10 ;                     ;

  ; print version ;
  mov si, kernel_version; 
  call Print ;

  ; start menu ;
  call Menu;

  hlt;








