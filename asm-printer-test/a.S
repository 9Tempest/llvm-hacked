	.text
	.file	"hw2correct1.c"
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$112, %rsp
	movl	$0, -12(%rbp)
	movaps	.L__const.main.A(%rip), %xmm0
	movaps	%xmm0, -112(%rbp)
	movaps	.L__const.main.A+16(%rip), %xmm0
	movaps	%xmm0, -96(%rbp)
	movabsq	$38654705672, %rax              # imm = 0x900000008
	movq	%rax, -80(%rbp)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -64(%rbp)
	movaps	%xmm0, -48(%rbp)
	movq	$0, -32(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	movslq	-4(%rbp), %rax
	movl	-64(%rbp,%rax,4), %esi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	incl	-4(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$9, -4(%rbp)
	jg	.LBB0_5
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movslq	-8(%rbp), %rax
	movl	-112(%rbp,%rax,4), %eax
	leal	(%rax,%rax,4), %ecx
	leal	(%rax,%rcx,2), %eax
	movslq	-4(%rbp), %rcx
	addl	%ecx, %eax
	movl	%eax, -64(%rbp,%rcx,4)
	cmpq	$7, %rcx
	jg	.LBB0_4
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-4(%rbp), %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB0_4
.LBB0_5:
	xorl	%eax, %eax
	addq	$112, %rsp
	popq	%rbp
	retq

	.type	.L__const.main.A,@object        # @__const.main.A
	.section	.rodata,"a",@progbits
	.p2align	4, 0x0
.L__const.main.A:
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	3                               # 0x3
	.long	4                               # 0x4
	.long	5                               # 0x5
	.long	6                               # 0x6
	.long	7                               # 0x7
	.long	8                               # 0x8
	.long	9                               # 0x9
	.size	.L__const.main.A, 40

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d\n"
	.size	.L.str, 4

	.ident	"clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)"
	.section	".note.GNU-stack","",@progbits
