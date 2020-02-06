;Nombre : Mario Orellana
;Paralelo : 6to B 
;fecha : 3/02/2020
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
  
        msj_n1 db "Ingrese el primer numero :  "
        len_msj_n1 equ $ - msj_n1
        msj_n2 db "Ingrese el segundo numero :  "
        len_msj_n2 equ $ - msj_n2
        msj_n3 db "Ingrese el tercer numero :   "
        len_msj_n3 equ $ - msj_n3
        msj_n4 db "Ingrese el cuarto numero :  "
        len_msj_n4 equ $ - msj_n4
        msj_n5 db "Ingrese el quinto numero:   "
        len_msj_n5 equ $ - msj_n5

        msj_mayor db "El numero mayor es "
        len_msj_mayor equ $ - msj_mayor
        msj_menor db "El numero menor es "
        len_msj_menor equ $ - msj_menor

        msj_enter db 10,"",10
        len_msj_enter equ $ - msj_enter

section .bss
        n1 resb 1
        n2 resb 1
        n3 resb 1
        n4 resb 1
        n5 resb 1
section .text   
      global _start 
_start:

		escribir msj_n1, len_msj_n1
        leer n1, 2
        escribir msj_n2, len_msj_n2
        leer n2, 2
        escribir msj_n3, len_msj_n3
        leer n3, 2
        escribir msj_n4, len_msj_n4
        leer n4, 2
        escribir msj_n5, len_msj_n5
        leer n5, 2

principal:
		escribir n1,11
		escribir n2,11
		escribir n3,11
		escribir n4,11
		escribir n5,11

		escribir msj_enter,len_msj_enter 
		mov eax ,[n1]
		mov ebx ,[n2]
        sub eax,'0'
        sub ebx,'0'
        cmp eax,ebx
        jg cambio1
        mov eax ,[n2]
		mov ebx ,[n3]
        sub eax,'0'
        sub ebx,'0'
        cmp eax,ebx
        jg cambio2
        mov eax ,[n3]
		mov ebx ,[n4]
        sub eax,'0'
        sub ebx,'0'
        cmp eax,ebx 
        jg cambio3
        mov eax ,[n4]
		mov ebx ,[n5]
        sub eax,'0'
        sub ebx,'0'
        cmp eax,ebx 
        jg cambio4
        jmp imprimir

cambio1 : 
		mov eax ,[n1]
		mov ebx ,[n2]
        mov [n1],ebx
        mov [n2],eax
        jmp principal
cambio2 : 
		mov eax ,[n2]
		mov ebx ,[n3] 
        mov [n2],ebx
        mov [n3],eax
        jmp principal
cambio3 : 
		mov eax ,[n3]
		mov ebx ,[n4]
        mov [n3],ebx
        mov [n4],eax
        jmp principal
cambio4 : 
		mov eax ,[n4]
		mov ebx ,[n5]
        mov [n4],ebx
        mov [n5],eax

        jmp principal

imprimir :

		escribir n1,1
		escribir n2,1
		escribir n3,1
		escribir n4,1
		escribir n5,1
		


		jmp salir

salir:
    mov eax,1
    int 80h



