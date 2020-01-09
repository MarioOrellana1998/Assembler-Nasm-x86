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
	msj  db 10,'Numero  Mayor',10                   
	len  equ $-msj
	msj1  db 10,'Numero Menor ',10                   
	len1  equ $-msj1
	msj2  db 10,'Ingrese el primer  numero ',10                   
	len2  equ $-msj2
	msj3  db 10,'Ingrese el segundo numero ',10                   
	len3  equ $-msj3
	new_line db 10,""

section .bss
	n1 resb 1
	n2 resb 1

section .text
	global _start
_start:
;---------------------------------------Lectura numeros -------------------------------
	escribir msj2,len2
	leer n1,2
	escribir msj3,len3
	leer n2,2

	mov ax,[n1]
	mov bx,[n2] 
	sub ax,'0'
	sub bx,'0'
	cmp ax,bx
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


