global strcmp

SECTION .text

strcmp:     
    mov rcx, 0

jump:                               
    mov r8b, byte [rdi + rcx]
    mov r9b, byte [rsi + rcx]
    cmp r8b, byte 0
    je return
    cmp r9b, byte 0
    je return
    cmp r8b, r9b
    jne return
    inc rcx
    jmp jump

return:
    sub r8b, r9b
    movsx rax, r8b
    ret