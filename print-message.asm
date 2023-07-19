[org 0x7c00]    ; Set standard variable offset; Great explanation: https://www.youtube.com/watch?v=hseFqtRpK0M&lc=Ugy3IHBUgbrh8oEVJa54AaABAg
mov ah, 0x0e    ; Switch to teletype mode
mov bx, message ; Place "pointer" to message in `bx` register

loop:
    mov al, [bx]    ; "Dereference" `bx` and place value in `al`
    cmp al, 0       ; Check if current char is null
    je exit         ; Exit if it is
    int 0x10        ; Print char
    inc bx          ; Increment `bx`, which is our "pointer" into `message`
    jmp loop        ; Restart loop

exit:
    jmp $

message:
    db "Hello, VM world!", 0

times 510-($-$$) db 0
db 0x55, 0xaa
