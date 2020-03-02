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
    archivo db '/home/mario/Escritorio/dinamico/codigo2.txt', 0

    mensaje_error db "error en el archivo", 10
    len_error equ $-mensaje_error

    msj db 10,"Carpeta de directorio creado ",10
    len_msj equ $ - msj

    

    path db '/home/mario/Escritorio/dinamico',0
    len_path equ $ - path

section .bss
    texto resb 35
    idarchivo resb 1
    
section .text
    global _start

_start: 

    

    mov eax,39 ;servicio para crear directorio
    mov ebx,path ;define la ruta del servicio 
    mov ecx,0x1FF ; definimos el permiso 777
    int 80h

    escribir msj,len_msj

    leer texto, 35

    mov eax, 8 ; subrutina
    mov ebx, archivo ;ruta 
    mov ecx, 1 ; acceso
    mov edx, 0x1FF ;permiso
    int 80h

    test eax, eax
    jz error

    mov dword [idarchivo], eax

    mov eax, 4
    mov ebx, [idarchivo]
    mov ecx, texto
    mov edx, 35
    int 80h

    jmp salir

error:
    escribir mensaje_error, len_error    

salir:
    mov eax, 1
    int 80h 