global rindex

section	.text
rindex:
	cmp byte [rdi], 0
	je loop
	inc rdi
	jmp	rindex

loop:
	cmp sil, 0
    je return 
	dec	rdi
    cmp byte [rdi], 0
	je return_z
	cmp	byte [rdi], sil
    je return
	jmp	loop

return_z:
    mov rax, 0
    ret
return:
	mov	rax, rdi
	ret