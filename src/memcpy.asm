global memcpy

SECTION .text

memcpy:     
    mov rcx, 0  

jump:         
    cmp rcx, rdx 
    jz return                      
    mov r8b, byte [rsi + rcx]
    mov byte [rdi + rcx], r8b
    inc rcx                   
    jmp jump                      
return:
    mov rax, rdi     
    ret               