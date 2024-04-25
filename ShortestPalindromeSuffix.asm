%include "io.inc"

segment .data
array db a,0,4,0
array_len dd 4

section .text
global main
main:

    mov ebp, esp; for correct debugging
    ;palindrome
    mov edi, array
    xor ebx, ebx ;i = 0
    .iloop:
        xor esi, esi        
        mov esi, [array_len] ;j = n
        dec esi              ;j = n-1
        cmp ebx, [array_len]         ;if (i == n) break
        je .end
                
        .jloop: ; para comparar pedazos de cadena y ver si son palindromas
            cmp ebx, esi
            je  .printSuffix
            xor ecx, ecx ;x = 0
            mov ecx, [array_len] ;x = n
            dec ecx      ;x = n - 1 
            sub ecx, esi ;x = n - 1 - j
            add ecx, ebx ;x = n - 1 - j + i
            xor eax, eax 
            mov eax, [edi + esi] 
            xor edx, edx
            mov edx, [edi + ecx]
            cmp al, dl ;if(ar[j] == ar[x]) j-- & continue
            je .aux
            
            inc ebx ;if(ar[j]!= ar[x]) i++ & go to loop1
            jmp .iloop
            
            .aux:
                dec esi ;j--
                jmp .jloop
            .printSuffix:
                cmp ebx, 0
                je .end 
                dec ebx 
                xor eax, eax
                mov eax, [edi + ebx]
                PRINT_DEC 4, al
                jmp .printSuffix
    .end: 
    ret