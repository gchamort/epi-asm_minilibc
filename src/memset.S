[BITS 64]

global	my_memset:function

my_memset:
	push rbp
	mov rbp, rsp
	xor rax, rax
	mov rcx, rsi
	
my_memset_loop:
	cmp rax, rdx
	je my_memset_end
	mov [rdi+rax], cl
	inc rax
	jmp my_memset_loop

my_memset_end:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
