mov ah, 0x0e ; Switch to teletype mode

mov al, 'A' ; Place value in al register

loop:
    int 0x10    ; Trigger "Print" interrupt
    inc al
    cmp al, 'Z' + 1
    je exit
    jmp loop

exit:
    jmp $

times 510-($-$$) db 0
db 0x55, 0xaa
