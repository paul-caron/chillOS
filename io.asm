; get character input
; returns : ah = scan code 
;           al = character
GetChar:
  mov ah, 0x00 ;
  int 0x16     ;
  mov ah, [canonical]   ;
  cmp ah, 0x01 ; check if canonical mode
  je _Canonical_PrintChar ;
  ret ;
_Canonical_PrintChar: ;
  mov cx, 0x01 ; times to print char
  mov bx, 0x00 ; page number
  mov ah, 0x0E ; 
  int 0x10     ; 
  ret ;

; get cursor data
; params none
; returns: ch = scanline, cl = end scanline, dh = row, dl = column
GetCursor:
  push ax ;
  push bx ;
  push sp ;
  push bp ;
  push si ;
  push di ;

  mov ah, 0x03 ;
  mov bh, 0x00 ; page number
  int 0x10 ;
  
  pop di ;
  pop si ;
  pop bp ;
  pop sp ;
  pop bx ;
  pop ax ;

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
  inc si;
  jmp Print    ;
._done: ;
  ret ;


;; Enable and Disable canonical mode
;; canonical mode will print chars when types
EnableCanonical:
  mov al, 0x01 ;
  mov [canonical], al ;
  ret ;

DisableCanonical:
  mov al, 0x00 ;
  mov [canonical], al ;
  ret ;


;param dx = word to print as hex

PutHex:
  push ax ;
  push sp ;
  push bp ;
  push si ;
  push di ;
._printDigit:
  mov ax, dx;
  and ax, 0xf000;
  shr ax, 0x0C;
  add ax, hex_string;
  mov si, ax;
  mov ah, 0x0e;
  mov al, [si];
  mov bh, 0x00 ; page number
  mov cx, 0x01; times to print character
  mov bl, 0x02; text color
  int 0x10 ;
  shl dx, 0x04;
  cmp dx, 0x00;
  jne ._printDigit;

  pop di ;
  pop si ;
  pop bp ;
  pop sp ;
  pop ax ;

  ret ;
