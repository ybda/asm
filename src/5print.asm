; Print "Hello\n" 5 times

section .data
	hello_msg db "Hello",0
	counter dd 0          ; Initialize a counter variable
    newline db 10         ; ASCII code for newline character

section .text
	global  _start

_start:
	mov eax, [counter]    ; Load the counter value into eax
    cmp eax, 5            ; Compare the counter with 5
    jge end_loop          ; Jump to end_loop if counter >= 5

	mov eax, 4
	mov ebx, 1
	mov ecx, hello_msg
	mov edx, 5 ; size of hello_msg
	int 0x80

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
	;   Exit the program
	mov eax, 1
	xor ebx, ebx
	int 0x80
