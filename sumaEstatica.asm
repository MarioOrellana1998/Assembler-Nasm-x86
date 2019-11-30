section .data
	msj db 'El resultato es : ',10                   ;0xA = enter ./ejecutor.sh sumaestatica
	len equ $-msj
section .bss
	suma resb 1

section .text										;Para transformar de numero a cadena se suma "0"	
													;add registro , '0'	
													;De cadena a registro
													;Resto '0'
													;sub registro, '0'
	global _start
_start:
	mov eax,2
	mov ebx,4
	add eax,ebx

	add eax,'0'
	mov [suma],eax
	
	mov eax,4
	mov ebx,1
	mov ecx,msj
	mov edx,len
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx,suma
	mov edx,1
	int 80h


	

	mov eax,1
	int 80h
 
