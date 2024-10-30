global strcasecmp

SECTION .text

strcasecmp:     
    mov rcx, 0  

before_loop: 
    mov r8b, byte [rdi + rcx]
    mov r9b, byte [rsi + rcx]

loop:                            
    cmp r8b, 0
    je return
    cmp r9b, 0
    je return
    cmp r8b, "a"
    jge check_char_case_arg1

check_arg2:
    cmp r9b, "a"
    jge check_char_case_arg2

check_cmp:
    cmp r8b, r9b
    jne return
    inc rcx         
    jmp before_loop 

check_char_case_arg1:
	cmp r8b, "z"
	jle char_arg1_to_upcase
	jmp check_arg2

check_char_case_arg2:
	cmp r9b, "z"
	jle char_arg2_to_upcase
	jmp check_cmp

char_arg1_to_upcase:
	sub r8b, 32
	jmp loop

char_arg2_to_upcase:
	sub r9b, 32
	jmp loop

return:
    sub r8b, r9b
    movsx rax, r8b
    ret