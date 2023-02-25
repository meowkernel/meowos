; MeowOS BIOS Text Print
; Copyright (C) 2023 Dabin Park from Taejung Inc.

PrepareBiosTextOutput:
    push ax
    push bx

    mov ah, 0x0e
    .Loop:
    cmp [bx], byte 0
    je .Exit
        mov al, [bx]
        int 0x10
        inc bx
        jmp .Loop
    .Exit:

    pop ax
    pop bx
    ret