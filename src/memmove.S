[BITS 64]

global	my_memmove:function

my_memmove:
	push rbp
	mov rbp, rsp
	xor rax, rax
	mov rsp, rsi
	
my_memmove_loop:
	cmp rax, rdx
	je my_memmove_end
	movzx rcx, BYTE [rsp+rax]
	mov [rdi+rax], cl
	inc rax
	jmp my_memmove_loop
	
my_memmove_end:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
