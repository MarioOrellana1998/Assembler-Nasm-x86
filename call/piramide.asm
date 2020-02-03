%macro escribir 2 
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro

%macro leer 2 
        mov eax, 3
        mov ebx, 0
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro

section .data
        msj db "*"
        len equ $ - msj

        msj_enter db "",10
        len_msj_enter equ $ - msj_enter
section .bss
        contador_bx resb 1
        contador_cx resb 1
section .text   
      global _start 
_start:
    mov ecx,9


l1 : 
    push ecx 
    call print_new_line;
    pop ecx
    push ecx


l2:
    push ecx 
    ;imprimir asterisco
    call asterisco
    pop ecx 
    loop l2
    pop ecx 
    loop l1
    jmp salir





print_new_line:
    mov eax,4
    mov ebx,1
    mov ecx,msj_enter
    mov edx,len_msj_enter
    int 80h
    ret

asterisco:
    mov eax,4
    mov ebx,1
    mov ecx,msj
    mov edx,len
    int 80h
    ret



salir:
    mov eax,1
    int 80h



