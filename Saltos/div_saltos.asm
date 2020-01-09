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

%macro variable 1
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, 1
        int 80h
%endmacro


section .data
        msj db 10, "Ingrese el primer numero:",10
        len1 equ $ - msj
        msj2 db 10, "Ingrese el segundo numero:",10
        len2 equ $ - msj2

        mensajen1 db 10,"El cociente: ",10
        lenn1 equ $ - mensajen1

        mensajen2 db 10,"El residuo: ",10
        lenn2 equ $ - mensajen2

section .bss
        n1 resb 1
        n2 resb 2
        resta resb 1
        coc resb 1
        resid resb 1
section .text
        global _start 
_start:

      
; ***************************Primer numero ****************************

        escribir msj, len1 

        leer n1, 2


; ************************Segundo numero ***************************

        escribir msj2, len2

        leer n2, 2 

        mov al, [n1]
	    mov bl, [n2]
	    mov cx, 0
	    sub al, '0'
	    sub bl, '0'

division: 
        sub al, bl
	    inc cx
	    cmp al,bl
	    jg division
        je division
	    jmp resultado
resultado: 
	    add al,'0'
	    add cx,'0'
	    mov [coc], cx
	    mov [resid], al

        escribir mensajen1, lenn1
        variable coc

        escribir mensajen2, lenn2
        variable resid

        jmp salir
salir: 
        mov eax, 1
        int 80h