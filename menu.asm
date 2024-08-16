
PrintMenu:
  mov si, menu_string;
  call Print   ;
  ret          ;

Menu:
  call VideoInit ;
  call PrintMenu ;

._menu_select:
  call GetChar   ;
  cmp al, '1'    ;
  je .option_1    ;
  cmp al, '2'    ;
  je .option_2    ;
  cmp al, '3'    ;
  je .option_3 ;
  cmp al, '4' ;
  je .option_4;
  cmp al, '5';
  je .option_5;
  cmp al, '6';
  je .option_6;
  jmp ._menu_select   ;
  ret            ;

.option_1:
  call PrintTime ;
  call GetChar ;
  jmp Menu;

.option_2:
  call WaitOne ;
  call Reboot;
  hlt ; 

.option_3:
  call PrintMemoryWord ;
  call GetChar;
  jmp Menu ;

.option_4:
  call InputMemoryByte ;
  jmp Menu ;

.option_5:
  call ReadMemoryPage;
  call GetChar;
  jmp Menu;

.option_6:
  mov ax, 0xB0 ;
  mov ds, ax;
  jmp 0xB0:0x00 ;
  jmp Menu;
  hlt;
