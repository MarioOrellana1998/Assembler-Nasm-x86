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

		msj db 10,"Carpeta de directorio creado ",10
		len_msj equ $ - msj

		msj_entrada db 10,"Ingrese el directorio ",10
		len_msj_entrada equ $ - msj_entrada

		path db '/home/mario/Escritorio/dinamico',0
		len_path equ $ - path

section .bss

		dir resb 256

section .text
	global _start:
_start:

	escribir msj_entrada,len_msj_entrada

	leer dir,256

	mov eax,39 ;servicio para crear directorio
	mov ebx,dir ;define la ruta del servicio 
	mov ecx,0x1FF ; definimos el permiso 777
	int 80h

	escribir msj,len_msj

	mov eax,1
	int 80h