org 0x7c00
bits 16
start: jmp boot

;; data
msg: db "Welcome to ChillPill OS", 0x0A, 0x0D, 0x00
clock_string: db "00:00:00", 0x00 
;; includes
io:
  %include "io.asm"

rtc:
  %include "rtc.asm"

menu:
  %include "menu.asm"

boot:
  cli ; no interrupts
  cld ; all that we need to init

  ; set video mode
  mov ah, 0x00 ;
  mov al, 0x03 ; text color mode
  int 0x10 ; 

  ; move cursor
  mov bh, 0x00 ; Y 
  mov bl, 0x00 ; X
  call MovCursor ;

  ; print a char
  mov al, '!'  ; char to print
  mov bl, 0x02 ; text color
  mov cx, 0x50 ; times to print
  call PutChar ;

 ; move cursor                                                            
  mov bh, 0x01 ; Y 
  mov bl, 0x1A ; X 
  call MovCursor ;
                    
  ;print welcome message str;
  mov si, msg ;
  call Print ;
  ;start menu
  call Menu ;

  hlt ; halt the system

; Clear rest of bytes until last 2 bytes of 512 sector
; last two byte be the boot signature
signature:
  times 510 - ($-$$) db 0
  dw 0xAA55 ; Boot signature

