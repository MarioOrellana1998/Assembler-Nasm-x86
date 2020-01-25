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

        msj db 10, "Ingrese el numero:",10
        len equ $ - msj

        msj_primo db 10,"El numero es primo  ",10
        len_primo equ $ - msj_primo

        msj_no_primo db 10,"El numero no es primo  ",10
        len_no_primo equ $ - msj_no_primo


        
section .bss
        n1 resb 2
section .text
        global _start 
_start:

     
; ***************************Primer numero ****************************
        escribir msj, len
        leer n1, 2
; ************************proceso ciclo ***************************

        mov ch, 1
        mov dh, 0
     ; mov[cociente],al
    ;mov [residuo],ah
ciclo :  
    

    mov al,[n1]
    cmp al,ch
    jng resultado
    mov bl,ch
    sub al,'0'
    div bl
    inc ch
    cmp ah,0
    je aumentar
    jmp no_hacer_nada

no_hacer_nada:
    
    jmp ciclo
    
   
aumentar : 

    inc dh
    jmp ciclo

resultado: 
	    
        cmp dh,2
        je es_primo
        jmp no_es_primo 

es_primo:
 
        escribir msj_primo,len_primo
        jmp salir

no_es_primo:
        
        escribir msj_no_primo,len_no_primo
        jmp salir

salir: 
        mov eax, 1
        int 80h