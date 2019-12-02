%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
	msj1 db 'Operacion division de 8 bits  : ',10                   
	len1 equ $-msj1
	msj2 db  10,'El cociente es  : '                 
	len2 equ $-msj2
	msj3 db  10,'El residuo es  : '         
	len3 equ $-msj3
	new_line db 10,""
section .bss
	residuo resb 1
	cociente resb 1
section .text									
	global _start
_start:




	escribir msj1,len1


	mov ax,9
	mov bl,2
	div bl
	add al,'0'
	mov [cociente],al
	add ah,'0'
	mov [residuo],ah
;******************cociente ******************
	escribir msj2,len2
	escribir cociente,1
;******************residui *******************
	escribir msj3,len3
	escribir residuo,1
;******************final *******************
  




  	escribir new_line,2
	mov eax,1
	int 80h
 