[BITS 64]

global	my_strpbrk:function

my_strpbrk:
	push rbp
	mov rbp, rsp
	jmp my_strpbrk_loop
	
my_strpbrk_incr:
	inc rdi

my_strpbrk_loop:
	xor rax, rax
	jmp my_strpbrk_cmp

my_strpbrk_cmp:
	movzx rcx, BYTE [rsi+rax]
	cmp BYTE [rdi], 0
	je my_strpbrk_bad
	cmp cl, 0
	je my_strpbrk_incr
	cmp BYTE [rdi], cl
	je my_strpbrk_end
	inc rax
	jmp my_strpbrk_cmp

my_strpbrk_bad:
	mov rdi, 0
	
my_strpbrk_end:
	mov rax, rdi
	mov rsp, rbp
	pop rbp	
	ret
