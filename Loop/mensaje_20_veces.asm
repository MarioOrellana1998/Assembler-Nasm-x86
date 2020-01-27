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
        msj db "Ella no te ama :v ",10
        len equ $ - msj
section.bss
        n1 resb 1


section .text   
      global _start 
_start:
       

        mov ecx,20
        

ciclo:
        push ecx
        add ecx,'00'
        mov [n1],ecx
        escribir n1,1
        escribir msj,len
        pop ecx 
        loop ciclo 

salir:
        mov eax,1
        int 80h

