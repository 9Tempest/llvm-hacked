	.text
	.file	"hw2perf1.c"

#@@@ 
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rax
	shrq	$3, %rax
	mulq	%r14
	shrq	$4, %rdx
	imulq	$-8000, %rdx, %rax              # imm = 0xE0C0
	addq	%rbp, %rax
	addq	$-24032, %rax                   # imm = 0xA220
	movl	%ebx, %ecx
	imulq	$1441151881, %rcx, %rcx         # imm = 0x55E63B89
	shrq	$57, %rcx
	imull	$-100000000, %ecx, %ecx         # imm = 0xFA0A1F00
	movapd	%xmm1, %xmm2
	mulsd	%xmm0, %xmm2
	mulsd	%xmm5, %xmm2
	divsd	%xmm6, %xmm2
	movapd	%xmm0, %xmm3
	unpckhpd	%xmm0, %xmm3                    # xmm3 = xmm3[1],xmm0[1]
	mulsd	%xmm2, %xmm3
	mulsd	%xmm7, %xmm3
	addsd	%xmm8, %xmm3
	addsd	%xmm4, %xmm3
	movsd	%xmm3, (%rax,%rbx,8)
#@@@EOB

#@@@ vector.body
.LBB0_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movdqa	%xmm0, %xmm5
	cvtdq2pd	%xmm0, %xmm6
	paddd	%xmm1, %xmm5
	cvtdq2pd	%xmm5, %xmm5
	movapd	%xmm6, %xmm7
	mulpd	%xmm2, %xmm7
	movapd	%xmm5, %xmm8
	mulpd	%xmm2, %xmm8
	movapd	%xmm7, -16048(%rbp,%rax,8)
	movapd	%xmm8, -16032(%rbp,%rax,8)
	mulpd	%xmm3, %xmm6
	mulpd	%xmm3, %xmm5
	movapd	%xmm6, -8048(%rbp,%rax,8)
	movapd	%xmm5, -8032(%rbp,%rax,8)
	paddd	%xmm4, %xmm0
#@@@EOB

#@@@ 
.LBB0_6:
	incq	.L__profc_main+32(%rip)
	xorl	%ebx, %ebx
#@@@EOB

#@@@ 
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=1
	addsd	%xmm9, %xmm4
#@@@EOB

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%f\n"
	.size	.L.str, 4

	.hidden	__llvm_profile_raw_version      # @__llvm_profile_raw_version
	.type	__llvm_profile_raw_version,@object
	.section	.rodata.__llvm_profile_raw_version,"aG",@progbits,__llvm_profile_raw_version,comdat
	.globl	__llvm_profile_raw_version
	.p2align	3, 0x0
__llvm_profile_raw_version:
	.quad	72057594037927944               # 0x100000000000008
	.size	__llvm_profile_raw_version, 8

	.type	.L__profc_main,@object          # @__profc_main
	.section	__llvm_prf_cnts,"aGw",@progbits,__profc_main
	.p2align	3, 0x0
.L__profc_main:
	.zero	40
	.size	.L__profc_main, 40

	.type	.L__profd_main,@object          # @__profd_main
	.section	__llvm_prf_data,"aGw",@progbits,__profc_main
	.p2align	3, 0x0
.L__profd_main:
	.quad	-2624081020897602054            # 0xdb956436e78dd5fa
	.quad	135188635704208155              # 0x1e0495910d1ab1b
	.quad	.L__profc_main-.L__profd_main
	.quad	main
	.quad	0
	.long	5                               # 0x5
	.zero	4
	.size	.L__profd_main, 48

	.type	.L__llvm_prf_nm,@object         # @__llvm_prf_nm
	.section	__llvm_prf_names,"aR",@progbits,unique,1
.L__llvm_prf_nm:
	.ascii	"\004\fx\332\313M\314\314\003\000\004\033\001\246"
	.size	.L__llvm_prf_nm, 14

	.cg_profile main, srand, 1
	.cg_profile main, rand, 10
	.cg_profile main, printf, 1001
	.ident	"clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)"
	.section	".note.GNU-stack","",@progbits
