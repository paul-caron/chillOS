
PrintMenu:
  mov si, menu_str;
  call Print   ;
  ret          ;

Menu:
  call PrintMenu ;

._menu_select:
  call GetChar   ;
  cmp al, '1'    ;
  je .option_1    ;
  cmp al, '2'    ;
  je .option_2    ;
  cmp al, '3'    ;
  je .option_3 ;
  jmp ._menu_select   ;
  ret            ;

.option_1:
  call DisplayTime ;
  jmp ._menu_select;

.option_2:
  call WaitOne ;
  call Reboot;
  hlt ; 

.option_3:
  call REPL ;
  jmp ._menu_select;





