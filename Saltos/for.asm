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
		msj db 10, "item ",10
        len equ $ - msj       
section .bss
		n1 resb 2

section .text 
        global _start ;posicion de memoria 
_start:
	mov cx,9

ciclo : 
	

	
	cmp cx,0
	jz salir
	dec cx
	

	;jnz imprimir_mensaje
	;jz salir 



imprimir_mensaje :

	
	mov eax,4
	mov ebx,1
	push cx
	add cx,'0'
	mov [n1],cx
	mov ecx,msj
	mov edx,len
	int 80h

	escribir n1,1


	pop cx
	jmp ciclo



salir :
	mov eax,1
	int 80h

