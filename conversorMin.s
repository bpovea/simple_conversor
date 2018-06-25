	.file	"conversorMin.c"
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
	.string	"\nConversion a decimal: %d\n"
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
	.string	"Conversion a Binario: "
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
	movl	$5, -8(%rbp)
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	binario
	movl	$101, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	decimal
	movl	$0, %eax
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
