%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

%macro leer 2
mov eax,3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
	msj1 db 'Ingrese el primer numero  : ',10                   ;0xA = enter ./ejecutor.sh sumaestatica
	len1 equ $-msj1
	msj2 db 'Ingrese el segundo numero  : ',10                   ;0xA = enter ./ejecutor.sh sumaestatica
	len2 equ $-msj2
	msj3 db 'El resultado es  : ',10                   ;0xA = enter ./ejecutor.sh sumaestatica
	len3 equ $-msj3
section .bss
	n1 resb 1
	n2 resb 1
	suma resb 1
section .text										;Para transformar de numero a cadena se suma "0"	
													;add registro , '0'	
													;De cadena a registro
													;Resto '0'
													;sub registro, '0'
	global _start
_start:


;***********************************Ingreso del primer numero **************************

	escribir msj1,len1

	leer n1,2


;***********************************Ingreso del segundo numero **************************

	escribir msj2,len2

	leer n2,2


;***********************************Proceso de suma **************************

	mov ax,[n1]
	mov bx,[n2] ;Todos los datos que entren por el tecclado son cadenas
	sub ax,'0'
	sub bx,'0'
	add ax,bx
	add ax,'0'
	mov [suma],ax


	
;***********************************Impoprimo suma **************************

	escribir msj3,len3

	mov eax,4
	mov ebx,1
	mov ecx,suma
	mov edx,1
	int 80h


	

	mov eax,1
	int 80h
 