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
		msj db 10, "Es negativo ",10
        len equ $ - msj
        msj1 db 10, "Es positivo ",10
        len1 equ $ - msj1
         mensaje_n1 db 10, "Ingrese el primer numero : ",10
        len_n1 equ $ - mensaje_n1
        mensaje_n2 db 10, "Ingrese el segundo numero: ",10
        len_n2 equ $ - mensaje_n2
section .bss

 		n1 resb 2
        n2 resb 2

section .text 
        global _start ;posicion de memoria 
_start:

;******************Ingreso de los numeros **********************

		escribir mensaje_n1,len_n1
		leer n1,2
   		
   		escribir mensaje_n2,len_n2
		leer n2,2

;***********************Proceso de comparacion 
	mov ax,[n1]
	mov bx,[n2]
	sub ax, '0'
	sub bx, '0'
	sub ax,bx ; movimiento /cambio banderas
	js negativo ; a una etiqueta
	jmp positivo

positivo :

	mov eax,4
	mov ebx,1
	mov ecx,msj1
	mov edx,len1
	int 80h
	jmp salir



negativo: 
	mov eax,4
	mov ebx,1
	mov ecx,msj
	mov edx,len
	int 80h
	jmp salir

salir :
	mov eax,1
	int 80h

