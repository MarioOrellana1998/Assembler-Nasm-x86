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
		msj db 10,"Ingrese un numero del 1 - 9 :  "
        len_msj equ $ - msj
        
		msj_c db "El valor convertido es  :   ",10
        len_msj_c equ $ - msj_c

        n3 db 0
        ;definir el arrglo
section .bss

	n1 resb 2;por el enter
	n2 resb 2 

section .text
	global _start
_start:
	
	escribir msj,len_msj
	leer  n1,2

	mov cx,[n3]


division:

	mov bl,[n1]
	sub bl,'0'
	mov al,2
	div bl
	inc cx
	push ax
	add al,0
	mov [n1],al
	sub al,'0'
	cmp al,1
	jz presentar
	jmp division

presentar:
	mov [n3],cx
	mov [n2],al
	escribir n2,2
	escribir msj_c,len_msj_c

numero_convertido:
	
	
	pop dx
	add dl,'0'
	mov [n2],al
	escribir n2,2
	mov cx,[n3]
	dec cx
	cmp cx,0
	jz salir
	mov [n3],cx
	jmp numero_convertido



salir:
	mov eax,1
	int 80h