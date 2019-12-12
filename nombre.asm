section .data
	name db "mario",10 
	second_name db "Orellana",10
	length equ $-name
	length2 equ $-second_name
section .text
	global _start
_start :
	mov eax,4
	mov ebx,1
	mov ecx,name
	mov edx,length
	int 80H

	mov eax,4
	mov ebx,1
	mov ecx,second_name
	mov edx,length2
	int 80H

	mov eax,1
	int 80h
