jmp $ ; Infinite loop

; A boot-sector MUST be 512 bytes long and end with '0x55aa'
; $         - Current position during assembly
; $$        - Start of the current section
; 510       - 512 minus the last two bytes we will add manually
; ($-$$)    - Current position minus all data that came before this position
;   This tells us how many more bytes we need before our final two
; Fill up the required space with '0' then add our final bytes, '0x55aa'
times 510-($-$$) db 0 ; Repeat '0' for 510 times
db 0x55, 0xaa
