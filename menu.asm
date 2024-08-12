; print menu
PrintMenu:
  push ds ;
  mov ax, menu_str ;
  shr ax, 0x04 ;
  mov ds, ax   ;
  mov ax, menu_str ;
  and ax, 0x0F ;
  mov si, ax   ;
  call Print   ;
  pop ds ;
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
  je option_3 ;
  jmp _menu_select   ;
  ret            ;

option_1:
  call PrintTime ;
  jmp _menu_select;

option_2:
  call Reboot;
  hlt ; 

option_3:
  call REPL ;
  jmp _menu_select;





