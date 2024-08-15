
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
  call PutHexWord;
  ret;

; write a byte into memory
; param al = value
; param es = segment
; param bx = offset
WriteMemoryByte:
  mov byte[es:bx], al;
  ret;

; command line input to get hex value
; param : ax = number of digits to input
; returns : cx = result value
GetHex:
  mov bx, ax; loop counter, number of hex character to input
  xor cx, cx ; result
  xor ax, ax;
.getcharloop:
  call GetChar; get char in al
  cmp al, '0';
  je .addDec;
  cmp al, '1';
  je .addDec;
  cmp al, '2';
  je .addDec;
  cmp al, '3';
  je .addDec;
  cmp al, '4';
  je .addDec;
  cmp al, '5';
  je .addDec;
  cmp al, '6';
  je .addDec;
  cmp al, '7';
  je .addDec;
  cmp al, '8';
  je .addDec;
  cmp al, '9';
  je .addDec;
  cmp al, 'A';
  je .addHex;
  cmp al, 'B';
  je .addHex;
  cmp al, 'C';
  je .addHex;
  cmp al, 'D';
  je .addHex;
  cmp al, 'E';
  je .addHex;
  cmp al, 'F';
  je .addHex;
  jmp .end;

  .addDec:
  sub al, '0';
  add ax, cx;
  mov cx, ax;
  sub bx, 0x01;
  cmp bx, 0x00;
  je .end;
  shl cx, 0x04;
  jmp .getcharloop;
  .addHex:
  sub al, 'A';
  add al, 10;
  add ax, cx;
  mov cx, ax;
  sub bx, 0x01;
  cmp bx, 0x00;
  je .end
  shl cx, 0x04;
  jmp .getcharloop
  .end:
  ret;

InputMemoryByte:
  mov ax, 0x02;
  call GetHex;
  mov ax, 0x00;
  mov es, ax;
  mov ax, 0x7c00;
  mov bx, ax;
  xor ax, ax;
  mov al, cl;
  call WriteMemoryByte;
  ret;
