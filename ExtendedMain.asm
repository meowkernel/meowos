; MeowOS Extended Program Space and IA-32 Protected Mode Loader
; Copyright (C) 2023 Dabin Park from Taejung Inc.

[org 0x7e00]

jmp InitProtectedMode

%include "InitGDT.asm"
%include "BIOSTextOutput.asm"

InitProtectedMode:
    call InitA20
    cli
    lgdt [gdt_descriptor]
    mov eax, cr0
    or eax, 1
    mov cr0, eax
    jmp codeseg:StartProtectedMode

InitA20:
    in al, 0x92
    or al, 2
    out 0x92, al
    ret

[bits 32]

%include "CPUIDCtl.asm"
%include "MemoryPaging.asm"

StartProtectedMode:

    mov ax, dataseg
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    call getCPUID
    call DetectLongmode
    call SetIdentityPaging
    call ModGDT

    jmp codeseg:StartAMD64LongMode

[bits 64]

StartAMD64LongMode:
    mov edi, 0xB8000
    mov rax, 0x0A570B4F0A450B4D
    mov ecx, 500
    rep stosq
    jmp $

times 2048-($-$$) db 0
