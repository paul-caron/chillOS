; set video mode
VideoInit:
  mov ah, 0x00 ;
  mov al, 0x03 ; text color mode
  int 0x10 ; 
  ret 
