; expected output: "0\n1\n2\n3\n4\n"
section .data
    counter dd 0          ; Initialize a counter variable
    newline db 10         ; ASCII code for newline character
    buffer db 0   

section .text
    global _start

_start:
    mov eax, [counter]    ; Load the counter value into eax
    cmp eax, 5            ; Compare the counter with 5
    jge end_loop          ; Jump to end_loop if counter >= 5
    
    ; Convert integer to string and print
	add al, '0'
	mov [buffer], al

    mov eax, 4            ; System call number for sys_write
    mov ebx, 1            ; File descriptor 1 (stdout)
    mov ecx, buffer 
    mov edx, 1          ; Number of bytes to write
    int 0x80              ; Make the system call

    ; Print a newline character
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Increment the counter
    inc dword [counter]
    jmp _start            ; Jump back to the beginning of the loop

end_loop:
    ; Exit the program
    mov eax, 1          ; syscall: exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; interrupt to invoke syscall
