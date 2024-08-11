; get character input
; returns : ah = scan code 
;           al = character
GetChar:
  mov ah, 0x00 ;
  int 0x16     ;
  ret ;

; move cursor to x y coordinate
; param bh = Y coordinate
; param bl = x coordinate
; return none
MovCursor:
  push ax ;
  push sp ;
  push bp ;
  push si ;
  push di ;

  mov ah, 0x02 ;
  mov dh, bh ; row
  mov dl, bl ; column
  mov bh, 0x00 ; display page number
  int 0x10 ; call

  pop di ;
  pop si ;
  pop bp ;
  pop sp ;
  pop ax ;

  ret;

; print a character
; param al = character to print
; param bl = text color
; param cx = number of times to print character
PutChar:
  push ax ;
  push sp ;
  push bp ;
  push si ;
  push di ;

  mov ah, 0x09 ; 
  mov bh, 0x00 ; page number
  int 0x10 ;

  pop di ;
  pop si ;
  pop bp ;
  pop sp ;
  pop ax ;

  ret ;

; transforms bcd into char and prints it
; param al = digit value
PutBCD:
  push ax ;
  push cx ;
  add al, 0x30 ;
  mov cx, 0x01 ;
  call PutChar ;
  pop cx
  pop ax  ;

Print:
  mov al, [si]   ;
  cmp al, 0x00 ;
  je ._done    ;
  mov bl, 0x02 ;
  mov cx, 0x01 ;
  mov ah, 0x0E ;
  int 0x10     ;
  add si, 0x01 ;
  jmp Print    ;
._done: ;
  ret ;


;  mov ah, 0x0E ;
;._loop:
;  lodsb ;
;  cmp al, 0 ;
;  je ._done ;
;  int 0x10 ;
;  jmp ._loop ;
;._done:
;  ret ;







