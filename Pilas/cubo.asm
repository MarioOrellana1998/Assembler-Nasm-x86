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

section .text   
      global _start 
_start:
        escribir msj_enter,len_msj_enter

        mov ecx,5
        mov edx,5
        jmp principal

principal:
        cmp edx,0
        jz salir

        cmp ecx,0
        jz nueva_linea
        
        jmp imprimir
nueva_linea:
        push edx
        escribir msj_enter,len_msj_enter
        pop edx
        dec edx
        mov ecx,5
        jmp principal

imprimir:
        push ecx
        escribir msj,len
        pop ecx
        dec ecx
        jmp principal

salir:
        mov eax,1
        int 80h

