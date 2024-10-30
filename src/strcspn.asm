global strcspn

section	.text

strcspn:
	mov rcx, 0

loop:
    mov r9, 0
    cmp byte [rdi + rcx], 0
    je return_z
	mov r13b, byte [rdi + rcx]
	inc	rcx

loop2:
	mov r8b, byte [rsi + r9]
	cmp	r8b, 0
	je loop 
	cmp	r13b, r8b
	je return
	inc	r9
	jmp	loop2

return:
    sub	rcx, 1
    mov	rax, rcx
	ret
    
return_z:
	mov	rax, rcx
	ret