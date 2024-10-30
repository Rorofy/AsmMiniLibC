global memset

SECTION .text

memset:     
    mov rcx, 0  

jump:         
    cmp rcx, rdx 
    jz return                      
    mov byte [rdi + rcx], sil        
    inc rcx                    
    jmp jump                     
return:
    mov rax, rdi     
    ret