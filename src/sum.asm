section .text
    global _start

_start:
    mov eax, 5          
    add eax, 7          
    ; The result (12) is now in register eax

    ; Exit the program
    mov eax, 1          ; syscall: exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; interrupt to invoke syscall

