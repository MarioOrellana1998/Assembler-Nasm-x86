;primerprograma.asm
section .data
	mensaje db "hola ensambler",10;db = byte 10 = 1 enter
	tamano equ $-mensaje

section .text 
	global _start
_start :
	mov eax,4 ;operacion escribir 
	mov ebx,1 ;tipo escritura 
	mov ecx,mensaje ; lo qe se va a imprimir
	mov edx,tamano ; numero de caracteres que se va a imprimir 
	int 80H ; envia una se;al al sistema operativo para ejecutar una subrutina

	mov eax,1
	int 80h
