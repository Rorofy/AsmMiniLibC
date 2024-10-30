global memmove

SECTION .text

memmove:
	mov rcx, 0
	cmp rdx, 0
	je return

get_string:
	cmp rcx, rdx
	je set_string
	movsx r9, byte [rsi + rcx]
	push r9
	inc rcx
    jmp get_string

set_string:
	pop r9
	dec rcx
	mov byte [rdi + rcx], r9b
	cmp rcx, 0
	je return
	jmp set_string

return:
	mov rax, rdi
	ret