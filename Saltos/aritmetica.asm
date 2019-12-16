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
	msj  db 10,'Aritmetica para 100tificos :v',10,'1.Cuadrado',10,'2.rectangulo',10,'3.circulo',10,'4.Salir',10                   
	len  equ $-msj
	msj1 db 10,'Ingrese el valor de un lado del Cuadrado : '                   
	len1 equ $-msj1
	msj2 db 10,'Ingrese el valor de la base del rectangulo : '                 
	len2 equ $-msj2
	msj3 db 10,'Ingrese el valor de la altura del rectangulo : '                  
	len3 equ $-msj3
	msj4 db 10,'Ingrese el valor del radio : '                  
	len4 equ $-msj4
	msj5 db 10,'Saliendo ...... '                  
	len5 equ $-msj5
	msj6 db 10,'Ingrese una opcion:'                  
	len6 equ $-msj6
	new_line db 10,""
	msj7 db 10,'El areaa del cuadrado es : '                  
	len7 equ $-msj7
	msj8 db 10,'El areaa del rectangulo es : '                  
	len8 equ $-msj8
	msj9 db 10,'El areaa del circulo es : '                  
	len9 equ $-msj9
	pi db '3.14'

section .bss
	lado		 resb 1
	areacuadrado	resb 1
	base 		 resb 1
	altura 	 resb 1	
	arearectangulo resb 1 	
	radio  	 resb 1
	areacirculo	resb 1
	opcion    resb 1
section .text									
	global _start
_start:


;***********************************Presentacion del menu**************************
	escribir msj,len
opciones:
;***********************************Ingreso la opcion **************************
	escribir msj6,len6
	leer opcion,2
	mov bh,[opcion]
	sub bh,'0'

;***********************************Comparaciones**************************
	cmp bh,1
		je cuadrado
	cmp bh,2
		je rectangulo
	cmp bh,3
		je circulo
	cmp bh,4
		je saliendo

cuadrado:
;***********************************Proceso de cuadrado   **************************
	escribir msj1,len1
	leer lado,2

	mov ax,[lado]
	mov bx,[lado] 
	sub ax,'0'
	sub bx,'0'
	mul bx
	add ax,'0'
	mov [areacuadrado],ax
	escribir msj7,len7
	escribir areacuadrado,1
	jmp opciones

rectangulo:
;***********************************Proceso de rectangulo **************************
	escribir msj2,len2
	leer base,2
	escribir msj3,len3
	leer altura,2


	mov ax,[base]
	mov bx,[altura] 
	sub ax,'0'
	sub bx,'0'
	mul bx
	add ax,'0'
	mov [arearectangulo],ax
	escribir msj8,len8
	escribir arearectangulo,1
	jmp opciones
circulo:

;***********************************Proceso de circulo **************************
	escribir msj4,len4
	leer radio,2


	mov ax,[radio]
	mov bx,[radio] 
	sub ax,'0'
	sub bx,'0'
	mul bx
	mov bx,[pi]
	sub bx,'0'
	mul bx
	add ax,'0'
	mov [areacirculo],ax
	escribir msj9,len9
	escribir areacirculo,1
	jmp opciones

saliendo:
;***********************************saliendo  **************************

	escribir msj5,len5
	escribir new_line,1
	

	mov eax,1
	int 80h
 


