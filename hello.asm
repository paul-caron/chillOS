hello_msg: db "Hello World", 0x0A, 0x0D, 0x00

HelloWorld:
  mov si, hello_msg ;
  call Print        ;
  ret               ;
