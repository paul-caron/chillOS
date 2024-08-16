
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
  push ax;
  push bx;
  push cx;
  push dx;
  mov bx, 0x02;
  mov cx, 0x01;
  call PutChar;
  call GetCursor;
  mov ax, dx;
  mov bx, ax;
  add bl, 0x01;
  call MovCursor;
  pop dx;
  pop cx;
  pop bx;
  pop ax;
  xor ah, ah;
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

;get user input of es:bx address
InputAddress:
  mov si, prompt_word;
  call Print;
  call CursorLineBegin;
  mov ax, 0x04;
  call GetHex;
  push cx;
  call GetChar;
  call CursorLineBegin;
  mov si, prompt_word;
  call Print;
  call CursorLineBegin;
  mov ax, 0x0004;
  call GetHex;
  push cx;
  call GetChar;
  pop bx
  pop es;
  ret;

InputMemoryByte:
  mov ax, prompt_byte;
  mov si, ax;
  call Print;
  call CursorLineBegin;
  mov ax, 0x02;
  call GetHex;
  push cx;
  call GetChar;
  call CursorLineBegin;
  call InputAddress;
  pop ax;
  call WriteMemoryByte;
  ret;

; param es = page
ReadMemoryPage:
  call InputAddress;
  call CursorLineBegin;
  mov ax, bx;
  add ax, 0x0100;
  .loop:
  push ax;
  call ReadMemoryWord;
  mov dx, ax;
  push bx;
  call PutHexWord;
  mov ah, 0x0e;
  mov al, ' ';
  mov bl, 0x02;
  mov cx, 0x01;
  int 0x10;
  pop bx;
  add bx, 0x02;
  pop ax;
  cmp bx, ax;
  jne .loop;
  ret;





