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
        msj db '*'
section .text   
      global _start 
_start:
        mov ecx ,9
        jmp principal

principal:
        cmp ecx,0
        jz salir
        jmp imprimir

imprimir:
        dec ecx
        push ecx
        escribir msj,2
        pop ecx
        jmp principal

salir:
        mov eax,1
        int 80h

