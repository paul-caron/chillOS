
; Reads a byte of memory and value goes into al
; param : es = segment
; param : bx = offset
ReadMemoryWord:
  mov ax, [es:bx] ;
  ret;


PrintMemoryWord:
  mov ax, 0x00;
  mov es, ax;
  mov ax, 0x7c00;
  mov bx, ax
  call ReadMemoryWord;
  mov dx, ax;
  call PutHex;
  ret;
