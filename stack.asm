[org 0x7c00]    ; Set standard variable offset; Great explanation: https://www.youtube.com/watch?v=hseFqtRpK0M&lc=Ugy3IHBUgbrh8oEVJa54AaABAg
mov ah, 0x0e    ; Switch to teletype mode

mov bp, 0x8000  ; Set address for our stack base
mov sp, bp      ; Set address for our stack top

mov bh, 'A'     ; Move 'A' into bh
push bx         ; Registers, like bx, are 16 bits - or 2 bytes - long. Each byte, high and low, can be referenced like so `bh` for b's high byte and `bl` for b's low byte. When we push onto the stack, we push the full 16 bits by using the generic `bx` name

mov bh, 'B'
mov al, bh
int 0x10

pop bx
mov al, bh
int 0x10

jmp $

times 510-($-$$) db 0
db 0x55, 0xaa
