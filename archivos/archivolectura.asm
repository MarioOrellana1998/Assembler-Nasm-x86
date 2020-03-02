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
	archivo db "/home/mario/codigo.txt",0
	len_archivo equ $ - archivo

	error_archivo db "Error , el archivo no se encuentra , cambialo prro",0
	len_error equ $ - error_archivo
section .bss
	idarchivo resb 1
	texto resb 30

section .text
	global _start
_start:
	mov eax,5;se convoca una subrutina al sistema operativ :v
	mov ebx,archivo
	mov ecx,0
	mov edx,0
	int 80h
	;modos de acceso 
	;R-only = 0
	;w-only = 1
	;RDWR =2 

	test eax,eax ;bandera  zero = 0
	jz error

	mov dword [idarchivo],eax

	mov eax,3
	mov ebx,[idarchivo]
	mov ecx,texto
	mov edx,30;longitud
	int 80h

	escribir texto,30

;*******************Cerrar archivo ***********************
	mov eax,6
	mov ebx,[idarchivo]
	mov ecx,0
	mov edx,0;longitud
	int 80h


	jmp salir







error:
	escribir error_archivo,len_error
salir:
	mov eax,1
	int 80h















