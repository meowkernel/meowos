; MeowOS Main Bootloader
; Copyright (C) 2023 Dabin Park from Taejung Inc.

[org 0x7c00]

mov [DISKINIT], dl

mov bp, 0x7c00
mov sp, bp

call DiskRead
jmp PROGRAM_SPACE

%include "BIOSTextOutput.asm"
%include "InitDisk.asm"

times 510-($-$$) db 0

dw 0xaa55

