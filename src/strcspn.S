[BITS 64]

global	my_strcspn:function

my_strcspn:
	push rbp
	mov rbp, rsp
	xor r8, r8

my_strcspn_loop:
	movzx rcx, BYTE [rdi+r8]
	xor r9, r9

inter_loop:	
	movzx rax, BYTE [rsi+r9]
	cmp al, cl
	je my_strcspn_end
	inc r9
	cmp BYTE [rsi+r9], 0
	je stop_inter_loop
	jmp inter_loop

stop_inter_loop:	
	inc r8
	cmp BYTE [rdi+r8], 0
	je my_strcspn_end
	jmp my_strcspn_loop

my_strcspn_end:
	mov rax, r8
	mov rsp, rbp
	pop rbp
	ret
