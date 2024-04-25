%include "io.inc"

segment .data
M_1 db 0,1,2,3
M_2 db 4,5,6,7
n dd 2
m dd 2

section .text
global main
main:
    mov esi, M_1
    mov edi, M_2
    mov ebx, [n]
    mov edx, [m]
    xor eax, eax
    .loop1:
        add ebx, ebx
        dec edx
        cmp edx, 0
        jl .loop1
        
    .loop2:
        dec ebx
        xor ecx, ecx
        mov ecx, [edi + ebx] 
        add cl, [esi + ebx]
        mov [edi + ebx], cl
        ;PRINT_DEC 4, cl
        ;PRINT_STRING ' '  
        cmp ebx, 0
        jg .loop2
        
    
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    xor esi, esi
    mov esi, [n]
    mov ebx, [m]
    .loop3:
        .aux:
        xor eax, eax
        mov eax, [edi + ecx] 
        PRINT_DEC 4, al
        PRINT_STRING ' ' 
        inc ecx
        inc edx
        cmp edx, esi
        jl .aux
        NEWLINE
        xor edx, edx
        dec ebx
        cmp ebx, 0
        jg .loop3
        
        
   
    ret