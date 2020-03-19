%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1 
    mov edx, %2
    int 80h
%endmacro

%macro leer 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    msj db "Ingrese 6 numeros: ", 10
    len equ $-msj

    msj1 db 10,"EL numero mayor es: ", 10
    len1 equ $-msj1

    ; DEfinir el arreglo
    arreglo db 0,0,0,0,0,0
    len_arreglo equ $-arreglo 

section .bss
    numero resb 2
    mayor resb 2

section .text
    global _start

_start:
    escribir msj, len
    
    ;Asignacion del arreglo en las posiciones efectivas
    mov esi, arreglo
    mov edi, 0

conteo:
    leer numero, 2
    ;asignacion de un numero en el arreglo
    mov al, [numero]
    sub al, '0'
    mov [esi], al

    ;incrementar una posicion en el arreglo
    add esi, 1
    add edi, 1

    ;comparar para el salto
    cmp edi, len_arreglo
    je reiniciar
    jb conteo

reiniciar:
    mov esi, arreglo
    mov edi, 0
    mov al, [esi]
    mov [numero], al
    mov cx, 0

    jmp comparar

comparar:
    
    mov al, [numero]
    add esi, 1
    add edi, 1
    mov bl, [esi]
    cmp al, bl
    jg cambio 
    je cambio
    jmp menor

cambio: 
    cmp edi, len_arreglo
    je presentar
    jmp comparar

menor: 
    mov [numero], bl
    cmp edi, len_arreglo
    je presentar
    jmp comparar

presentar:
    mov al, [numero]
    add al, '0'
    mov [mayor], al
    escribir msj1, len1
    escribir mayor, 1

salir:
    mov eax, 1
    int 80h
