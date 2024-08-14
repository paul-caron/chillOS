

PrintTime:
  push ds ;

  mov ah, 0x02 ;
  int 0x1A     ;

  ; setup hours ;
  mov al, ch  ;
  shr al, 0x04 ;
  add al, 0x30 ;
  mov byte[clock_string], al ;

  mov al, ch   ;
  and al, 0x0F ;
  add al, 0x30 ;
  mov byte[clock_string+0x01], al ;

  ; setup minutes ;
  mov al, cl ; get minutes
  shr al, 0x04 ; get the tens digit
  add al, 0x30 ;
  mov byte[clock_string+0x03], al ;

  mov al, cl ;
  and al, 0x0F ;
  add al, 0x30 ;
  mov byte[clock_string+0x04], al ;

  ; setup seconds
  mov al, dh   ; get seconds
  shr al, 0x04 ; get the tens digit
  add al, 0x30 ;
  mov byte[clock_string+0x06], al ;

  mov al, dh   ;
  and al, 0x0F ;
  add al, 0x30 ;
  mov byte[clock_string+0x07], al ;


  ;Print
  pop ds ;
  mov si, clock_string ;
  call Print ;

  ret   ;


DisplayTime:
  call GetCursor;
  push dx;
;._refresh:
  mov bh, 0x00 ;
  mov bl, 0x46 ;
  call MovCursor;
  call PrintTime ; 
;  call WaitOne ;
;  jmp ._refresh ;
  pop dx;
  mov bh, dh ;
  mov bl, dl ;
  call MovCursor;
  ret ;





