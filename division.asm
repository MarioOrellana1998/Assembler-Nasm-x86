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
	msj1 db 'Ingrese el primer numero  : ',10                   
	len1 equ $-msj1
	msj2 db 'Ingrese el segundo numero  : ',10                   
	len2 equ $-msj2
	msj3 db 'El cociente es : ',10                  
	len3 equ $-msj3
section .bss
	n1 resb 1
	n2 resb 1
	division resb 1
section .text									
	global _start
_start:


;***********************************Ingreso del primer numero **************************

	escribir msj1,len1

	leer n1,2


;***********************************Ingreso del segundo numero **************************

	escribir msj2,len2

	leer n2,2


;***********************************Proceso de division **************************

	mov al,[n1]
	mov bl,[n2] 
	sub al,'0'
	sub bl,'0'
	div bl
	add al,'0'
	mov [division],al


	
;***********************************Impoprimo division **************************

	escribir msj3,len3

	mov eax,4
	mov ebx,1
	mov ecx,division
	mov edx,1
	int 80h


	

	mov eax,1
	int 80h
 