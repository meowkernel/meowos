; MeowOS CPUID Control
; Copyright (C) 2023 Dabin Park from Taejung Inc.

getCPUID:
    pushfd
    pop eax

    mov ecx, eax

    xor eax, 1 << 21

    push eax
    popfd

    pushfd
    pop eax

    push ecx
    popfd

    xor eax,ecx
    jz CPUIDFailed
    ret

DetectLongmode:
    mov eax, 0x80000001
    cpuid
    test edx, 1 << 29
    jz LongModeFailed
    ret

LongModeFailed:
    hlt

CPUIDFailed:
    hlt