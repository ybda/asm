section .data
	hello_msg db "Hello, Assembly!",0

section .text
	global  _start

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, hello_msg
	mov edx, 16
	int 0x80

	;   Exit the program
	mov eax, 1
	xor ebx, ebx
	int 0x80
