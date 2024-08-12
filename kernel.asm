bits 16
start: jmp main;

kernel_version: db "KERNEL: ChillPillOS v0.0.0", 0x0A, 0x0D, 0x00
canonical: db 0x00 ;

io:
  %include "io.asm"

main:
  cld ;
  ; set video mode
  mov ah, 0x00 ;
  mov al, 0x03 ; text color mode
  int 0x10 ;                     ;

  mov ax, 0x50 ;
  mov ds, ax ;

  mov si, kernel_version; 
  call Print ;

  hlt;


