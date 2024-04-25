%include "io.inc"

segment .data
array db 5,5,5,5,5,4,5,4
array_len dd 8

segment .text
global main

main:
    mov ebp, esp; for correct debugging
    mov esi, array
    mov edx, [array_len]
    xor ebx, ebx
    xor eax, eax
    .loop:
        add al, [esi + ebx]
        inc ebx
        cmp ebx , edx
        jl .loop

    
    div dl
    PRINT_DEC 4, al
    ret