
;; Reboot the computer
Reboot:
  int 0x19 ;
  hlt ;

;; Wait
; param cx:dx = number of microseconds to elapse
; cf = set if error or wait already in progress
; CX is the high-order word of the count. For example, if CX is 98h and DX is 9680h, a 10-second delay would be specified.
WaitTen:
  push cx ;
  push dx;
  mov cx, 0x98;
  mov dx, 0x9680;
  mov ah, 0x86 ;
  int 0x15;
  pop dx;
  pop cx;
  ret;


WaitOne:
  push cx ;
  push dx;
  mov cx, 0x0f;
  mov dx, 0x4240;
  mov ah, 0x86 ;
  int 0x15;
  pop dx;
  pop cx;
  ret;


WaitFive:
  push cx ;
  push dx;
  mov cx, 0x4C;
  mov dx, 0x4B40;
  mov ah, 0x86 ;
  int 0x15;
  pop dx;
  pop cx;
  ret;
