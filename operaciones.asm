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
	msj  db 10,'Operaciones basicas de 8 bits :v',10,'1.Suma',10,'2.Resta',10,'3.Multiplicacion',10,'4.division',10                   
	len  equ $-msj
	msj1 db 10,'Ingrese el primer numero  : '                   
	len1 equ $-msj1
	msj2 db 10,'Ingrese el segundo numero  : '                 
	len2 equ $-msj2
	msj3 db 10,'La suma es : '                  
	len3 equ $-msj3
	msj4 db 10,'La resta es : '                  
	len4 equ $-msj4
	msj5 db 10,'La Multiplicacion es : '                  
	len5 equ $-msj5
	msj6 db 10,'El cociente es : '                  
	len6 equ $-msj6
	msj7 db 10,'El residuo es  : '                  
	len7 equ $-msj7
	msj8 db 10,'Saliendo ...... '                  
	len8 equ $-msj8
	new_line db 10,""

section .bss
	n1		 resb 1
	n2 		 resb 1
	suma  	 resb 1
	resta    resb 1
	multiplicacion resb 1
	cociente resb 1
	residuo  resb 1
section .text									
	global _start
_start:


;***********************************Presentacion del menu**************************
	escribir msj,len
;***********************************Ingreso del primer numero **************************
	escribir msj1,len1
	leer n1,2
;***********************************Ingreso del segundo numero **************************
	escribir msj2,len2
	leer n2,2
;***********************************Proceso de suma  **************************
	mov ax,[n1]
	mov bx,[n2] 
	sub ax,'0'
	sub bx,'0'
	add ax,bx
	add ax,'0'
	mov [suma],ax
	escribir msj3,len3
	escribir suma,1
;***********************************Proceso de resta **************************
	mov ax,[n1]
	mov bx,[n2] 
	sub ax,'0'
	sub bx,'0'
	sub ax,bx
	add ax,'0'
	mov [resta],ax
	escribir msj4,len4
	escribir resta,1
;***********************************Proceso de multiplicacion **************************
	mov ax,[n1]
	mov bx,[n2] 
	sub ax,'0'
	sub bx,'0'
	mul bx
	add ax,'0'
	mov [multiplicacion],ax
	escribir msj5,len5
	escribir multiplicacion,1
;***********************************Proceso de division **************************
	
	mov al,[n1]
	mov bl,[n2] 
	sub al,'0'
	sub bl,'0'
	div bl
	add al,'0'
	add ah,'0'
	mov [cociente],al
	mov [residuo],ah
	escribir msj6,len6
	escribir cociente,1
	escribir msj7,len7
	escribir residuo,1	
;***********************************saliendo  **************************

	escribir msj8,len8
	escribir new_line,1
	


	

	mov eax,1
	int 80h
 