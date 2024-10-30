global strpbrk

section	.text

strpbrk:
	mov rcx, 0

loop:
    mov r9, 0
    cmp byte [rdi + rcx], 0
    je return_z
	mov	r13b, byte [rdi + rcx]
	inc	rcx

loop2:
	mov	r8b, byte [rsi + r9]
	cmp	r8b, 0
	je loop 
	cmp	r13b, r8b
	je return
	inc	r9
	jmp	loop2

return:
    mov	rax, rdi
	sub	rcx, 1
	add	rax, rcx
	ret
    
return_z:
	mov	rax, 0
	ret