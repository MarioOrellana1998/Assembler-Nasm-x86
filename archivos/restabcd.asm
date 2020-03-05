section .data
	numero1 db '518'
	numero2 db '197'
	resultado db '000'
	len equ $ - resultado
section .text
	global _start
_start:
	mov esi,2
	mov ecx,3
	;desactivar el estado activo del carry
	clc  

proceso_suma:
	;posiciones del arreglo
	mov al,[numero1 + esi]
	;mov ah,[numero2 + esi]
	;adc al,ah

	sbb al,[numero2 + esi]
	aas
	pushf
	or al,30h ;----> aas 
	popf
	mov [resultado+esi],al

	;aas ; no afecta  al / adc ->suma carry / ajustar bcd
	dec esi
	loop proceso_suma


	mov eax,4
	mov ebx,1
	mov ecx,resultado
	mov edx,len
	int 80h

	mov eax,1
	int 80h

	

