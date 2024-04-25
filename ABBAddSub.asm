%include "io.inc"

segment .data
array db  1, 2, 6, -1, 3, -1, -1, -1, -1, 4, 5, -1, -1, -1, -1 
array_len dd 15


section .text
global main
main:
    mov ebp, esp; for correct debugging
    ;ABB add-sub
    mov esi, array
    mov edi, [array_len]
    sub edi, 1
    
    .loop:
        mov ebx, 2
        xor eax, eax
        mov eax, edi
        sub al, 2
        div bl
        
        xor ebx, ebx
        mov bl, [esi + edi - 1]
        cmp bl, -1
            je .conditional2
            xor ecx, ecx
            mov cl, [esi + eax]
            add cl, bl
            mov [esi + eax], cl
            .conditional2:
        
        xor ebx, ebx
        add bl, [esi + edi]
        cmp bl, -1
            je .conditional1
            xor ecx, ecx
            mov cl, [esi + eax]
            sub cl, bl
            mov [esi + eax], cl
            .conditional1:
            
        cmp edi, 2
            je .end
            sub edi, 2
            jmp .loop
            .end:
        xor eax, eax
        mov al, [esi]
        PRINT_DEC 4, al
    ret