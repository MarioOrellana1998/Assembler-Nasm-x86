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
		msj db 10,"Ingrese 6  numeros :  "
        len_msj equ $ - msj
        

		msj_numeros db "Los numeros son :   ",10
        len_msj_numeros equ $ - msj_numeros

        arreglo db 0,0,0,0,0,0
        len_arreglo equ $ - arreglo


        ;definir el arrglo
section .bss

	numero resb 2;por el enter


section .text
	global _start
_start:
	
	escribir msj,len_msj


	;asignacion del arreglo en las posiciones efectivas
	mov esi,arreglo
	mov edi,0

	;Estructura repetitiva que me permita leer cada uno de los componentes 

conteo:
	leer numero,2
	;asignacion de un numero en el arreglo 

	mov al,[numero]
	sub al,'0'
	mov [esi],al

	;incrementar una poscicion en el arreglo
	add esi,1
	add edi,1

	;comparar para el salto
	cmp edi,len_arreglo
	jb conteo

	mov esi,arreglo
	mov edi,0

	escribir msj_numeros,len_msj_numeros
escribir_arreglo:

	

	mov al,[esi]
	add al,'0'
	mov [numero],al

	add esi,1
	add edi,1

	escribir numero,2
	cmp edi,len_arreglo
	jb escribir_arreglo
	jmp salir

salir:
	mov eax,1
	int 80h