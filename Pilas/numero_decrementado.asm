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
         msj db 10, "Ingrese el numero:",10
        len equ $ - msj

section .bss
        n1 resb 1
section .text   
      global _start 
_start:
        escribir msj,len
        leer n1,1


        mov ecx ,[n1]
        sub ecx,"0"
        jmp principal

principal:
        cmp ecx,0
        jz salir
        jmp imprimir

imprimir:
        push ecx
        add ecx,"0"
        mov [n1],ecx
        escribir n1,1
        pop ecx
        dec ecx
        jmp principal

salir:
        mov eax,1
        int 80h

