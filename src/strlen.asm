global strlen

SECTION .text

strlen:
    mov rcx, 0       
    mov r9b, 0    

jump:
    mov r8b, byte [rdi + rcx]    
    inc rcx                     
    cmp r9b, r8b                
    jz return                   
    jmp jump                    
 
return:
    mov rax, rcx
    sub rax, 1               
    ret                  
