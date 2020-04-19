[BITS 64]

global	my_strlen:function

my_strlen:
	push rbp
	mov rbp, rsp
	xor rax, rax

my_strlen_loop:
	cmp BYTE [rdi+rax], 0
	je my_strlen_end
	inc rax
	jmp my_strlen_loop

my_strlen_end:
	mov rsp, rbp
	pop rbp	
	ret
