[BITS 64]

global	my_strchr:function

my_strchr:
	push rbp
	mov rbp, rsp
	xor rax, rax
	
my_strchr_loop:
	movzx rdx, BYTE [rdi]
	cmp rdx, rsi
	je my_strchr_good
	cmp rdx, 0
	je my_strchr_end
	inc rdi
	jmp my_strchr_loop

my_strchr_good:
	mov rax, rdi
	
my_strchr_end:
	mov rsp, rbp
	pop rbp
	ret
