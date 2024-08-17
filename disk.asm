LoadProgram:
  ;set memory address to load the hard drive into (es:bx = 0x8000)
  mov ax, 0x0800 ;
  mov es, ax ;
  xor bx, bx ;

  ;read sectors on hard drive
  mov al, 0x08 ;read 8 sector
  mov ch, 0x00 ;track 0
  mov cl, 0x01 ;sector to read(starts from 1)
  mov dh, 0x00 ;head number
  mov dl, 0x80 ;drive number
  mov ah, 0x02 ;read sectors code
  int 0x13     ;bios interrupt

  ret;
