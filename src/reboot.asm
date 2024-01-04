section .text
	global  _start

_start:
	; Sync
	mov eax, 36
	int 0x80

	; Reboot
	mov eax, 88
	mov ebx, 0xfee1dead ; Magic num 1
	mov ecx, 0x28121969 ; Magic num 2
	mov edx, 0x1234567 ; Code for reboot
	mov esi, 0 ; args
	int 0x80

	;   Exit the program
	mov eax, 1
	xor ebx, ebx
	int 0x80
