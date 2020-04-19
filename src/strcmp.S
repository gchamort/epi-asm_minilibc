[BITS 64]

global	my_strcmp:function

my_strcmp:
	push rbp
	mov rbp, rsp
	xor rax, rax

my_strcmp_loop:
	movzx rcx, BYTE [rsi+rax]
	cmp BYTE [rdi+rax], cl
	jne my_strcmp_bad
	cmp cl, 0
	je my_strcmp_good
	inc rax
	jmp my_strcmp_loop
	
my_strcmp_good:
	mov rax, 0
	jmp my_strcmp_end

my_strcmp_bad:
	movzx rax, BYTE [rdi+rax]
	sub rax, rcx

my_strcmp_end:	
	mov rsp, rbp
	pop rbp
	ret
