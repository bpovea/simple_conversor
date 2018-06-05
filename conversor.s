	.file	"conversor.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
	.text
	.globl	binario
	.type	binario, @function
binario:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	cmpl	$0, -20(%rbp)
	je	.L4
	movl	-20(%rbp), %eax
	cltd
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	movl	%eax, -4(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	binario
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L1
.L4:
	nop
.L1:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	binario, .-binario
	.section	.rodata
.LC2:
	.string	"Conversion a decimal: %d"
	.text
	.globl	decimal
	.type	decimal, @function
decimal:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -20(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L6
.L9:
	movl	$0, -4(%rbp)
	jmp	.L7
.L8:
	subl	$10, -20(%rbp)
	addl	$1, -4(%rbp)
.L7:
	cmpl	$9, -20(%rbp)
	jg	.L8
	cvtsi2sd	-12(%rbp), %xmm2
	movsd	%xmm2, -32(%rbp)
	cvtsi2sd	-20(%rbp), %xmm3
	movsd	%xmm3, -40(%rbp)
	cvtsi2sd	-8(%rbp), %xmm0
	movq	.LC1(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, -48(%rbp)
	movsd	-48(%rbp), %xmm0
	call	pow@PLT
	mulsd	-40(%rbp), %xmm0
	addsd	-32(%rbp), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, -12(%rbp)
	addl	$1, -8(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -20(%rbp)
.L6:
	cmpl	$9, -20(%rbp)
	jg	.L9
	cvtsi2sd	-12(%rbp), %xmm4
	movsd	%xmm4, -32(%rbp)
	cvtsi2sd	-4(%rbp), %xmm5
	movsd	%xmm5, -40(%rbp)
	cvtsi2sd	-8(%rbp), %xmm0
	movq	.LC1(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, -48(%rbp)
	movsd	-48(%rbp), %xmm0
	call	pow@PLT
	mulsd	-40(%rbp), %xmm0
	addsd	-32(%rbp), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	decimal, .-decimal
	.section	.rodata
.LC3:
	.string	"Bienvenido"
	.align 8
.LC4:
	.string	"Escoja una opcion de conversion\n1. Dec -> Bin\n2. Bin -> Dec\n?:"
.LC5:
	.string	"Escriba el numero Decimal: "
.LC6:
	.string	"Conversion a Binario: "
.LC7:
	.string	"Escriba el numero Binario: "
	.align 8
.LC8:
	.string	"Opcion incorrecta, trate nuevamente"
	.align 8
.LC9:
	.string	"\n\nPara salir ingrese -1\nPara continuar ingrese 1\n?:"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$1, -16(%rbp)
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	jmp	.L11
.L15:
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	jne	.L12
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	binario
	jmp	.L13
.L12:
	movl	-16(%rbp), %eax
	cmpl	$2, %eax
	jne	.L14
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	decimal
	jmp	.L13
.L14:
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	movl	$1, -16(%rbp)
	jmp	.L11
.L13:
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
.L11:
	movl	-16(%rbp), %eax
	cmpl	$1, %eax
	je	.L15
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1073741824
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
