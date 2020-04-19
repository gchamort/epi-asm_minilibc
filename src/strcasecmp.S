[BITS 64]

global	my_strcasecmp:function

my_strcasecmp:
	push rbp
	mov rbp, rsp
	xor r8, r8

my_strcasecmp_loop:
	movzx rcx, BYTE [rsi+r8]
	movzx rax, BYTE [rdi+r8]
	cmp rcx, 65	
	jge my_strcasecmp_check_rcx

my_strcase_cmp_fcheck:	
	cmp rax, 65
	jge my_strcasecmp_check_rax

my_strcase_cmp_scheck:	
	cmp al, cl
	jne my_strcasecmp_bad
	cmp cl, 0
	je my_strcasecmp_good
	inc r8
	jmp my_strcasecmp_loop

my_strcasecmp_check_rcx:
	cmp rcx, 90
	jle rcx_lower
	jmp my_strcase_cmp_fcheck
		
my_strcasecmp_check_rax:
	cmp rax, 90
	jle rax_lower
	jmp my_strcase_cmp_scheck

rcx_lower:
	add rcx, 32
	jmp my_strcase_cmp_fcheck

rax_lower:
	add rax, 32
	jmp my_strcase_cmp_scheck
	
my_strcasecmp_good:
	mov rax, 0
	jmp my_strcasecmp_end

my_strcasecmp_bad:
	sub rax, rcx

my_strcasecmp_end:	
	mov rsp, rbp
	pop rbp
	ret
