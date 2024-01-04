; expected output: "5" (coverted from number 5)
section .data
    buffer db 0

section .text
    global _start

_start:
	mov eax, 5
	add al, '0'
	mov [buffer], al

    ; Write the string to stdout
    mov eax, 4            ; System call number for sys_write
    mov ebx, 1            ; File descriptor 1 (stdout)
    mov ecx, buffer 
    mov edx, 1          ; Number of bytes to write
    int 0x80              ; Make the system call

    ; Exit the program
    mov eax, 1          ; syscall: exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; interrupt to invoke syscall




