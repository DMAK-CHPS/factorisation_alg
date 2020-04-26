	.file	"fact_alg.c"
	.text
.Ltext0:
	.section	.rodata
	.align 8
.LC1:
	.string	"calcul de U -- i=%zu k=%zu j=%zu -> L[%zu][%zu](%f) * U[%zu][%zu](%f)\n"
	.align 8
.LC2:
	.string	"calcul de U -- A[%zu][%zu](%f)\n\n"
	.align 8
.LC4:
	.string	"calcul de L -- i=%zu k=%zu j=%zu -> L[%zu][%zu](%f) * U[%zu][%zu](%f)\n"
	.align 8
.LC5:
	.string	"calcul de L -- A[%zu][%zu](%f) - sum / U[%zu][%zu](%f)\n\n"
	.text
	.globl	factLU_Doolittle
	.type	factLU_Doolittle, @function
factLU_Doolittle:
.LFB5:
	.file 1 "fact_alg.c"
	.loc 1 6 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
.LBB2:
	.loc 1 7 0
	movq	$0, -40(%rbp)
	jmp	.L2
.L13:
.LBB3:
	.loc 1 8 0
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	jmp	.L3
.L6:
.LBB4:
	.loc 1 9 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -48(%rbp)
.LBB5:
	.loc 1 10 0
	movq	$0, -24(%rbp)
	jmp	.L4
.L5:
	.loc 1 11 0 discriminator 3
	movq	64(%rbp), %rdx
	movq	80(%rbp), %rax
	imulq	-24(%rbp), %rax
	movq	%rax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-40(%rbp), %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movq	-24(%rbp), %rdi
	movq	-40(%rbp), %rsi
	movq	-24(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	-40(%rbp), %rax
	pushq	-32(%rbp)
	pushq	-24(%rbp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$2, %eax
	call	printf@PLT
	addq	$16, %rsp
	.loc 1 12 0 discriminator 3
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-40(%rbp), %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movq	64(%rbp), %rdx
	movq	80(%rbp), %rax
	imulq	-24(%rbp), %rax
	movq	%rax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	mulss	%xmm1, %xmm0
	movss	-48(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -48(%rbp)
	.loc 1 10 0 discriminator 3
	addq	$1, -24(%rbp)
.L4:
	.loc 1 10 0 is_stmt 0 discriminator 1
	movq	-24(%rbp), %rax
	cmpq	-40(%rbp), %rax
	jb	.L5
.LBE5:
	.loc 1 14 0 is_stmt 1 discriminator 2
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-40(%rbp), %rax
	movq	%rax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movq	-32(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	.loc 1 15 0 discriminator 2
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-40(%rbp), %rax
	movq	%rax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movq	64(%rbp), %rdx
	movq	80(%rbp), %rax
	imulq	-40(%rbp), %rax
	movq	%rax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	subss	-48(%rbp), %xmm0
	movss	%xmm0, (%rax)
.LBE4:
	.loc 1 8 0 discriminator 2
	addq	$1, -32(%rbp)
.L3:
	.loc 1 8 0 is_stmt 0 discriminator 1
	movq	24(%rbp), %rax
	cmpq	%rax, -32(%rbp)
	jb	.L6
.LBE3:
.LBB6:
	.loc 1 17 0 is_stmt 1
	movq	-40(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L7
.L12:
	.loc 1 18 0
	movq	-40(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jne	.L8
	.loc 1 19 0
	movq	40(%rbp), %rax
	movq	56(%rbp), %rdx
	addq	$1, %rdx
	imulq	-40(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, (%rax)
	jmp	.L9
.L8:
.LBB7:
	.loc 1 21 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -44(%rbp)
.LBB8:
	.loc 1 22 0
	movq	$0, -8(%rbp)
	jmp	.L10
.L11:
	.loc 1 23 0 discriminator 3
	movq	64(%rbp), %rdx
	movq	80(%rbp), %rax
	imulq	-8(%rbp), %rax
	movq	%rax, %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-16(%rbp), %rax
	movq	%rax, %rcx
	movq	-8(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	-8(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movq	-40(%rbp), %rax
	pushq	-40(%rbp)
	pushq	-8(%rbp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$2, %eax
	call	printf@PLT
	addq	$16, %rsp
	.loc 1 24 0 discriminator 3
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-16(%rbp), %rax
	movq	%rax, %rcx
	movq	-8(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movq	64(%rbp), %rdx
	movq	80(%rbp), %rax
	imulq	-8(%rbp), %rax
	movq	%rax, %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	mulss	%xmm1, %xmm0
	movss	-44(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -44(%rbp)
	.loc 1 22 0 discriminator 3
	addq	$1, -8(%rbp)
.L10:
	.loc 1 22 0 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax
	cmpq	-40(%rbp), %rax
	jb	.L11
.LBE8:
	.loc 1 26 0 is_stmt 1
	movq	64(%rbp), %rax
	movq	80(%rbp), %rdx
	addq	$1, %rdx
	imulq	-40(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-16(%rbp), %rax
	movq	%rax, %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movq	-40(%rbp), %rsi
	movq	-40(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rsi, %r8
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rdi
	movl	$2, %eax
	call	printf@PLT
	.loc 1 27 0
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-16(%rbp), %rax
	movq	%rax, %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	subss	-44(%rbp), %xmm0
	movq	64(%rbp), %rax
	movq	80(%rbp), %rdx
	addq	$1, %rdx
	imulq	-40(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-16(%rbp), %rax
	movq	%rax, %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	divss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
.L9:
.LBE7:
	.loc 1 17 0 discriminator 2
	addq	$1, -16(%rbp)
.L7:
	.loc 1 17 0 is_stmt 0 discriminator 1
	movq	24(%rbp), %rax
	cmpq	%rax, -16(%rbp)
	jb	.L12
.LBE6:
	.loc 1 7 0 is_stmt 1 discriminator 2
	addq	$1, -40(%rbp)
.L2:
	.loc 1 7 0 is_stmt 0 discriminator 1
	movq	24(%rbp), %rax
	cmpq	%rax, -40(%rbp)
	jb	.L13
.LBE2:
	.loc 1 31 0 is_stmt 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	factLU_Doolittle, .-factLU_Doolittle
	.globl	factLU_Crout
	.type	factLU_Crout, @function
factLU_Crout:
.LFB6:
	.loc 1 34 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
.LBB9:
	.loc 1 35 0
	movq	$0, -48(%rbp)
	jmp	.L15
.L16:
	.loc 1 36 0 discriminator 3
	movq	64(%rbp), %rax
	movq	80(%rbp), %rdx
	addq	$1, %rdx
	imulq	-48(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 35 0 discriminator 3
	addq	$1, -48(%rbp)
.L15:
	.loc 1 35 0 is_stmt 0 discriminator 1
	movq	24(%rbp), %rax
	cmpq	%rax, -48(%rbp)
	jb	.L16
.LBE9:
.LBB10:
	.loc 1 38 0 is_stmt 1
	movq	$0, -40(%rbp)
	jmp	.L17
.L26:
.LBB11:
	.loc 1 39 0
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	jmp	.L18
.L21:
.LBB12:
	.loc 1 40 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -56(%rbp)
.LBB13:
	.loc 1 41 0
	movq	$0, -24(%rbp)
	jmp	.L19
.L20:
	.loc 1 42 0 discriminator 3
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-32(%rbp), %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movq	64(%rbp), %rdx
	movq	80(%rbp), %rax
	imulq	-24(%rbp), %rax
	movq	%rax, %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	mulss	%xmm1, %xmm0
	movss	-56(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -56(%rbp)
	.loc 1 41 0 discriminator 3
	addq	$1, -24(%rbp)
.L19:
	.loc 1 41 0 is_stmt 0 discriminator 1
	movq	-24(%rbp), %rax
	cmpq	-40(%rbp), %rax
	jb	.L20
.LBE13:
	.loc 1 44 0 is_stmt 1 discriminator 2
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-32(%rbp), %rax
	movq	%rax, %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-32(%rbp), %rax
	movq	%rax, %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	subss	-56(%rbp), %xmm0
	movss	%xmm0, (%rax)
.LBE12:
	.loc 1 39 0 discriminator 2
	addq	$1, -32(%rbp)
.L18:
	.loc 1 39 0 is_stmt 0 discriminator 1
	movq	24(%rbp), %rax
	cmpq	%rax, -32(%rbp)
	jb	.L21
.LBE11:
.LBB14:
	.loc 1 46 0 is_stmt 1
	movq	-40(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L22
.L25:
.LBB15:
	.loc 1 47 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -52(%rbp)
.LBB16:
	.loc 1 48 0
	movq	$0, -8(%rbp)
	jmp	.L23
.L24:
	.loc 1 49 0 discriminator 3
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-40(%rbp), %rax
	movq	%rax, %rcx
	movq	-8(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movq	64(%rbp), %rdx
	movq	80(%rbp), %rax
	imulq	-8(%rbp), %rax
	movq	%rax, %rcx
	movq	-16(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	mulss	%xmm1, %xmm0
	movss	-52(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -52(%rbp)
	.loc 1 48 0 discriminator 3
	addq	$1, -8(%rbp)
.L23:
	.loc 1 48 0 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax
	cmpq	-40(%rbp), %rax
	jb	.L24
.LBE16:
	.loc 1 51 0 is_stmt 1 discriminator 2
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-40(%rbp), %rax
	movq	%rax, %rcx
	movq	-16(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	subss	-52(%rbp), %xmm0
	movq	40(%rbp), %rax
	movq	56(%rbp), %rdx
	addq	$1, %rdx
	imulq	-40(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movq	64(%rbp), %rdx
	movq	80(%rbp), %rax
	imulq	-40(%rbp), %rax
	movq	%rax, %rcx
	movq	-16(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	divss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
.LBE15:
	.loc 1 46 0 discriminator 2
	addq	$1, -16(%rbp)
.L22:
	.loc 1 46 0 is_stmt 0 discriminator 1
	movq	24(%rbp), %rax
	cmpq	%rax, -16(%rbp)
	jb	.L25
.LBE14:
	.loc 1 38 0 is_stmt 1 discriminator 2
	addq	$1, -40(%rbp)
.L17:
	.loc 1 38 0 is_stmt 0 discriminator 1
	movq	24(%rbp), %rax
	cmpq	%rax, -40(%rbp)
	jb	.L26
.LBE10:
	.loc 1 54 0 is_stmt 1
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	factLU_Crout, .-factLU_Crout
	.globl	factQR_Schmidt
	.type	factQR_Schmidt, @function
factQR_Schmidt:
.LFB7:
	.loc 1 57 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
.LBB17:
	.loc 1 58 0
	movq	$0, -48(%rbp)
	jmp	.L28
.L39:
.LBB18:
	.loc 1 59 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -56(%rbp)
.LBB19:
	.loc 1 60 0
	movq	$0, -40(%rbp)
	jmp	.L29
.L30:
	.loc 1 61 0 discriminator 3
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-40(%rbp), %rax
	movq	%rax, %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-40(%rbp), %rax
	movq	%rax, %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	mulss	%xmm1, %xmm0
	movss	-56(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -56(%rbp)
	.loc 1 60 0 discriminator 3
	addq	$1, -40(%rbp)
.L29:
	.loc 1 60 0 is_stmt 0 discriminator 1
	movq	32(%rbp), %rax
	cmpq	%rax, -40(%rbp)
	jb	.L30
.LBE19:
	.loc 1 63 0 is_stmt 1
	cvtss2sd	-56(%rbp), %xmm0
	call	sqrt@PLT
	movq	64(%rbp), %rax
	movq	80(%rbp), %rdx
	addq	$1, %rdx
	imulq	-48(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, (%rax)
.LBB20:
	.loc 1 64 0
	movq	$0, -32(%rbp)
	jmp	.L31
.L32:
	.loc 1 65 0 discriminator 3
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-32(%rbp), %rax
	movq	%rax, %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movq	64(%rbp), %rax
	movq	80(%rbp), %rdx
	addq	$1, %rdx
	imulq	-48(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-32(%rbp), %rax
	movq	%rax, %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	divss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
	.loc 1 64 0 discriminator 3
	addq	$1, -32(%rbp)
.L31:
	.loc 1 64 0 is_stmt 0 discriminator 1
	movq	32(%rbp), %rax
	cmpq	%rax, -32(%rbp)
	jb	.L32
.LBE20:
.LBB21:
	.loc 1 67 0 is_stmt 1
	movq	-48(%rbp), %rax
	movq	%rax, -24(%rbp)
	jmp	.L33
.L38:
.LBB22:
	.loc 1 68 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -52(%rbp)
.LBB23:
	.loc 1 69 0
	movq	$0, -16(%rbp)
	jmp	.L34
.L35:
	.loc 1 70 0 discriminator 3
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-16(%rbp), %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-16(%rbp), %rax
	movq	%rax, %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	mulss	%xmm1, %xmm0
	movss	-52(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -52(%rbp)
	.loc 1 69 0 discriminator 3
	addq	$1, -16(%rbp)
.L34:
	.loc 1 69 0 is_stmt 0 discriminator 1
	movq	32(%rbp), %rax
	cmpq	%rax, -16(%rbp)
	jb	.L35
.LBE23:
	.loc 1 72 0 is_stmt 1
	movq	64(%rbp), %rdx
	movq	80(%rbp), %rax
	imulq	-48(%rbp), %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	-52(%rbp), %xmm0
	movss	%xmm0, (%rax)
.LBB24:
	.loc 1 73 0
	movq	$0, -8(%rbp)
	jmp	.L36
.L37:
	.loc 1 74 0 discriminator 3
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-8(%rbp), %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movq	64(%rbp), %rdx
	movq	80(%rbp), %rax
	imulq	-48(%rbp), %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm2
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-8(%rbp), %rax
	movq	%rax, %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	mulss	%xmm2, %xmm0
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-8(%rbp), %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm0, (%rax)
	.loc 1 73 0 discriminator 3
	addq	$1, -8(%rbp)
.L36:
	.loc 1 73 0 is_stmt 0 discriminator 1
	movq	32(%rbp), %rax
	cmpq	%rax, -8(%rbp)
	jb	.L37
.LBE24:
.LBE22:
	.loc 1 67 0 is_stmt 1 discriminator 2
	addq	$1, -24(%rbp)
.L33:
	.loc 1 67 0 is_stmt 0 discriminator 1
	movq	24(%rbp), %rax
	cmpq	%rax, -24(%rbp)
	jb	.L38
.LBE21:
.LBE18:
	.loc 1 58 0 is_stmt 1 discriminator 2
	addq	$1, -48(%rbp)
.L28:
	.loc 1 58 0 is_stmt 0 discriminator 1
	movq	24(%rbp), %rax
	cmpq	%rax, -48(%rbp)
	jb	.L39
.LBE17:
	.loc 1 78 0 is_stmt 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	factQR_Schmidt, .-factQR_Schmidt
	.globl	factQR_Householder
	.type	factQR_Householder, @function
factQR_Householder:
.LFB8:
	.loc 1 81 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
.LBB25:
	.loc 1 82 0
	movq	$0, -48(%rbp)
	jmp	.L41
.L55:
.LBB26:
	.loc 1 83 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -56(%rbp)
.LBB27:
	.loc 1 84 0
	movq	-48(%rbp), %rax
	movq	%rax, -40(%rbp)
	jmp	.L42
.L43:
	.loc 1 85 0 discriminator 3
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-40(%rbp), %rax
	movq	%rax, %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-40(%rbp), %rax
	movq	%rax, %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	mulss	%xmm1, %xmm0
	movss	-56(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -56(%rbp)
	.loc 1 84 0 discriminator 3
	addq	$1, -40(%rbp)
.L42:
	.loc 1 84 0 is_stmt 0 discriminator 1
	movq	32(%rbp), %rax
	cmpq	%rax, -40(%rbp)
	jb	.L43
.LBE27:
	.loc 1 87 0 is_stmt 1
	cvtss2sd	-56(%rbp), %xmm0
	call	sqrt@PLT
	cvtsd2ss	%xmm0, %xmm2
	movss	%xmm2, -56(%rbp)
	.loc 1 88 0
	movq	16(%rbp), %rax
	movq	32(%rbp), %rdx
	addq	$1, %rdx
	imulq	-48(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	pxor	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	jbe	.L57
	.loc 1 88 0 is_stmt 0 discriminator 1
	movss	-56(%rbp), %xmm1
	movss	.LC6(%rip), %xmm0
	xorps	%xmm1, %xmm0
	jmp	.L46
.L57:
	.loc 1 88 0 discriminator 2
	movss	-56(%rbp), %xmm0
.L46:
	.loc 1 88 0 discriminator 4
	movq	64(%rbp), %rax
	movq	80(%rbp), %rdx
	addq	$1, %rdx
	imulq	-48(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	%xmm0, (%rax)
	.loc 1 89 0 is_stmt 1 discriminator 4
	movq	16(%rbp), %rax
	movq	32(%rbp), %rdx
	addq	$1, %rdx
	imulq	-48(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvttss2si	%xmm0, %eax
	cltd
	xorl	%edx, %eax
	subl	%edx, %eax
	cvtsi2ss	%eax, %xmm0
	addss	-56(%rbp), %xmm0
	mulss	-56(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	call	sqrt@PLT
	cvtsd2ss	%xmm0, %xmm3
	movss	%xmm3, -52(%rbp)
	.loc 1 90 0 discriminator 4
	movq	16(%rbp), %rax
	movq	32(%rbp), %rdx
	addq	$1, %rdx
	imulq	-48(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movq	64(%rbp), %rax
	movq	80(%rbp), %rdx
	addq	$1, %rdx
	imulq	-48(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movq	16(%rbp), %rax
	movq	32(%rbp), %rdx
	addq	$1, %rdx
	imulq	-48(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	subss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
.LBB28:
	.loc 1 91 0 discriminator 4
	movq	-48(%rbp), %rax
	movq	%rax, -32(%rbp)
	jmp	.L47
.L48:
	.loc 1 92 0 discriminator 3
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-32(%rbp), %rax
	movq	%rax, %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-32(%rbp), %rax
	movq	%rax, %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	divss	-52(%rbp), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 91 0 discriminator 3
	addq	$1, -32(%rbp)
.L47:
	.loc 1 91 0 is_stmt 0 discriminator 1
	movq	32(%rbp), %rax
	cmpq	%rax, -32(%rbp)
	jb	.L48
.LBE28:
.LBB29:
	.loc 1 94 0 is_stmt 1
	movq	-48(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -24(%rbp)
	jmp	.L49
.L54:
	.loc 1 95 0
	pxor	%xmm0, %xmm0
	movss	%xmm0, -56(%rbp)
.LBB30:
	.loc 1 96 0
	movq	-48(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L50
.L51:
	.loc 1 97 0 discriminator 3
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-16(%rbp), %rax
	movq	%rax, %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-16(%rbp), %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	mulss	%xmm1, %xmm0
	movss	-56(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -56(%rbp)
	.loc 1 96 0 discriminator 3
	addq	$1, -16(%rbp)
.L50:
	.loc 1 96 0 is_stmt 0 discriminator 1
	movq	32(%rbp), %rax
	cmpq	%rax, -16(%rbp)
	jb	.L51
.LBE30:
.LBB31:
	.loc 1 99 0 is_stmt 1
	movq	-48(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L52
.L53:
	.loc 1 100 0 discriminator 3
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-8(%rbp), %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-8(%rbp), %rax
	movq	%rax, %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	mulss	-56(%rbp), %xmm0
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-8(%rbp), %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm0, (%rax)
	.loc 1 99 0 discriminator 3
	addq	$1, -8(%rbp)
.L52:
	.loc 1 99 0 is_stmt 0 discriminator 1
	movq	32(%rbp), %rax
	cmpq	%rax, -8(%rbp)
	jb	.L53
.LBE31:
	.loc 1 102 0 is_stmt 1 discriminator 2
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-48(%rbp), %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rax, %rdx
	movq	64(%rbp), %rcx
	movq	80(%rbp), %rax
	imulq	-48(%rbp), %rax
	movq	%rax, %rsi
	movq	-24(%rbp), %rax
	addq	%rsi, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	movss	(%rdx), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 94 0 discriminator 2
	addq	$1, -24(%rbp)
.L49:
	.loc 1 94 0 is_stmt 0 discriminator 1
	movq	24(%rbp), %rax
	cmpq	%rax, -24(%rbp)
	jb	.L54
.LBE29:
.LBE26:
	.loc 1 82 0 is_stmt 1 discriminator 2
	addq	$1, -48(%rbp)
.L41:
	.loc 1 82 0 is_stmt 0 discriminator 1
	movq	24(%rbp), %rax
	cmpq	%rax, -48(%rbp)
	jb	.L55
.LBE25:
	.loc 1 105 0 is_stmt 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	factQR_Householder, .-factQR_Householder
	.globl	factCHolesky
	.type	factCHolesky, @function
factCHolesky:
.LFB9:
	.loc 1 108 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
.LBB32:
	.loc 1 109 0
	movq	$0, -32(%rbp)
	jmp	.L59
.L66:
.LBB33:
	.loc 1 110 0
	movq	16(%rbp), %rax
	movq	32(%rbp), %rdx
	addq	$1, %rdx
	imulq	-32(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movss	%xmm0, -40(%rbp)
.LBB34:
	.loc 1 111 0
	movq	$0, -24(%rbp)
	jmp	.L60
.L61:
	.loc 1 112 0 discriminator 3
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-32(%rbp), %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-32(%rbp), %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	mulss	%xmm1, %xmm0
	movss	-40(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm0, -40(%rbp)
	.loc 1 111 0 discriminator 3
	addq	$1, -24(%rbp)
.L60:
	.loc 1 111 0 is_stmt 0 discriminator 1
	movq	-24(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jb	.L61
.LBE34:
	.loc 1 114 0 is_stmt 1
	cvtss2sd	-40(%rbp), %xmm0
	call	sqrt@PLT
	cvtsd2ss	%xmm0, %xmm2
	movss	%xmm2, -40(%rbp)
	.loc 1 115 0
	movq	40(%rbp), %rax
	movq	56(%rbp), %rdx
	addq	$1, %rdx
	imulq	-32(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	-40(%rbp), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 116 0
	movss	.LC3(%rip), %xmm0
	divss	-40(%rbp), %xmm0
	movss	%xmm0, -36(%rbp)
.LBB35:
	.loc 1 117 0
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -16(%rbp)
	jmp	.L62
.L65:
	.loc 1 118 0
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-16(%rbp), %rax
	movq	%rax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movss	%xmm0, -40(%rbp)
.LBB36:
	.loc 1 119 0
	movq	$0, -8(%rbp)
	jmp	.L63
.L64:
	.loc 1 120 0 discriminator 3
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-16(%rbp), %rax
	movq	%rax, %rcx
	movq	-8(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-32(%rbp), %rax
	movq	%rax, %rcx
	movq	-8(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	mulss	%xmm1, %xmm0
	movss	-40(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm0, -40(%rbp)
	.loc 1 119 0 discriminator 3
	addq	$1, -8(%rbp)
.L63:
	.loc 1 119 0 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jb	.L64
.LBE36:
	.loc 1 122 0 is_stmt 1 discriminator 2
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-16(%rbp), %rax
	movq	%rax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	-40(%rbp), %xmm0
	mulss	-36(%rbp), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 117 0 discriminator 2
	addq	$1, -16(%rbp)
.L62:
	.loc 1 117 0 is_stmt 0 discriminator 1
	movq	24(%rbp), %rax
	cmpq	%rax, -16(%rbp)
	jb	.L65
.LBE35:
.LBE33:
	.loc 1 109 0 is_stmt 1 discriminator 2
	addq	$1, -32(%rbp)
.L59:
	.loc 1 109 0 is_stmt 0 discriminator 1
	movq	24(%rbp), %rax
	cmpq	%rax, -32(%rbp)
	jb	.L66
.LBE32:
	.loc 1 125 0 is_stmt 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	factCHolesky, .-factCHolesky
	.globl	factLDL
	.type	factLDL, @function
factLDL:
.LFB10:
	.loc 1 128 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
.LBB37:
	.loc 1 129 0
	movq	$0, -32(%rbp)
	jmp	.L68
.L75:
	.loc 1 130 0
	movq	16(%rbp), %rax
	movq	32(%rbp), %rdx
	addq	$1, %rdx
	imulq	-32(%rbp), %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	movq	64(%rbp), %rax
	movq	80(%rbp), %rcx
	addq	$1, %rcx
	imulq	-32(%rbp), %rcx
	salq	$2, %rcx
	addq	%rcx, %rax
	movss	(%rdx), %xmm0
	movss	%xmm0, (%rax)
	.loc 1 131 0
	movq	40(%rbp), %rax
	movq	56(%rbp), %rdx
	addq	$1, %rdx
	imulq	-32(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, (%rax)
.LBB38:
	.loc 1 132 0
	movq	$0, -24(%rbp)
	jmp	.L69
.L70:
	.loc 1 133 0 discriminator 3
	movq	64(%rbp), %rax
	movq	80(%rbp), %rdx
	addq	$1, %rdx
	imulq	-32(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-32(%rbp), %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm2
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-32(%rbp), %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	mulss	%xmm2, %xmm0
	movq	64(%rbp), %rax
	movq	80(%rbp), %rdx
	addq	$1, %rdx
	imulq	-24(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm2
	mulss	%xmm2, %xmm0
	movq	64(%rbp), %rax
	movq	80(%rbp), %rdx
	addq	$1, %rdx
	imulq	-32(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm0, (%rax)
	.loc 1 132 0 discriminator 3
	addq	$1, -24(%rbp)
.L69:
	.loc 1 132 0 is_stmt 0 discriminator 1
	movq	-24(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jb	.L70
.LBE38:
.LBB39:
	.loc 1 135 0 is_stmt 1
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -16(%rbp)
	jmp	.L71
.L74:
	.loc 1 136 0
	movq	16(%rbp), %rdx
	movq	32(%rbp), %rax
	imulq	-16(%rbp), %rax
	movq	%rax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rax, %rdx
	movq	40(%rbp), %rcx
	movq	56(%rbp), %rax
	imulq	-16(%rbp), %rax
	movq	%rax, %rsi
	movq	-32(%rbp), %rax
	addq	%rsi, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	movss	(%rdx), %xmm0
	movss	%xmm0, (%rax)
.LBB40:
	.loc 1 137 0
	movq	$0, -8(%rbp)
	jmp	.L72
.L73:
	.loc 1 138 0 discriminator 3
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-16(%rbp), %rax
	movq	%rax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-16(%rbp), %rax
	movq	%rax, %rcx
	movq	-8(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm2
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-32(%rbp), %rax
	movq	%rax, %rcx
	movq	-8(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	mulss	%xmm2, %xmm0
	movq	64(%rbp), %rax
	movq	80(%rbp), %rdx
	addq	$1, %rdx
	imulq	-8(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm2
	mulss	%xmm2, %xmm0
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-16(%rbp), %rax
	movq	%rax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm0, (%rax)
	.loc 1 137 0 discriminator 3
	addq	$1, -8(%rbp)
.L72:
	.loc 1 137 0 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jb	.L73
.LBE40:
	.loc 1 140 0 is_stmt 1 discriminator 2
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-16(%rbp), %rax
	movq	%rax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movq	64(%rbp), %rax
	movq	80(%rbp), %rdx
	addq	$1, %rdx
	imulq	-32(%rbp), %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movq	40(%rbp), %rdx
	movq	56(%rbp), %rax
	imulq	-16(%rbp), %rax
	movq	%rax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	divss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
	.loc 1 135 0 discriminator 2
	addq	$1, -16(%rbp)
.L71:
	.loc 1 135 0 is_stmt 0 discriminator 1
	movq	24(%rbp), %rax
	cmpq	%rax, -16(%rbp)
	jb	.L74
.LBE39:
	.loc 1 129 0 is_stmt 1 discriminator 2
	addq	$1, -32(%rbp)
.L68:
	.loc 1 129 0 is_stmt 0 discriminator 1
	movq	24(%rbp), %rax
	cmpq	%rax, -32(%rbp)
	jb	.L75
.LBE37:
	.loc 1 143 0 is_stmt 1
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	factLDL, .-factLDL
	.section	.rodata
	.align 4
.LC3:
	.long	1065353216
	.align 16
.LC6:
	.long	2147483648
	.long	0
	.long	0
	.long	0
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/libio.h"
	.file 5 "/usr/include/stdio.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.file 7 "/usr/include/math.h"
	.file 8 "../common/matrix.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x9ca
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF66
	.byte	0xc
	.long	.LASF67
	.long	.LASF68
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x2
	.byte	0xd8
	.long	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x3
	.byte	0x8c
	.long	0x69
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x8d
	.long	0x69
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x8e
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0x7
	.long	0x8e
	.uleb128 0x8
	.long	.LASF40
	.byte	0xd8
	.byte	0x4
	.byte	0xf5
	.long	0x21a
	.uleb128 0x9
	.long	.LASF11
	.byte	0x4
	.byte	0xf6
	.long	0x62
	.byte	0
	.uleb128 0x9
	.long	.LASF12
	.byte	0x4
	.byte	0xfb
	.long	0x88
	.byte	0x8
	.uleb128 0x9
	.long	.LASF13
	.byte	0x4
	.byte	0xfc
	.long	0x88
	.byte	0x10
	.uleb128 0x9
	.long	.LASF14
	.byte	0x4
	.byte	0xfd
	.long	0x88
	.byte	0x18
	.uleb128 0x9
	.long	.LASF15
	.byte	0x4
	.byte	0xfe
	.long	0x88
	.byte	0x20
	.uleb128 0x9
	.long	.LASF16
	.byte	0x4
	.byte	0xff
	.long	0x88
	.byte	0x28
	.uleb128 0xa
	.long	.LASF17
	.byte	0x4
	.value	0x100
	.long	0x88
	.byte	0x30
	.uleb128 0xa
	.long	.LASF18
	.byte	0x4
	.value	0x101
	.long	0x88
	.byte	0x38
	.uleb128 0xa
	.long	.LASF19
	.byte	0x4
	.value	0x102
	.long	0x88
	.byte	0x40
	.uleb128 0xa
	.long	.LASF20
	.byte	0x4
	.value	0x104
	.long	0x88
	.byte	0x48
	.uleb128 0xa
	.long	.LASF21
	.byte	0x4
	.value	0x105
	.long	0x88
	.byte	0x50
	.uleb128 0xa
	.long	.LASF22
	.byte	0x4
	.value	0x106
	.long	0x88
	.byte	0x58
	.uleb128 0xa
	.long	.LASF23
	.byte	0x4
	.value	0x108
	.long	0x252
	.byte	0x60
	.uleb128 0xa
	.long	.LASF24
	.byte	0x4
	.value	0x10a
	.long	0x258
	.byte	0x68
	.uleb128 0xa
	.long	.LASF25
	.byte	0x4
	.value	0x10c
	.long	0x62
	.byte	0x70
	.uleb128 0xa
	.long	.LASF26
	.byte	0x4
	.value	0x110
	.long	0x62
	.byte	0x74
	.uleb128 0xa
	.long	.LASF27
	.byte	0x4
	.value	0x112
	.long	0x70
	.byte	0x78
	.uleb128 0xa
	.long	.LASF28
	.byte	0x4
	.value	0x116
	.long	0x46
	.byte	0x80
	.uleb128 0xa
	.long	.LASF29
	.byte	0x4
	.value	0x117
	.long	0x54
	.byte	0x82
	.uleb128 0xa
	.long	.LASF30
	.byte	0x4
	.value	0x118
	.long	0x25e
	.byte	0x83
	.uleb128 0xa
	.long	.LASF31
	.byte	0x4
	.value	0x11c
	.long	0x26e
	.byte	0x88
	.uleb128 0xa
	.long	.LASF32
	.byte	0x4
	.value	0x125
	.long	0x7b
	.byte	0x90
	.uleb128 0xa
	.long	.LASF33
	.byte	0x4
	.value	0x12d
	.long	0x86
	.byte	0x98
	.uleb128 0xa
	.long	.LASF34
	.byte	0x4
	.value	0x12e
	.long	0x86
	.byte	0xa0
	.uleb128 0xa
	.long	.LASF35
	.byte	0x4
	.value	0x12f
	.long	0x86
	.byte	0xa8
	.uleb128 0xa
	.long	.LASF36
	.byte	0x4
	.value	0x130
	.long	0x86
	.byte	0xb0
	.uleb128 0xa
	.long	.LASF37
	.byte	0x4
	.value	0x132
	.long	0x2d
	.byte	0xb8
	.uleb128 0xa
	.long	.LASF38
	.byte	0x4
	.value	0x133
	.long	0x62
	.byte	0xc0
	.uleb128 0xa
	.long	.LASF39
	.byte	0x4
	.value	0x135
	.long	0x274
	.byte	0xc4
	.byte	0
	.uleb128 0xb
	.long	.LASF69
	.byte	0x4
	.byte	0x9a
	.uleb128 0x8
	.long	.LASF41
	.byte	0x18
	.byte	0x4
	.byte	0xa0
	.long	0x252
	.uleb128 0x9
	.long	.LASF42
	.byte	0x4
	.byte	0xa1
	.long	0x252
	.byte	0
	.uleb128 0x9
	.long	.LASF43
	.byte	0x4
	.byte	0xa2
	.long	0x258
	.byte	0x8
	.uleb128 0x9
	.long	.LASF44
	.byte	0x4
	.byte	0xa6
	.long	0x62
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x221
	.uleb128 0x6
	.byte	0x8
	.long	0x9a
	.uleb128 0xc
	.long	0x8e
	.long	0x26e
	.uleb128 0xd
	.long	0x38
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x21a
	.uleb128 0xc
	.long	0x8e
	.long	0x284
	.uleb128 0xd
	.long	0x38
	.byte	0x13
	.byte	0
	.uleb128 0xe
	.long	.LASF70
	.uleb128 0xf
	.long	.LASF45
	.byte	0x4
	.value	0x13f
	.long	0x284
	.uleb128 0xf
	.long	.LASF46
	.byte	0x4
	.value	0x140
	.long	0x284
	.uleb128 0xf
	.long	.LASF47
	.byte	0x4
	.value	0x141
	.long	0x284
	.uleb128 0x6
	.byte	0x8
	.long	0x95
	.uleb128 0x7
	.long	0x2ad
	.uleb128 0x10
	.long	.LASF48
	.byte	0x5
	.byte	0x87
	.long	0x258
	.uleb128 0x10
	.long	.LASF49
	.byte	0x5
	.byte	0x88
	.long	0x258
	.uleb128 0x10
	.long	.LASF50
	.byte	0x5
	.byte	0x89
	.long	0x258
	.uleb128 0x10
	.long	.LASF51
	.byte	0x6
	.byte	0x1a
	.long	0x62
	.uleb128 0xc
	.long	0x2b3
	.long	0x2ef
	.uleb128 0x11
	.byte	0
	.uleb128 0x7
	.long	0x2e4
	.uleb128 0x10
	.long	.LASF52
	.byte	0x6
	.byte	0x1b
	.long	0x2ef
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF53
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF54
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF55
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF56
	.uleb128 0xf
	.long	.LASF57
	.byte	0x7
	.value	0x1e9
	.long	0x62
	.uleb128 0x8
	.long	.LASF58
	.byte	0x18
	.byte	0x8
	.byte	0x28
	.long	0x354
	.uleb128 0x9
	.long	.LASF59
	.byte	0x8
	.byte	0x29
	.long	0x354
	.byte	0
	.uleb128 0x12
	.string	"n"
	.byte	0x8
	.byte	0x2a
	.long	0x2d
	.byte	0x8
	.uleb128 0x12
	.string	"m"
	.byte	0x8
	.byte	0x2b
	.long	0x2d
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x30d
	.uleb128 0x2
	.long	.LASF60
	.byte	0x8
	.byte	0x2c
	.long	0x327
	.uleb128 0x13
	.long	.LASF61
	.byte	0x1
	.byte	0x7f
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x423
	.uleb128 0x14
	.string	"A"
	.byte	0x1
	.byte	0x7f
	.long	0x35a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.string	"L"
	.byte	0x1
	.byte	0x7f
	.long	0x35a
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x14
	.string	"D"
	.byte	0x1
	.byte	0x7f
	.long	0x35a
	.uleb128 0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x15
	.quad	.LBB37
	.quad	.LBE37-.LBB37
	.uleb128 0x16
	.string	"j"
	.byte	0x1
	.byte	0x81
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x17
	.quad	.LBB38
	.quad	.LBE38-.LBB38
	.long	0x3e5
	.uleb128 0x16
	.string	"k"
	.byte	0x1
	.byte	0x84
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x15
	.quad	.LBB39
	.quad	.LBE39-.LBB39
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.byte	0x87
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x15
	.quad	.LBB40
	.quad	.LBE40-.LBB40
	.uleb128 0x16
	.string	"k"
	.byte	0x1
	.byte	0x89
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x18
	.long	.LASF62
	.byte	0x1
	.byte	0x6b
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x4ff
	.uleb128 0x14
	.string	"A"
	.byte	0x1
	.byte	0x6b
	.long	0x35a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.string	"L"
	.byte	0x1
	.byte	0x6b
	.long	0x35a
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x15
	.quad	.LBB32
	.quad	.LBE32-.LBB32
	.uleb128 0x16
	.string	"j"
	.byte	0x1
	.byte	0x6d
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x15
	.quad	.LBB33
	.quad	.LBE33-.LBB33
	.uleb128 0x16
	.string	"v"
	.byte	0x1
	.byte	0x6e
	.long	0x30d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x16
	.string	"x"
	.byte	0x1
	.byte	0x74
	.long	0x30d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x17
	.quad	.LBB34
	.quad	.LBE34-.LBB34
	.long	0x4c0
	.uleb128 0x16
	.string	"k"
	.byte	0x1
	.byte	0x6f
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x15
	.quad	.LBB35
	.quad	.LBE35-.LBB35
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.byte	0x75
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x15
	.quad	.LBB36
	.quad	.LBE36-.LBB36
	.uleb128 0x16
	.string	"k"
	.byte	0x1
	.byte	0x77
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x18
	.long	.LASF63
	.byte	0x1
	.byte	0x50
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x631
	.uleb128 0x14
	.string	"A"
	.byte	0x1
	.byte	0x50
	.long	0x35a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.string	"Q"
	.byte	0x1
	.byte	0x50
	.long	0x35a
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x14
	.string	"R"
	.byte	0x1
	.byte	0x50
	.long	0x35a
	.uleb128 0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x15
	.quad	.LBB25
	.quad	.LBE25-.LBB25
	.uleb128 0x16
	.string	"j"
	.byte	0x1
	.byte	0x52
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x15
	.quad	.LBB26
	.quad	.LBE26-.LBB26
	.uleb128 0x16
	.string	"sum"
	.byte	0x1
	.byte	0x53
	.long	0x30d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x16
	.string	"fak"
	.byte	0x1
	.byte	0x59
	.long	0x30d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x17
	.quad	.LBB27
	.quad	.LBE27-.LBB27
	.long	0x5ae
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.byte	0x54
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x17
	.quad	.LBB28
	.quad	.LBE28-.LBB28
	.long	0x5d0
	.uleb128 0x16
	.string	"k"
	.byte	0x1
	.byte	0x5b
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x15
	.quad	.LBB29
	.quad	.LBE29-.LBB29
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.byte	0x5e
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.quad	.LBB30
	.quad	.LBE30-.LBB30
	.long	0x60f
	.uleb128 0x16
	.string	"k"
	.byte	0x1
	.byte	0x60
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x15
	.quad	.LBB31
	.quad	.LBE31-.LBB31
	.uleb128 0x16
	.string	"k"
	.byte	0x1
	.byte	0x63
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x18
	.long	.LASF64
	.byte	0x1
	.byte	0x38
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x775
	.uleb128 0x14
	.string	"A"
	.byte	0x1
	.byte	0x38
	.long	0x35a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.string	"Q"
	.byte	0x1
	.byte	0x38
	.long	0x35a
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x14
	.string	"R"
	.byte	0x1
	.byte	0x38
	.long	0x35a
	.uleb128 0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x15
	.quad	.LBB17
	.quad	.LBE17-.LBB17
	.uleb128 0x16
	.string	"k"
	.byte	0x1
	.byte	0x3a
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x15
	.quad	.LBB18
	.quad	.LBE18-.LBB18
	.uleb128 0x16
	.string	"sum"
	.byte	0x1
	.byte	0x3b
	.long	0x30d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x17
	.quad	.LBB19
	.quad	.LBE19-.LBB19
	.long	0x6d1
	.uleb128 0x16
	.string	"j"
	.byte	0x1
	.byte	0x3c
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x17
	.quad	.LBB20
	.quad	.LBE20-.LBB20
	.long	0x6f3
	.uleb128 0x16
	.string	"j"
	.byte	0x1
	.byte	0x40
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x15
	.quad	.LBB21
	.quad	.LBE21-.LBB21
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.byte	0x43
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x15
	.quad	.LBB22
	.quad	.LBE22-.LBB22
	.uleb128 0x16
	.string	"sum"
	.byte	0x1
	.byte	0x44
	.long	0x30d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x17
	.quad	.LBB23
	.quad	.LBE23-.LBB23
	.long	0x752
	.uleb128 0x16
	.string	"j"
	.byte	0x1
	.byte	0x45
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x15
	.quad	.LBB24
	.quad	.LBE24-.LBB24
	.uleb128 0x16
	.string	"j"
	.byte	0x1
	.byte	0x49
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	.LASF65
	.byte	0x1
	.byte	0x21
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x8b5
	.uleb128 0x14
	.string	"A"
	.byte	0x1
	.byte	0x21
	.long	0x35a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.string	"L"
	.byte	0x1
	.byte	0x21
	.long	0x35a
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x14
	.string	"U"
	.byte	0x1
	.byte	0x21
	.long	0x35a
	.uleb128 0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x17
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.long	0x7d8
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.byte	0x23
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.uleb128 0x15
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.uleb128 0x16
	.string	"j"
	.byte	0x1
	.byte	0x26
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x17
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.long	0x856
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.byte	0x27
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x15
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.uleb128 0x16
	.string	"sum"
	.byte	0x1
	.byte	0x28
	.long	0x30d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x15
	.quad	.LBB13
	.quad	.LBE13-.LBB13
	.uleb128 0x16
	.string	"k"
	.byte	0x1
	.byte	0x29
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.byte	0x2e
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x15
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.uleb128 0x16
	.string	"sum"
	.byte	0x1
	.byte	0x2f
	.long	0x30d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x15
	.quad	.LBB16
	.quad	.LBE16-.LBB16
	.uleb128 0x16
	.string	"k"
	.byte	0x1
	.byte	0x30
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x19
	.long	.LASF71
	.byte	0x1
	.byte	0x5
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.string	"A"
	.byte	0x1
	.byte	0x5
	.long	0x35a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.string	"L"
	.byte	0x1
	.byte	0x5
	.long	0x35a
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x14
	.string	"U"
	.byte	0x1
	.byte	0x5
	.long	0x35a
	.uleb128 0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x15
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.byte	0x7
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x17
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.long	0x96f
	.uleb128 0x16
	.string	"k"
	.byte	0x1
	.byte	0x8
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x15
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x16
	.string	"sum"
	.byte	0x1
	.byte	0x9
	.long	0x30d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x15
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x16
	.string	"j"
	.byte	0x1
	.byte	0xa
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x16
	.string	"k"
	.byte	0x1
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x15
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x16
	.string	"sum"
	.byte	0x1
	.byte	0x15
	.long	0x30d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x15
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.uleb128 0x16
	.string	"j"
	.byte	0x1
	.byte	0x16
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF8:
	.string	"__off_t"
.LASF12:
	.string	"_IO_read_ptr"
.LASF24:
	.string	"_chain"
.LASF63:
	.string	"factQR_Householder"
.LASF7:
	.string	"size_t"
.LASF30:
	.string	"_shortbuf"
.LASF47:
	.string	"_IO_2_1_stderr_"
.LASF18:
	.string	"_IO_buf_base"
.LASF54:
	.string	"long long unsigned int"
.LASF61:
	.string	"factLDL"
.LASF53:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF68:
	.string	"/home/alan/Bureau/Scolaire_2019-2020/Projet_M1/factorisation_alg/sequential"
.LASF25:
	.string	"_fileno"
.LASF13:
	.string	"_IO_read_end"
.LASF6:
	.string	"long int"
.LASF64:
	.string	"factQR_Schmidt"
.LASF11:
	.string	"_flags"
.LASF19:
	.string	"_IO_buf_end"
.LASF28:
	.string	"_cur_column"
.LASF56:
	.string	"double"
.LASF27:
	.string	"_old_offset"
.LASF32:
	.string	"_offset"
.LASF71:
	.string	"factLU_Doolittle"
.LASF62:
	.string	"factCHolesky"
.LASF60:
	.string	"fmatrix_t"
.LASF59:
	.string	"matrix"
.LASF41:
	.string	"_IO_marker"
.LASF48:
	.string	"stdin"
.LASF3:
	.string	"unsigned int"
.LASF58:
	.string	"fmatrix"
.LASF0:
	.string	"long unsigned int"
.LASF70:
	.string	"_IO_FILE_plus"
.LASF16:
	.string	"_IO_write_ptr"
.LASF51:
	.string	"sys_nerr"
.LASF43:
	.string	"_sbuf"
.LASF2:
	.string	"short unsigned int"
.LASF20:
	.string	"_IO_save_base"
.LASF65:
	.string	"factLU_Crout"
.LASF31:
	.string	"_lock"
.LASF26:
	.string	"_flags2"
.LASF38:
	.string	"_mode"
.LASF49:
	.string	"stdout"
.LASF45:
	.string	"_IO_2_1_stdin_"
.LASF67:
	.string	"fact_alg.c"
.LASF17:
	.string	"_IO_write_end"
.LASF69:
	.string	"_IO_lock_t"
.LASF40:
	.string	"_IO_FILE"
.LASF55:
	.string	"float"
.LASF44:
	.string	"_pos"
.LASF52:
	.string	"sys_errlist"
.LASF23:
	.string	"_markers"
.LASF1:
	.string	"unsigned char"
.LASF5:
	.string	"short int"
.LASF29:
	.string	"_vtable_offset"
.LASF46:
	.string	"_IO_2_1_stdout_"
.LASF66:
	.string	"GNU C11 7.4.0 -mtune=generic -march=x86-64 -g -fstack-protector-strong"
.LASF10:
	.string	"char"
.LASF42:
	.string	"_next"
.LASF9:
	.string	"__off64_t"
.LASF14:
	.string	"_IO_read_base"
.LASF22:
	.string	"_IO_save_end"
.LASF33:
	.string	"__pad1"
.LASF34:
	.string	"__pad2"
.LASF35:
	.string	"__pad3"
.LASF36:
	.string	"__pad4"
.LASF37:
	.string	"__pad5"
.LASF39:
	.string	"_unused2"
.LASF50:
	.string	"stderr"
.LASF57:
	.string	"signgam"
.LASF21:
	.string	"_IO_backup_base"
.LASF15:
	.string	"_IO_write_base"
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
