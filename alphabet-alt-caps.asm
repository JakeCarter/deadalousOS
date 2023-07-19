mov ah, 0x0e ; Switch to teletype mode

mov al, 'A'     ; Place value in al register

loop:
    int 0x10        ; Trigger "Print" interrupt
    add al, 32      ; 32 is the delta between an uppercase letter and it's lowercase counterpart
    int 0x10        ; Trigger "Print" interrupt
    inc al          ; Move to the next lowercase letter
    cmp al, 'z' + 1 ; Have we made it to the end?
    je exit         ; Yep, we out!
    sub al, 32      ; Not done yet. Let's go back to this chars uppercase counterpart and start the loop over
    jmp loop

exit:
    jmp $

times 510-($-$$) db 0
db 0x55, 0xaa
