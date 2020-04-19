[BITS 64]
	
global	my_strstr:function

my_strstr:
	push rbp
	mov rbp, rsp
	jmp my_strstr_loop
	
my_strstr_incr:
	inc rdi

my_strstr_loop:
	xor rax, rax
	jmp my_strstr_cmp

my_strstr_cmp:
	movzx rcx, BYTE [rsi+rax]
	cmp BYTE [rdi+rax], 0
	je my_strstr_bad
	cmp cl, 0
	je my_strstr_end
	cmp BYTE [rdi+rax], cl
	jne my_strstr_incr
	inc rax
	jmp my_strstr_cmp

my_strstr_bad:
	mov rdi, 0
	
my_strstr_end:
	mov rax, rdi
	mov rsp, rbp
	pop rbp	
	ret
