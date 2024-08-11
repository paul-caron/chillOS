REPL:
  call EnableCanonical ;
  mov al, '>'  ;
  mov bl, 0x02 ;
  mov cx, 0x01 ;
  call PutChar ;
  call GetCursor ;
  mov bh, dh ; y
  mov bl, dl ; x
  inc bl ; 
  call MovCursor ;
_ReadLine: ;
  call GetChar ;
  cmp al, 0x1B ;
  je _Exit ;
  cmp al, 0x0D ;
  je _ExecuteLine ;
  jmp _ReadLine ;
_ExecuteLine:
  jmp REPL ;

_Exit: ; 
  call DisableCanonical ;
  ret ;


