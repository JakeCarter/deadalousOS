; To trigger the bios to wait for a key press,
;  mov ah, 0
;  int 0x16
; Result:
;  al - ASCII char
;  ah - Scancode

[org 0x7c00]    ; Set standard variable offset
mov bx, buffer  ; Setup buffer

loop:
    mov ah, 0x00        ; Switch to keyboard entry mode
    int 0x16            ; Trigger keyboard interrupt
    mov [bx], al        ; Place char from `al` into [bx]
    inc bx              ; Increment `bx` to next pos
    cmp bx, buffer + 10 ; Make sure we're still within the buffer
    je printBuffer      ; If we're outside the buffer, we're done; Print it
    jmp loop            ; Otherwise, keep accepting input

printBuffer:
    mov ah, 0x0e    ; Switch to teletype mode
    mov bx, buffer  ; Move `bx` back to beginning of `buffer`
printBufferLoop:
    mov al, [bx]        ; "Dereference" `bx` and place value in `al`
    int 0x10            ; Print
    inc bx              ; Increment `bx` "pointer"
    cmp bx, buffer + 10 ; Make sure we're still within the buffer
    je exit             ; Exit if we aren't
    jmp printBufferLoop ; Keep printing if we are

exit:
    jmp $

buffer:
    times 10 db 0

times 510-($-$$) db 0
db 0x55, 0xaa
