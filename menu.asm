menu: db "Menu : ", 0x0A, 0x0D
      db "  1 - HelloWorld", 0x0A, 0x0D
      db "  2 - PrintTime", 0x0A, 0x0D
      db "  3 - Reboot", 0x0A, 0x0D
      db "  4 - REPL", 0x0A, 0x0D, 0x00

; HelloWorld function
hello:
  %include "hello.asm"

; print menu
PrintMenu:
  mov si, menu ;
  call Print   ;
  ret          ;

Menu:
  call PrintMenu ;
_menu_select:
  call GetChar   ;
  cmp al, '1'    ;
  je option_1    ;
  cmp al, '2'    ;
  je option_2    ;
  cmp al, '3'    ;
  je option_3    ;
  cmp al, '4'    ;
  je option_4    ;
  jmp _menu_select   ;
                 
  ret            ;


option_1:
  call HelloWorld;
  jmp _menu_select;

option_2:
  call PrintTime ;
  jmp _menu_select;

option_3:
  call Reboot;
  hlt ; 

option_4:
  call REPL ;
  jmp _menu_select;





