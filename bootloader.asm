org 0x7c00
bits 16
start: jmp main

;; main
main:
  cli ;
  cld ;
  ;set the buffer
  mov ax, 0x50 ;
  mov es, ax ;
  xor bx, bx ;
  ;read 2 other sectors on this floopy
  mov al, 0x02 ;read 2 sector
  mov ch, 0x00 ;track 0
  mov cl, 0x02 ;sector to read(the second sector)
  mov dh, 0x00 ;head number
  mov dl, 0x00 ;drive number
  mov ah, 0x02 ;read sectors code
  int 0x13     ;bios interrupt
  ;execute kernel on sector 2
  jmp 0x50:0x00 ;
  hlt ; halt the system
; Clear rest of bytes until last 2 bytes of 512 sector
; last two byte be the boot signature
signature:
  times 510 - ($-$$) db 0
  dw 0xAA55 ; Boot signature

