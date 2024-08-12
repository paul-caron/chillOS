;clock_string: db "01:23:45", 0x00 ;

PrintTime:
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
  mov ax, clock_string ;
  shr ax, 0x04 ;
  mov ds, ax ;
  mov ax, clock_string ;
  and ax, 0x0F ;
  mov si, ax ;
  call Print ;

  ret   ;

