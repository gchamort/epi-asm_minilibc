[BITS 64]

global	my_memcpy:function

my_memcpy:
	push rbp
	mov rbp, rsp
	xor rax, rax

my_memcpy_loop:
	cmp rax, rdx
	je my_memcpy_end
	movzx rcx, BYTE [rsi+rax]
	mov [rdi+rax], cl
	inc rax
	jmp my_memcpy_loop
	
my_memcpy_end:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
