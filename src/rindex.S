[BITS 64]

global	my_rindex:function

my_rindex:
	push rbp
	mov rbp, rsp
	xor rax, rax
	
my_rindex_loop:
	movzx rdx, BYTE [rdi]
	cmp rdx, rsi
	je my_rindex_good
	cmp rdx, 0
	je my_rindex_end
	inc rdi
	jmp my_rindex_loop

my_rindex_good:
	mov rax, rdi
	inc rdi
	jmp my_rindex_loop
	
my_rindex_end:
	mov rsp, rbp
	pop rbp
	ret
