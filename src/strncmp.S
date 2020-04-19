[BITS 64]

global	my_strncmp:function

my_strncmp:
	push rbp
	mov rbp, rsp
	xor rax, rax
	sub rdx, 1
	
my_strncmp_loop:
	movzx rcx, BYTE [rsi+rax]
	cmp BYTE [rdi+rax], cl
	jne my_strncmp_bad
	cmp cl, 0
	je my_strncmp_good
	cmp rax, rdx
	je my_strncmp_good
	inc rax
	jmp my_strncmp_loop
	
my_strncmp_good:
	mov rax, 0
	jmp my_strncmp_end

my_strncmp_bad:
	movzx rax, BYTE [rdi+rax]
	sub rax, rcx

my_strncmp_end:	
	mov rsp, rbp
	pop rbp
	ret
