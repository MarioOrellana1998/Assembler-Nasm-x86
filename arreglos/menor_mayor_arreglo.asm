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
        

		msj_mayor db "EL mayor es :   ",10
        len_msj_mayor equ $ - msj_mayor

		msj_menor db "El menor es:   ",10
        len_msj_menor equ $ - msj_menor

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


	mov al,[esi]
	mov [numero],al

mayor:
	
	add esi,1
	add edi,1

	cmp esi,len_arreglo

	jz imprimir_mayor
	jb imprimir_mayor


	mov al,[numero]
	mov ah,[esi]

	cmp al,ah
	jb agregar_mayor
	jmp mayor


agregar_mayor:
	mov [numero],ah
	jmp mayor
imprimir_mayor:

	escribir msj_mayor,len_msj_mayor
	mov bl,[numero]
	add bl,'0'
	mov [numero],bl
	escribir numero,2
	jmp salir


salir:
	mov eax,1
	int 80h