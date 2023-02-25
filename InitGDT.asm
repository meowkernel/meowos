; MeowOS GDT Init
; Copyright (C) 2023 Dabin Park from Taejung Inc.

gdt_nulldescript:
    dd 0
    dd 0

gdt_codedescript:
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 10011010b
    db 11001111b
    db 0x00

gdt_datadescript:
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 10010010b
    db 11001111b
    db 0x00

gdt_finish:

gdt_descriptor:
    gdt_size:
        dw gdt_finish - gdt_nulldescript - 1
        dq gdt_nulldescript

codeseg equ gdt_codedescript - gdt_nulldescript
dataseg equ gdt_datadescript - gdt_nulldescript

[bits 32]

ModGDT:
    mov [gdt_codedescript + 6], byte 10101111b
    mov [gdt_datadescript + 6], byte 10101111b
    ret

[bits 16]