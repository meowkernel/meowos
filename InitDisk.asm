; MeowOS Disk Init
; Copyright (C) 2023 Dabin Park from Taejung Inc.

PROGRAM_SPACE equ 0x7e00

DiskRead:

    mov ah, 0x02
    mov bx, PROGRAM_SPACE
    mov al, 4
    mov dl, [DISKINIT]

    mov ch, 0x00
    mov dh, 0x00

    mov cl, 0x02

    int 0x13

    jc DiskReadFailedOutput

    ret

DISKINIT:
    db 0

DiskReadFailedOutputText:
    db '[ Kernel Panic ] Failed to initialize and read disk!',0

DiskReadFailedOutput:
    mov bx, DiskReadFailedOutputText
    call PrepareBiosTextOutput

    jmp $