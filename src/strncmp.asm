global strncmp

SECTION .text

strncmp:     
    mov rcx, 0  

jump:                               
    mov r8b, byte [rdi + rcx]
    mov r9b, byte [rsi + rcx]
    cmp rcx, rdx
    jz return_z
    cmp r8b, 0
    jz return
    cmp r9b, 0
    jz return 
    cmp r8b, r9b
    jnz return
    inc rcx                   
    jmp jump

return_z:
    mov rax, 0
    ret

return:
    sub r8b, r9b
    movsx rax, r8b
    ret               