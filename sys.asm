
;; Reboot the computer
Reboot:
  int 0x19 ;
  hlt ;

EnableCanonical:
  mov al, 0x01 ;
  mov [canonical], al ;
  ret ;

DisableCanonical:
  mov al, 0x00 ;
  mov [canonical], al ;
  ret ;
