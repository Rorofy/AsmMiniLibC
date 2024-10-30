global strstr

section .text

strstr:
	mov rcx, 0		
	mov r9, 0

loop:
	mov r12b, byte [rdi + rcx]
	mov r13b, byte [rsi + r9]
	cmp r13b, 0
	je return_pointer
	cmp r12b, 0
	je return_z
	cmp r12b, r13b
	je inc_r9_rcx
	inc rcx
	jmp reset_counter

inc_r9_rcx:
    inc r9
    inc rcx
    jmp loop

reset_counter:
	mov r9, 0
	jmp loop

return_z:
	mov rax, 0
	ret

return_pointer:
	sub rcx, r9
    add rdi, rcx
	mov rax, rdi
    ret