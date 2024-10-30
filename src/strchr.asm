global strchr

SECTION .text

strchr:
    mov r9b, 0     

jump:
    cmp sil, byte [rdi]            
    jz return_index                 
    cmp r9b, byte [rdi]       
    jz return_null                  
    inc rdi                    
    jmp jump             

return_index:   
    mov rax, rdi           
    jmp end       

return_null:
    mov rax, 0 
    jmp end

end:
    ret