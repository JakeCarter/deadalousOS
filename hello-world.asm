mov ah, 0x0e ; Switch to teletype mode

mov al, 'H' ; Place "H" in al register
int 0x10    ; Trigger "Print" interrupt

mov al, 'e' ; Place "e" in al register
int 0x10    ; Trigger "Print" interrupt

mov al, 'l' ; Place "l" in al register
int 0x10    ; Trigger "Print" interrupt

mov al, 'l' ; Place "l" in al register
int 0x10    ; Trigger "Print" interrupt

mov al, 'o' ; Place "o" in al register
int 0x10    ; Trigger "Print" interrupt

mov al, ',' ; Place "," in al register
int 0x10    ; Trigger "Print" interrupt

mov al, ' ' ; Place " " in al register
int 0x10    ; Trigger "Print" interrupt

mov al, 'W' ; Place "W" in al register
int 0x10    ; Trigger "Print" interrupt

mov al, 'o' ; Place "o" in al register
int 0x10    ; Trigger "Print" interrupt

mov al, 'r' ; Place "r" in al register
int 0x10    ; Trigger "Print" interrupt

mov al, 'l' ; Place "l" in al register
int 0x10    ; Trigger "Print" interrupt

mov al, 'd' ; Place "d" in al register
int 0x10    ; Trigger "Print" interrupt

mov al, '!' ; Place "!" in al register
int 0x10    ; Trigger "Print" interrupt

jmp $

times 510-($-$$) db 0
db 0x55, 0xaa
