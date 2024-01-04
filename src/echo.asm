section .bss
    buffer resb 64   ; Uninitialized buffer to store user input

section .data
    prompt db 'Enter something: ', 0
    prompt_len equ $ - prompt

section .text
    global _start

_start:
    ; Display a prompt
    mov eax, 4         ; System call number for sys_write
    mov ebx, 1         ; File descriptor 1 is stdout
    mov ecx, prompt    ; Address of the prompt string
    mov edx, prompt_len ; Length of the prompt string
    int 0x80           ; Call kernel

    ; Read user input
    mov eax, 3         ; System call number for sys_read
    mov ebx, 0         ; File descriptor 0 is stdin
    mov ecx, buffer    ; Address of the buffer
    mov edx, 64        ; Maximum number of bytes to read
    int 0x80           ; Call kernel

    ; Display the user input
    mov eax, 4         ; System call number for sys_write
    mov ebx, 1         ; File descriptor 1 is stdout
    mov ecx, buffer    ; Address of the buffer
    mov edx, 64        ; Length of the user input
    int 0x80           ; Call kernel

    ; Exit the program
    mov eax, 1         ; System call number for sys_exit
    xor ebx, ebx       ; Exit code 0
    int 0x80           ; Call kernel

