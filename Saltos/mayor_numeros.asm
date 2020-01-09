section .data
	msj  db 10,'Numero  Mayor',10                   
	len  equ $-msj
	msj1  db 10,'Numero Menor ',10                   
	len1  equ $-msj1

section .text
	global _start
_start:
	mov al,4
	mov bl,6
	cmp al,bl
	jg mayor;(zf) =0 (cf)=0
	jmp menor;
mayor:
	mov eax,4
	mov ebx,1
	mov ecx,msj
	mov edx,len
	int 80h
	jmp salir
menor:
	mov eax,4
	mov ebx,1
	mov ecx,msj1
	mov edx,len1
	int 80h


salir:
	mov eax,1
	int 80h


