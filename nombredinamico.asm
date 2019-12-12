section .data
	mensaje db "Ingrese su nombre",10
	tamano equ $-mensaje
section .bss
	nombre resb 5
	;tamano_nombre equ -$nombre
section .text
	global _start
_start :

	mov eax,4
	mov ebx,1
	mov ecx,mensaje
	mov edx,tamano
	int 80H	

	mov eax,3
	mov ebx,2
	mov ecx,nombre
	mov edx,5
	int 80H

	mov eax,4
	mov ebx,1
	mov ecx,nombre
	mov edx,8
	int 80H	


	mov eax,1
	int 80h