	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 12, 0
	.globl	_print_mem_error                ## -- Begin function print_mem_error
	.p2align	4, 0x90
_print_mem_error:                       ## @print_mem_error
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movl	-4(%rbp), %edx
	movq	-16(%rbp), %rcx
	leaq	L_.str(%rip), %rsi
	xorl	%eax, %eax
                                        ## kill: def $al killed $al killed $eax
	callq	_fprintf
	movl	$1, %edi
	callq	_exit
	.cfi_endproc
                                        ## -- End function
	.globl	_min                            ## -- Begin function min
	.p2align	4, 0x90
_min:                                   ## @min
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jae	LBB1_2
## %bb.1:
	movl	-4(%rbp), %eax
	movl	%eax, -12(%rbp)                 ## 4-byte Spill
	jmp	LBB1_3
LBB1_2:
	movl	-8(%rbp), %eax
	movl	%eax, -12(%rbp)                 ## 4-byte Spill
LBB1_3:
	movl	-12(%rbp), %eax                 ## 4-byte Reload
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_grid                           ## -- Begin function grid
	.p2align	4, 0x90
_grid:                                  ## @grid
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	_n2@GOTPCREL(%rip), %rdx
	movq	_grid_@GOTPCREL(%rip), %rax
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movq	(%rax), %rax
	movl	-4(%rbp), %ecx
	imull	(%rdx), %ecx
	addl	-8(%rbp), %ecx
	movslq	%ecx, %rcx
	shlq	$5, %rcx
	addq	%rcx, %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_element                        ## -- Begin function element
	.p2align	4, 0x90
_element:                               ## @element
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %edi
	movl	-8(%rbp), %esi
	callq	_grid
	movl	8(%rax), %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_available                      ## -- Begin function available
	.p2align	4, 0x90
_available:                             ## @available
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %edi
	movl	-8(%rbp), %esi
	callq	_grid
	movq	16(%rax), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_is_given                       ## -- Begin function is_given
	.p2align	4, 0x90
_is_given:                              ## @is_given
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %edi
	movl	-8(%rbp), %esi
	callq	_grid
	movl	24(%rax), %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_initialize_grid                ## -- Begin function initialize_grid
	.p2align	4, 0x90
_initialize_grid:                       ## @initialize_grid
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	_n2@GOTPCREL(%rip), %rcx
	movq	_empty_cells@GOTPCREL(%rip), %rax
	movl	(%rcx), %edx
	imull	(%rcx), %edx
	movl	%edx, (%rax)
	movl	(%rcx), %eax
	imull	(%rcx), %eax
	movslq	%eax, %rdi
	shlq	$5, %rdi
	callq	_malloc
	movq	%rax, %rcx
	movq	_grid_@GOTPCREL(%rip), %rax
	movq	%rcx, (%rax)
	cmpq	$0, (%rax)
	jne	LBB6_2
## %bb.1:
	movq	_n2@GOTPCREL(%rip), %rax
	movl	(%rax), %edi
	imull	(%rax), %edi
	movl	$32, %esi
	callq	_print_mem_error
LBB6_2:
	movl	$0, -4(%rbp)
LBB6_3:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB6_7 Depth 2
	movq	_n2@GOTPCREL(%rip), %rdx
	movl	-4(%rbp), %eax
	movl	(%rdx), %ecx
	imull	(%rdx), %ecx
	cmpl	%ecx, %eax
	jge	LBB6_12
## %bb.4:                               ##   in Loop: Header=BB6_3 Depth=1
	movq	_n2@GOTPCREL(%rip), %rsi
	movq	%rsi, -16(%rbp)                 ## 8-byte Spill
	movq	_grid_@GOTPCREL(%rip), %rcx
	movl	-4(%rbp), %eax
	cltd
	idivl	(%rsi)
	movl	%eax, %edx
	movq	(%rcx), %rax
	movslq	-4(%rbp), %rdi
	shlq	$5, %rdi
	addq	%rdi, %rax
	movl	%edx, (%rax)
	movl	-4(%rbp), %eax
	cltd
	idivl	(%rsi)
	movq	-16(%rbp), %rax                 ## 8-byte Reload
	movl	%edx, %esi
	movq	(%rcx), %rdx
	movslq	-4(%rbp), %rdi
	shlq	$5, %rdi
	addq	%rdi, %rdx
	movl	%esi, 4(%rdx)
	movq	(%rcx), %rdx
	movslq	-4(%rbp), %rsi
	shlq	$5, %rsi
	addq	%rsi, %rdx
	movl	$0, 8(%rdx)
	movl	(%rax), %edx
	movq	(%rcx), %rcx
	movslq	-4(%rbp), %rsi
	shlq	$5, %rsi
	addq	%rsi, %rcx
	movl	%edx, 12(%rcx)
	movslq	(%rax), %rdi
	shlq	$2, %rdi
	callq	_malloc
	movq	%rax, %rdx
	movq	_grid_@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movslq	-4(%rbp), %rsi
	shlq	$5, %rsi
	addq	%rsi, %rcx
	movq	%rdx, 16(%rcx)
	movq	(%rax), %rcx
	movslq	-4(%rbp), %rdx
	shlq	$5, %rdx
	addq	%rdx, %rcx
	movl	$0, 24(%rcx)
	movq	(%rax), %rax
	movslq	-4(%rbp), %rcx
	shlq	$5, %rcx
	addq	%rcx, %rax
	cmpq	$0, 16(%rax)
	jne	LBB6_6
## %bb.5:                               ##   in Loop: Header=BB6_3 Depth=1
	movq	_n2@GOTPCREL(%rip), %rax
	movl	(%rax), %edi
	movl	$4, %esi
	callq	_print_mem_error
LBB6_6:                                 ##   in Loop: Header=BB6_3 Depth=1
	movl	$0, -8(%rbp)
LBB6_7:                                 ##   Parent Loop BB6_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	_n2@GOTPCREL(%rip), %rcx
	movl	-8(%rbp), %eax
	cmpl	(%rcx), %eax
	jge	LBB6_10
## %bb.8:                               ##   in Loop: Header=BB6_7 Depth=2
	movq	_grid_@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movslq	-4(%rbp), %rcx
	shlq	$5, %rcx
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movslq	-8(%rbp), %rcx
	movl	$1, (%rax,%rcx,4)
## %bb.9:                               ##   in Loop: Header=BB6_7 Depth=2
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	LBB6_7
LBB6_10:                                ##   in Loop: Header=BB6_3 Depth=1
	jmp	LBB6_11
LBB6_11:                                ##   in Loop: Header=BB6_3 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	LBB6_3
LBB6_12:
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_remove_from_availables         ## -- Begin function remove_from_availables
	.p2align	4, 0x90
_remove_from_availables:                ## @remove_from_availables
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	%edi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movq	%rcx, -24(%rbp)
	movq	%r8, -32(%rbp)
	movl	-12(%rbp), %edi
	movl	-16(%rbp), %esi
	callq	_grid
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movl	-8(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	cmpl	$0, (%rax,%rcx,4)
	jne	LBB7_2
## %bb.1:
	movl	$0, -4(%rbp)
	jmp	LBB7_6
LBB7_2:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movl	-8(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	movl	$0, (%rax,%rcx,4)
	movq	-40(%rbp), %rax
	movl	12(%rax), %ecx
	addl	$-1, %ecx
	movl	%ecx, 12(%rax)
	cmpq	$0, -24(%rbp)
	je	LBB7_5
## %bb.3:
	cmpq	$0, -32(%rbp)
	je	LBB7_5
## %bb.4:
	movl	-12(%rbp), %edx
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	(%rcx), %rcx
	movl	%edx, (%rax,%rcx,8)
	movl	-16(%rbp), %edx
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rcx
	movslq	(%rcx), %rcx
	movl	%edx, 4(%rax,%rcx,8)
	movq	-32(%rbp), %rax
	movl	(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, (%rax)
LBB7_5:
	movl	$1, -4(%rbp)
LBB7_6:
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_place                          ## -- Begin function place
	.p2align	4, 0x90
_place:                                 ## @place
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$96, %rsp
	movl	%edi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	%ecx, -20(%rbp)
	movq	%r8, -32(%rbp)
	movq	%r9, -40(%rbp)
	cmpl	$1, -8(%rbp)
	jl	LBB8_2
## %bb.1:
	movq	_n2@GOTPCREL(%rip), %rcx
	movl	-8(%rbp), %eax
	cmpl	(%rcx), %eax
	jle	LBB8_3
LBB8_2:
	movl	$0, -4(%rbp)
	jmp	LBB8_24
LBB8_3:
	movl	-12(%rbp), %edi
	movl	-16(%rbp), %esi
	callq	_available
	movl	-8(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	cmpl	$0, (%rax,%rcx,4)
	jne	LBB8_5
## %bb.4:
	movl	$0, -4(%rbp)
	jmp	LBB8_24
LBB8_5:
	movl	-8(%rbp), %eax
	movl	%eax, -64(%rbp)                 ## 4-byte Spill
	movl	-12(%rbp), %edi
	movl	-16(%rbp), %esi
	callq	_grid
	movl	-64(%rbp), %ecx                 ## 4-byte Reload
	movl	%ecx, 8(%rax)
	movl	-20(%rbp), %eax
	movl	%eax, -60(%rbp)                 ## 4-byte Spill
	movl	-12(%rbp), %edi
	movl	-16(%rbp), %esi
	callq	_grid
	movl	-60(%rbp), %edx                 ## 4-byte Reload
	movq	%rax, %rcx
	movq	_empty_cells@GOTPCREL(%rip), %rax
	movl	%edx, 24(%rcx)
	movl	(%rax), %ecx
	addl	$-1, %ecx
	movl	%ecx, (%rax)
	cmpq	$0, -40(%rbp)
	je	LBB8_7
## %bb.6:
	movq	-40(%rbp), %rax
	movl	$0, (%rax)
LBB8_7:
	movl	$0, -44(%rbp)
LBB8_8:                                 ## =>This Inner Loop Header: Depth=1
	movq	_n2@GOTPCREL(%rip), %rcx
	movl	-44(%rbp), %eax
	cmpl	(%rcx), %eax
	jge	LBB8_11
## %bb.9:                               ##   in Loop: Header=BB8_8 Depth=1
	movl	-8(%rbp), %edi
	movl	-12(%rbp), %esi
	movl	-44(%rbp), %edx
	movq	-32(%rbp), %rcx
	movq	-40(%rbp), %r8
	callq	_remove_from_availables
## %bb.10:                              ##   in Loop: Header=BB8_8 Depth=1
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	jmp	LBB8_8
LBB8_11:
	movl	$0, -48(%rbp)
LBB8_12:                                ## =>This Inner Loop Header: Depth=1
	movq	_n2@GOTPCREL(%rip), %rcx
	movl	-48(%rbp), %eax
	cmpl	(%rcx), %eax
	jge	LBB8_15
## %bb.13:                              ##   in Loop: Header=BB8_12 Depth=1
	movl	-8(%rbp), %edi
	movl	-48(%rbp), %esi
	movl	-16(%rbp), %edx
	movq	-32(%rbp), %rcx
	movq	-40(%rbp), %r8
	callq	_remove_from_availables
## %bb.14:                              ##   in Loop: Header=BB8_12 Depth=1
	movl	-48(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -48(%rbp)
	jmp	LBB8_12
LBB8_15:
	movq	_n@GOTPCREL(%rip), %rcx
	movl	-12(%rbp), %eax
	cltd
	idivl	(%rcx)
	imull	(%rcx), %eax
	movl	%eax, -52(%rbp)
LBB8_16:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB8_18 Depth 2
	movq	_n@GOTPCREL(%rip), %rcx
	movq	%rcx, -80(%rbp)                 ## 8-byte Spill
	movl	-52(%rbp), %eax
	movl	%eax, -68(%rbp)                 ## 4-byte Spill
	movl	-12(%rbp), %eax
	cltd
	idivl	(%rcx)
	movq	-80(%rbp), %rdx                 ## 8-byte Reload
	movl	%eax, %ecx
	movl	-68(%rbp), %eax                 ## 4-byte Reload
	addl	$1, %ecx
	imull	(%rdx), %ecx
	cmpl	%ecx, %eax
	jge	LBB8_23
## %bb.17:                              ##   in Loop: Header=BB8_16 Depth=1
	movq	_n@GOTPCREL(%rip), %rcx
	movl	-16(%rbp), %eax
	cltd
	idivl	(%rcx)
	imull	(%rcx), %eax
	movl	%eax, -56(%rbp)
LBB8_18:                                ##   Parent Loop BB8_16 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	_n@GOTPCREL(%rip), %rcx
	movq	%rcx, -96(%rbp)                 ## 8-byte Spill
	movl	-56(%rbp), %eax
	movl	%eax, -84(%rbp)                 ## 4-byte Spill
	movl	-16(%rbp), %eax
	cltd
	idivl	(%rcx)
	movq	-96(%rbp), %rdx                 ## 8-byte Reload
	movl	%eax, %ecx
	movl	-84(%rbp), %eax                 ## 4-byte Reload
	addl	$1, %ecx
	imull	(%rdx), %ecx
	cmpl	%ecx, %eax
	jge	LBB8_21
## %bb.19:                              ##   in Loop: Header=BB8_18 Depth=2
	movl	-8(%rbp), %edi
	movl	-52(%rbp), %esi
	movl	-56(%rbp), %edx
	movq	-32(%rbp), %rcx
	movq	-40(%rbp), %r8
	callq	_remove_from_availables
## %bb.20:                              ##   in Loop: Header=BB8_18 Depth=2
	movl	-56(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -56(%rbp)
	jmp	LBB8_18
LBB8_21:                                ##   in Loop: Header=BB8_16 Depth=1
	jmp	LBB8_22
LBB8_22:                                ##   in Loop: Header=BB8_16 Depth=1
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	jmp	LBB8_16
LBB8_23:
	movl	$1, -4(%rbp)
LBB8_24:
	movl	-4(%rbp), %eax
	addq	$96, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_remove_element                 ## -- Begin function remove_element
	.p2align	4, 0x90
_remove_element:                        ## @remove_element
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movl	$0, -24(%rbp)
LBB9_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-24(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	LBB9_4
## %bb.2:                               ##   in Loop: Header=BB9_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movl	(%rax,%rcx,8), %edi
	movq	-16(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movl	4(%rax,%rcx,8), %esi
	callq	_grid
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	8(%rcx), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	movl	$1, (%rax,%rcx,4)
	movq	-32(%rbp), %rax
	movl	12(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 12(%rax)
## %bb.3:                               ##   in Loop: Header=BB9_1 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB9_1
LBB9_4:
	movq	_empty_cells@GOTPCREL(%rip), %rax
	movq	-8(%rbp), %rcx
	movl	$0, 8(%rcx)
	movl	(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, (%rax)
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_read_file                      ## -- Begin function read_file
	.p2align	4, 0x90
_read_file:                             ## @read_file
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	leaq	L_.str.1(%rip), %rsi
	callq	_fopen
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	LBB10_2
## %bb.1:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	L_.str.2(%rip), %rsi
	xorl	%eax, %eax
                                        ## kill: def $al killed $al killed $eax
	callq	_fprintf
	movl	$1, %edi
	callq	_exit
LBB10_2:
	movq	_n@GOTPCREL(%rip), %rdx
	movq	-16(%rbp), %rdi
	leaq	L_.str.3(%rip), %rsi
	movb	$0, %al
	callq	_fscanf
	movq	_n2@GOTPCREL(%rip), %rax
	movq	_n@GOTPCREL(%rip), %rdx
	movl	(%rdx), %ecx
	imull	(%rdx), %ecx
	movl	%ecx, (%rax)
	callq	_initialize_grid
	movl	$0, -24(%rbp)
LBB10_3:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB10_5 Depth 2
	movq	_n2@GOTPCREL(%rip), %rcx
	movl	-24(%rbp), %eax
	cmpl	(%rcx), %eax
	jge	LBB10_10
## %bb.4:                               ##   in Loop: Header=BB10_3 Depth=1
	movl	$0, -28(%rbp)
LBB10_5:                                ##   Parent Loop BB10_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	_n2@GOTPCREL(%rip), %rcx
	movl	-28(%rbp), %eax
	cmpl	(%rcx), %eax
	jge	LBB10_8
## %bb.6:                               ##   in Loop: Header=BB10_5 Depth=2
	movq	-16(%rbp), %rdi
	leaq	L_.str.3(%rip), %rsi
	leaq	-20(%rbp), %rdx
	movb	$0, %al
	callq	_fscanf
	xorl	%eax, %eax
	movl	%eax, %r9d
	movl	-20(%rbp), %edi
	movl	-24(%rbp), %esi
	movl	-28(%rbp), %edx
	movl	$1, %ecx
	movq	%r9, %r8
	callq	_place
## %bb.7:                               ##   in Loop: Header=BB10_5 Depth=2
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB10_5
LBB10_8:                                ##   in Loop: Header=BB10_3 Depth=1
	jmp	LBB10_9
LBB10_9:                                ##   in Loop: Header=BB10_3 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB10_3
LBB10_10:
	movq	-16(%rbp), %rdi
	callq	_fclose
	leaq	L_.str.4(%rip), %rdi
	movb	$0, %al
	callq	_printf
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_sort                           ## -- Begin function sort
	.p2align	4, 0x90
_sort:                                  ## @sort
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	_stack_idx@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	$0, -28(%rbp)
LBB11_1:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB11_5 Depth 2
	movq	_n2@GOTPCREL(%rip), %rdx
	movl	-28(%rbp), %eax
	movl	(%rdx), %ecx
	imull	(%rdx), %ecx
	cmpl	%ecx, %eax
	jge	LBB11_12
## %bb.2:                               ##   in Loop: Header=BB11_1 Depth=1
	movq	_grid_@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movslq	-28(%rbp), %rcx
	shlq	$5, %rcx
	addq	%rcx, %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	cmpl	$0, 8(%rax)
	jle	LBB11_4
## %bb.3:                               ##   in Loop: Header=BB11_1 Depth=1
	jmp	LBB11_11
LBB11_4:                                ##   in Loop: Header=BB11_1 Depth=1
	movq	_stack@GOTPCREL(%rip), %rax
	movq	-16(%rbp), %rdx
	movq	(%rax), %rcx
	movslq	-4(%rbp), %rsi
	shlq	$5, %rsi
	addq	%rsi, %rcx
	movq	%rdx, (%rcx)
	movq	(%rax), %rcx
	movslq	-4(%rbp), %rdx
	shlq	$5, %rdx
	addq	%rdx, %rcx
	movl	$1, 8(%rcx)
	movq	(%rax), %rax
	movslq	-4(%rbp), %rcx
	shlq	$5, %rcx
	addq	%rcx, %rax
	movl	$0, 24(%rax)
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -32(%rbp)
LBB11_5:                                ##   Parent Loop BB11_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	xorl	%eax, %eax
                                        ## kill: def $al killed $al killed $eax
	movq	_stack_idx@GOTPCREL(%rip), %rdx
	movl	-32(%rbp), %ecx
	cmpl	(%rdx), %ecx
	movb	%al, -33(%rbp)                  ## 1-byte Spill
	jl	LBB11_7
## %bb.6:                               ##   in Loop: Header=BB11_5 Depth=2
	movq	_stack@GOTPCREL(%rip), %rcx
	movq	-16(%rbp), %rax
	movl	12(%rax), %eax
	movq	(%rcx), %rcx
	movslq	-32(%rbp), %rdx
	shlq	$5, %rdx
	addq	%rdx, %rcx
	movq	(%rcx), %rcx
	cmpl	12(%rcx), %eax
	setl	%al
	movb	%al, -33(%rbp)                  ## 1-byte Spill
LBB11_7:                                ##   in Loop: Header=BB11_5 Depth=2
	movb	-33(%rbp), %al                  ## 1-byte Reload
	testb	$1, %al
	jne	LBB11_8
	jmp	LBB11_10
LBB11_8:                                ##   in Loop: Header=BB11_5 Depth=2
	movq	_stack@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movslq	-32(%rbp), %rdx
	shlq	$5, %rdx
	addq	%rdx, %rcx
	movq	(%rcx), %rcx
	movq	%rcx, -24(%rbp)
	movq	-16(%rbp), %rdx
	movq	(%rax), %rcx
	movslq	-32(%rbp), %rsi
	shlq	$5, %rsi
	addq	%rsi, %rcx
	movq	%rdx, (%rcx)
	movq	-24(%rbp), %rcx
	movq	(%rax), %rax
	movl	-32(%rbp), %edx
	addl	$1, %edx
	movslq	%edx, %rdx
	shlq	$5, %rdx
	addq	%rdx, %rax
	movq	%rcx, (%rax)
## %bb.9:                               ##   in Loop: Header=BB11_5 Depth=2
	movl	-32(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -32(%rbp)
	jmp	LBB11_5
LBB11_10:                               ##   in Loop: Header=BB11_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
LBB11_11:                               ##   in Loop: Header=BB11_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB11_1
LBB11_12:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_solve_r                        ## -- Begin function solve_r
	.p2align	4, 0x90
_solve_r:                               ## @solve_r
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	_empty_cells@GOTPCREL(%rip), %rax
	movq	%rdi, -16(%rbp)
	movl	%esi, -20(%rbp)
	movq	%rdx, -32(%rbp)
	movq	%rcx, -40(%rbp)
	cmpl	$0, (%rax)
	jne	LBB12_2
## %bb.1:
	movl	$1, -4(%rbp)
	jmp	LBB12_11
LBB12_2:
	movl	-20(%rbp), %eax
	movl	%eax, -44(%rbp)
LBB12_3:                                ## =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
                                        ## kill: def $al killed $al killed $eax
	movq	_n2@GOTPCREL(%rip), %rdx
	movl	-44(%rbp), %ecx
	cmpl	(%rdx), %ecx
	movb	%al, -45(%rbp)                  ## 1-byte Spill
	jg	LBB12_5
## %bb.4:                               ##   in Loop: Header=BB12_3 Depth=1
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movl	-44(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	cmpl	$0, (%rax,%rcx,4)
	setne	%al
	xorb	$-1, %al
	movb	%al, -45(%rbp)                  ## 1-byte Spill
LBB12_5:                                ##   in Loop: Header=BB12_3 Depth=1
	movb	-45(%rbp), %al                  ## 1-byte Reload
	testb	$1, %al
	jne	LBB12_6
	jmp	LBB12_8
LBB12_6:                                ##   in Loop: Header=BB12_3 Depth=1
	jmp	LBB12_7
LBB12_7:                                ##   in Loop: Header=BB12_3 Depth=1
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	jmp	LBB12_3
LBB12_8:
	movq	_n2@GOTPCREL(%rip), %rcx
	movl	-44(%rbp), %eax
	cmpl	(%rcx), %eax
	jle	LBB12_10
## %bb.9:
	movq	_stack_idx@GOTPCREL(%rip), %rax
	movl	(%rax), %ecx
	addl	$-1, %ecx
	movl	%ecx, (%rax)
	movl	$0, -4(%rbp)
	jmp	LBB12_11
LBB12_10:
	xorl	%ecx, %ecx
	movl	-44(%rbp), %edi
	movq	-16(%rbp), %rax
	movl	(%rax), %esi
	movq	-16(%rbp), %rax
	movl	4(%rax), %edx
	movq	-32(%rbp), %r8
	movq	-40(%rbp), %r9
	callq	_place
	movq	_stack_idx@GOTPCREL(%rip), %rcx
	movq	_stack@GOTPCREL(%rip), %rax
	movl	(%rcx), %edx
	addl	$1, %edx
	movl	%edx, (%rcx)
	movq	(%rax), %rax
	movslq	(%rcx), %rcx
	shlq	$5, %rcx
	addq	%rcx, %rax
	movl	$1, 8(%rax)
	movl	$1, -4(%rbp)
LBB12_11:
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_init_solve                     ## -- Begin function init_solve
	.p2align	4, 0x90
_init_solve:                            ## @init_solve
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	_n2@GOTPCREL(%rip), %rcx
	movq	_stack_idx@GOTPCREL(%rip), %rax
	movl	$0, (%rax)
	movl	(%rcx), %eax
	imull	(%rcx), %eax
	movslq	%eax, %rdi
	shlq	$5, %rdi
	callq	_malloc
	movq	%rax, %rcx
	movq	_stack@GOTPCREL(%rip), %rax
	movq	%rcx, (%rax)
	cmpq	$0, (%rax)
	jne	LBB13_2
## %bb.1:
	movq	_n2@GOTPCREL(%rip), %rax
	movl	(%rax), %edi
	imull	(%rax), %edi
	movl	$32, %esi
	callq	_print_mem_error
LBB13_2:
	movl	$0, -4(%rbp)
LBB13_3:                                ## =>This Inner Loop Header: Depth=1
	movq	_n2@GOTPCREL(%rip), %rdx
	movl	-4(%rbp), %eax
	movl	(%rdx), %ecx
	imull	(%rdx), %ecx
	cmpl	%ecx, %eax
	jge	LBB13_6
## %bb.4:                               ##   in Loop: Header=BB13_3 Depth=1
	movq	_n2@GOTPCREL(%rip), %rax
	imull	$3, (%rax), %eax
	movslq	%eax, %rdi
	shlq	$3, %rdi
	callq	_malloc
	movq	%rax, %rcx
	movq	_stack@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movslq	-4(%rbp), %rdx
	shlq	$5, %rdx
	addq	%rdx, %rax
	movq	%rcx, 16(%rax)
## %bb.5:                               ##   in Loop: Header=BB13_3 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	LBB13_3
LBB13_6:
	callq	_sort
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	leaq	L_.str.5(%rip), %rdi
	callq	_read_file
	callq	_init_solve
	xorl	%eax, %eax
	movl	%eax, %edi
	xorl	%esi, %esi
	movq	_FPS@GOTPCREL(%rip), %rax
	movq	_n2@GOTPCREL(%rip), %rdx
	movq	_n@GOTPCREL(%rip), %rcx
	movl	(%rcx), %ecx
	imull	(%rdx), %ecx
	movl	%ecx, (%rax)
	callq	_gtk_application_new
	leaq	_activate(%rip), %rdx
	xorl	%ecx, %ecx
	movl	%ecx, %r8d
	xorl	%r9d, %r9d
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rdi
	leaq	L_.str.6(%rip), %rsi
	movq	%r8, %rcx
	callq	_g_signal_connect_data
	movq	-24(%rbp), %rax
	movq	%rax, -40(%rbp)                 ## 8-byte Spill
	callq	_g_application_get_type
	movq	-40(%rbp), %rdi                 ## 8-byte Reload
	movq	%rax, %rsi
	callq	_g_type_check_instance_cast
	movq	%rax, %rdi
	movl	-8(%rbp), %esi
	movq	-16(%rbp), %rdx
	callq	_g_application_run
	movl	%eax, -28(%rbp)
	movq	-24(%rbp), %rdi
	callq	_g_object_unref
	movl	-28(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90                         ## -- Begin function activate
_activate:                              ## @activate
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	callq	_gtk_application_window_new
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -56(%rbp)                 ## 8-byte Spill
	callq	_gtk_window_get_type
	movq	-56(%rbp), %rdi                 ## 8-byte Reload
	movq	%rax, %rsi
	callq	_g_type_check_instance_cast
	movq	%rax, %rdi
	leaq	L_.str.7(%rip), %rsi
	callq	_gtk_window_set_title
	movq	-24(%rbp), %rax
	movq	%rax, -48(%rbp)                 ## 8-byte Spill
	callq	_gtk_window_get_type
	movq	-48(%rbp), %rdi                 ## 8-byte Reload
	movq	%rax, %rsi
	callq	_g_type_check_instance_cast
	movq	%rax, %rdi
	movq	_n2@GOTPCREL(%rip), %rax
	imull	$50, (%rax), %esi
	imull	$50, (%rax), %edx
	callq	_gtk_window_set_default_size
	callq	_gtk_drawing_area_new
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -40(%rbp)                 ## 8-byte Spill
	callq	_gtk_container_get_type
	movq	-40(%rbp), %rdi                 ## 8-byte Reload
	movq	%rax, %rsi
	callq	_g_type_check_instance_cast
	movq	%rax, %rdi
	movq	-32(%rbp), %rsi
	callq	_gtk_container_add
	movq	-32(%rbp), %rdi
	movl	$80, %esi
	callq	_g_type_check_instance_cast
	movq	%rax, %rdi
	leaq	_draw(%rip), %rdx
	xorl	%eax, %eax
	movl	%eax, %r8d
	xorl	%r9d, %r9d
	leaq	L_.str.8(%rip), %rsi
	movq	%r8, %rcx
	callq	_g_signal_connect_data
	movq	-24(%rbp), %rdi
	movl	$512, %esi                      ## imm = 0x200
	callq	_gtk_widget_add_events
	movq	-24(%rbp), %rdi
	movl	$80, %esi
	callq	_g_type_check_instance_cast
	movq	%rax, %rdi
	leaq	_on_click(%rip), %rdx
	xorl	%eax, %eax
	movl	%eax, %r8d
	xorl	%r9d, %r9d
	leaq	L_.str.9(%rip), %rsi
	movq	%r8, %rcx
	callq	_g_signal_connect_data
	movq	-24(%rbp), %rdi
	movl	$2048, %esi                     ## imm = 0x800
	callq	_gtk_widget_add_events
	movq	-24(%rbp), %rdi
	movl	$80, %esi
	callq	_g_type_check_instance_cast
	movq	%rax, %rdi
	leaq	_on_key_press(%rip), %rdx
	xorl	%eax, %eax
	movl	%eax, %r8d
	xorl	%r9d, %r9d
	leaq	L_.str.10(%rip), %rsi
	movq	%r8, %rcx
	callq	_g_signal_connect_data
	movq	-24(%rbp), %rdi
	callq	_gtk_widget_show_all
	movq	_FPS@GOTPCREL(%rip), %rcx
	movq	_tick_once@GOTPCREL(%rip), %rax
	movq	_will_tick@GOTPCREL(%rip), %rdx
	movl	$0, (%rdx)
	movl	$0, (%rax)
	movl	$1000, %eax                     ## imm = 0x3E8
	cltd
	idivl	(%rcx)
	movl	%eax, %edi
	movq	-32(%rbp), %rdx
	leaq	_tick(%rip), %rsi
	callq	_g_timeout_add
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ## -- Begin function draw
LCPI16_0:
	.quad	0x4034000000000000              ## double 20
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90
_draw:                                  ## @draw
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	_n@GOTPCREL(%rip), %rax
	movq	%rax, -40(%rbp)                 ## 8-byte Spill
	movsd	LCPI16_0(%rip), %xmm0           ## xmm0 = mem[0],zero
	movsd	%xmm0, -56(%rbp)                ## 8-byte Spill
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rdi
	callq	_gtk_widget_get_allocated_width
	movl	%eax, -28(%rbp)
	movq	-8(%rbp), %rdi
	callq	_gtk_widget_get_allocated_height
	movl	%eax, -32(%rbp)
	movl	-28(%rbp), %eax
                                        ## kill: def $rax killed $eax
	cvtsi2sd	%rax, %xmm0
	movq	_n2@GOTPCREL(%rip), %rax
	cvtsi2sdl	(%rax), %xmm1
	divsd	%xmm1, %xmm0
	movq	_x_diff@GOTPCREL(%rip), %rcx
	movsd	%xmm0, (%rcx)
	movl	-32(%rbp), %ecx
                                        ## kill: def $rcx killed $ecx
	cvtsi2sd	%rcx, %xmm0
	cvtsi2sdl	(%rax), %xmm1
	divsd	%xmm1, %xmm0
	movq	_y_diff@GOTPCREL(%rip), %rax
	movsd	%xmm0, (%rax)
	movq	-16(%rbp), %rdi
	movl	-28(%rbp), %esi
	movl	-32(%rbp), %edx
	callq	_draw_grid
	movq	-16(%rbp), %rax
	movq	%rax, -48(%rbp)                 ## 8-byte Spill
	movl	-28(%rbp), %edi
	movl	-32(%rbp), %esi
	callq	_min
	movsd	-56(%rbp), %xmm1                ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	movq	-48(%rbp), %rdi                 ## 8-byte Reload
	movl	%eax, %ecx
	movq	-40(%rbp), %rax                 ## 8-byte Reload
	movl	%ecx, %ecx
                                        ## kill: def $rcx killed $ecx
	cvtsi2sd	%rcx, %xmm0
	divsd	%xmm1, %xmm0
	movl	(%rax), %eax
	subl	$2, %eax
	cvtsi2sd	%eax, %xmm1
	divsd	%xmm1, %xmm0
	callq	_print_grid
	xorl	%eax, %eax
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90                         ## -- Begin function on_click
_on_click:                              ## @on_click
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	_y_diff@GOTPCREL(%rip), %rax
	movq	_x_diff@GOTPCREL(%rip), %rcx
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	movsd	24(%rdx), %xmm0                 ## xmm0 = mem[0],zero
	divsd	(%rcx), %xmm0
	cvttsd2si	%xmm0, %ecx
	movl	%ecx, -32(%rbp)
	movq	-16(%rbp), %rcx
	movsd	32(%rcx), %xmm0                 ## xmm0 = mem[0],zero
	divsd	(%rax), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, -48(%rbp)                 ## 4-byte Spill
	movl	-32(%rbp), %eax
	movl	%eax, -44(%rbp)                 ## 4-byte Spill
	movl	-28(%rbp), %edi
	movl	-32(%rbp), %esi
	callq	_element
	movl	%eax, -40(%rbp)                 ## 4-byte Spill
	movl	-28(%rbp), %edi
	movl	-32(%rbp), %esi
	callq	_grid
	movl	-48(%rbp), %esi                 ## 4-byte Reload
	movl	-44(%rbp), %edx                 ## 4-byte Reload
	movl	-40(%rbp), %ecx                 ## 4-byte Reload
	movl	12(%rax), %r8d
	leaq	L_.str.11(%rip), %rdi
	movb	$0, %al
	callq	_g_print
	movl	$1, -36(%rbp)
LBB17_1:                                ## =>This Inner Loop Header: Depth=1
	movq	_n2@GOTPCREL(%rip), %rcx
	movl	-36(%rbp), %eax
	cmpl	(%rcx), %eax
	jg	LBB17_6
## %bb.2:                               ##   in Loop: Header=BB17_1 Depth=1
	movl	-28(%rbp), %edi
	movl	-32(%rbp), %esi
	callq	_available
	movl	-36(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	cmpl	$0, (%rax,%rcx,4)
	je	LBB17_4
## %bb.3:                               ##   in Loop: Header=BB17_1 Depth=1
	movl	-36(%rbp), %esi
	leaq	L_.str.12(%rip), %rdi
	movb	$0, %al
	callq	_g_print
LBB17_4:                                ##   in Loop: Header=BB17_1 Depth=1
	jmp	LBB17_5
LBB17_5:                                ##   in Loop: Header=BB17_1 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	LBB17_1
LBB17_6:
	leaq	L_.str.13(%rip), %rdi
	movb	$0, %al
	callq	_g_print
	movl	$1, %eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90                         ## -- Begin function on_key_press
_on_key_press:                          ## @on_key_press
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rax
	cmpl	$32, 28(%rax)
	jne	LBB18_2
## %bb.1:
	movq	_will_tick@GOTPCREL(%rip), %rax
	cmpl	$0, (%rax)
	setne	%cl
	xorb	$-1, %cl
	andb	$1, %cl
	movzbl	%cl, %ecx
	movl	%ecx, (%rax)
	jmp	LBB18_6
LBB18_2:
	movq	-16(%rbp), %rax
	cmpl	$65363, 28(%rax)                ## imm = 0xFF53
	jne	LBB18_5
## %bb.3:
	movq	_will_tick@GOTPCREL(%rip), %rax
	cmpl	$0, (%rax)
	jne	LBB18_5
## %bb.4:
	movq	_tick_once@GOTPCREL(%rip), %rax
	movl	$1, (%rax)
LBB18_5:
	jmp	LBB18_6
LBB18_6:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90                         ## -- Begin function tick
_tick:                                  ## @tick
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	_will_tick@GOTPCREL(%rip), %rax
	movq	%rdi, -8(%rbp)
	cmpl	$0, (%rax)
	jne	LBB19_2
## %bb.1:
	movq	_tick_once@GOTPCREL(%rip), %rax
	cmpl	$0, (%rax)
	je	LBB19_6
LBB19_2:
	movq	_stack_idx@GOTPCREL(%rip), %rcx
	movq	_stack@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movslq	(%rcx), %rcx
	shlq	$5, %rcx
	addq	%rcx, %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rdi
	movq	-16(%rbp), %rax
	movl	8(%rax), %esi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-16(%rbp), %rcx
	addq	$24, %rcx
	callq	_solve_r
	movl	%eax, -20(%rbp)
	cmpl	$0, -20(%rbp)
	je	LBB19_4
## %bb.3:
	callq	_sort
	jmp	LBB19_5
LBB19_4:
	movq	_stack_idx@GOTPCREL(%rip), %rcx
	movq	_stack@GOTPCREL(%rip), %rax
	movq	(%rax), %rdx
	movslq	(%rcx), %rsi
	shlq	$5, %rsi
	addq	%rsi, %rdx
	movq	(%rdx), %rdx
	movl	8(%rdx), %esi
	addl	$1, %esi
	movq	(%rax), %rdx
	movslq	(%rcx), %rdi
	shlq	$5, %rdi
	addq	%rdi, %rdx
	movl	%esi, 8(%rdx)
	movq	(%rax), %rdx
	movslq	(%rcx), %rsi
	shlq	$5, %rsi
	addq	%rsi, %rdx
	movq	(%rdx), %rdi
	movq	(%rax), %rdx
	movslq	(%rcx), %rsi
	shlq	$5, %rsi
	addq	%rsi, %rdx
	movq	16(%rdx), %rsi
	movq	(%rax), %rax
	movslq	(%rcx), %rcx
	shlq	$5, %rcx
	addq	%rcx, %rax
	movl	24(%rax), %edx
	callq	_remove_element
LBB19_5:
	movq	_tick_once@GOTPCREL(%rip), %rax
	movl	$0, (%rax)
LBB19_6:
	movq	-8(%rbp), %rax
	movq	%rax, -32(%rbp)                 ## 8-byte Spill
	callq	_gtk_widget_get_type
	movq	-32(%rbp), %rdi                 ## 8-byte Reload
	movq	%rax, %rsi
	callq	_g_type_check_instance_cast
	movq	%rax, %rdi
	callq	_gtk_widget_queue_draw
	movq	_empty_cells@GOTPCREL(%rip), %rax
	cmpl	$0, (%rax)
	setg	%al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ## -- Begin function draw_grid
LCPI20_0:
	.quad	0x3ff0000000000000              ## double 1
LCPI20_1:
	.quad	0x4008000000000000              ## double 3
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90
_draw_grid:                             ## @draw_grid
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movsd	LCPI20_0(%rip), %xmm0           ## xmm0 = mem[0],zero
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movq	-8(%rbp), %rdi
	callq	_cairo_set_line_width
	movl	$1, -20(%rbp)
LBB20_1:                                ## =>This Inner Loop Header: Depth=1
	movq	_n2@GOTPCREL(%rip), %rcx
	movl	-20(%rbp), %eax
	cmpl	(%rcx), %eax
	jge	LBB20_6
## %bb.2:                               ##   in Loop: Header=BB20_1 Depth=1
	movq	_n@GOTPCREL(%rip), %rcx
	movl	-20(%rbp), %eax
	cltd
	idivl	(%rcx)
	cmpl	$0, %edx
	jne	LBB20_4
## %bb.3:                               ##   in Loop: Header=BB20_1 Depth=1
	jmp	LBB20_5
LBB20_4:                                ##   in Loop: Header=BB20_1 Depth=1
	movq	_y_diff@GOTPCREL(%rip), %rax
	movq	%rax, -40(%rbp)                 ## 8-byte Spill
	movq	-8(%rbp), %rdi
	cvtsi2sdl	-20(%rbp), %xmm1
	movq	_y_diff@GOTPCREL(%rip), %rax
	movsd	(%rax), %xmm0                   ## xmm0 = mem[0],zero
	mulsd	%xmm0, %xmm1
	xorps	%xmm0, %xmm0
	callq	_cairo_move_to
	movq	-40(%rbp), %rax                 ## 8-byte Reload
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %ecx
                                        ## kill: def $rcx killed $ecx
	cvtsi2sd	%rcx, %xmm0
	cvtsi2sdl	-20(%rbp), %xmm1
	mulsd	(%rax), %xmm1
	callq	_cairo_line_to
LBB20_5:                                ##   in Loop: Header=BB20_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB20_1
LBB20_6:
	movl	$1, -24(%rbp)
LBB20_7:                                ## =>This Inner Loop Header: Depth=1
	movq	_n2@GOTPCREL(%rip), %rcx
	movl	-24(%rbp), %eax
	cmpl	(%rcx), %eax
	jge	LBB20_12
## %bb.8:                               ##   in Loop: Header=BB20_7 Depth=1
	movq	_n@GOTPCREL(%rip), %rcx
	movl	-24(%rbp), %eax
	cltd
	idivl	(%rcx)
	cmpl	$0, %edx
	jne	LBB20_10
## %bb.9:                               ##   in Loop: Header=BB20_7 Depth=1
	jmp	LBB20_11
LBB20_10:                               ##   in Loop: Header=BB20_7 Depth=1
	movq	-8(%rbp), %rdi
	cvtsi2sdl	-24(%rbp), %xmm0
	movq	_x_diff@GOTPCREL(%rip), %rax
	movq	%rax, -48(%rbp)                 ## 8-byte Spill
	movsd	(%rax), %xmm1                   ## xmm1 = mem[0],zero
	mulsd	%xmm1, %xmm0
	xorps	%xmm1, %xmm1
	callq	_cairo_move_to
	movq	-48(%rbp), %rax                 ## 8-byte Reload
	movq	-8(%rbp), %rdi
	cvtsi2sdl	-24(%rbp), %xmm0
	movsd	(%rax), %xmm1                   ## xmm1 = mem[0],zero
	mulsd	%xmm1, %xmm0
	movl	-16(%rbp), %eax
                                        ## kill: def $rax killed $eax
	cvtsi2sd	%rax, %xmm1
	callq	_cairo_line_to
LBB20_11:                               ##   in Loop: Header=BB20_7 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB20_7
LBB20_12:
	movq	-8(%rbp), %rdi
	callq	_cairo_stroke
	movsd	LCPI20_1(%rip), %xmm0           ## xmm0 = mem[0],zero
	movq	-8(%rbp), %rdi
	callq	_cairo_set_line_width
	movq	_n@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	movl	%eax, -28(%rbp)
LBB20_13:                               ## =>This Inner Loop Header: Depth=1
	movq	_n2@GOTPCREL(%rip), %rcx
	movl	-28(%rbp), %eax
	cmpl	(%rcx), %eax
	jge	LBB20_16
## %bb.14:                              ##   in Loop: Header=BB20_13 Depth=1
	movq	_y_diff@GOTPCREL(%rip), %rax
	movq	%rax, -56(%rbp)                 ## 8-byte Spill
	movq	-8(%rbp), %rdi
	cvtsi2sdl	-28(%rbp), %xmm1
	movq	_y_diff@GOTPCREL(%rip), %rax
	movsd	(%rax), %xmm0                   ## xmm0 = mem[0],zero
	mulsd	%xmm0, %xmm1
	xorps	%xmm0, %xmm0
	callq	_cairo_move_to
	movq	-56(%rbp), %rax                 ## 8-byte Reload
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %ecx
                                        ## kill: def $rcx killed $ecx
	cvtsi2sd	%rcx, %xmm0
	cvtsi2sdl	-28(%rbp), %xmm1
	mulsd	(%rax), %xmm1
	callq	_cairo_line_to
## %bb.15:                              ##   in Loop: Header=BB20_13 Depth=1
	movq	_n@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	addl	-28(%rbp), %eax
	movl	%eax, -28(%rbp)
	jmp	LBB20_13
LBB20_16:
	movq	_n@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	movl	%eax, -32(%rbp)
LBB20_17:                               ## =>This Inner Loop Header: Depth=1
	movq	_n2@GOTPCREL(%rip), %rcx
	movl	-32(%rbp), %eax
	cmpl	(%rcx), %eax
	jge	LBB20_20
## %bb.18:                              ##   in Loop: Header=BB20_17 Depth=1
	movq	-8(%rbp), %rdi
	cvtsi2sdl	-32(%rbp), %xmm0
	movq	_x_diff@GOTPCREL(%rip), %rax
	movq	%rax, -64(%rbp)                 ## 8-byte Spill
	movsd	(%rax), %xmm1                   ## xmm1 = mem[0],zero
	mulsd	%xmm1, %xmm0
	xorps	%xmm1, %xmm1
	callq	_cairo_move_to
	movq	-64(%rbp), %rax                 ## 8-byte Reload
	movq	-8(%rbp), %rdi
	cvtsi2sdl	-32(%rbp), %xmm0
	movsd	(%rax), %xmm1                   ## xmm1 = mem[0],zero
	mulsd	%xmm1, %xmm0
	movl	-16(%rbp), %eax
                                        ## kill: def $rax killed $eax
	cvtsi2sd	%rax, %xmm1
	callq	_cairo_line_to
## %bb.19:                              ##   in Loop: Header=BB20_17 Depth=1
	movq	_n@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	addl	-32(%rbp), %eax
	movl	%eax, -32(%rbp)
	jmp	LBB20_17
LBB20_20:
	movq	-8(%rbp), %rdi
	callq	_cairo_stroke
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ## -- Begin function print_grid
LCPI21_0:
	.quad	0x4000000000000000              ## double 2
LCPI21_1:
	.quad	0x3fe0000000000000              ## double 0.5
LCPI21_2:
	.quad	0x3ff0000000000000              ## double 1
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90
_print_grid:                            ## @print_grid
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$112, %rsp
	movq	%rdi, -8(%rbp)
	movsd	%xmm0, -16(%rbp)
	movq	-8(%rbp), %rdi
	movsd	-16(%rbp), %xmm0                ## xmm0 = mem[0],zero
	callq	_cairo_set_font_size
	movl	$0, -76(%rbp)
LBB21_1:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB21_3 Depth 2
	movq	_n2@GOTPCREL(%rip), %rcx
	movl	-76(%rbp), %eax
	cmpl	(%rcx), %eax
	jge	LBB21_13
## %bb.2:                               ##   in Loop: Header=BB21_1 Depth=1
	movl	$0, -80(%rbp)
LBB21_3:                                ##   Parent Loop BB21_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	_n2@GOTPCREL(%rip), %rcx
	movl	-80(%rbp), %eax
	cmpl	(%rcx), %eax
	jge	LBB21_11
## %bb.4:                               ##   in Loop: Header=BB21_3 Depth=2
	movl	-76(%rbp), %edi
	movl	-80(%rbp), %esi
	callq	_element
	cmpl	$1, %eax
	jge	LBB21_6
## %bb.5:                               ##   in Loop: Header=BB21_3 Depth=2
	jmp	LBB21_10
LBB21_6:                                ##   in Loop: Header=BB21_3 Depth=2
	leaq	-20(%rbp), %rax
	movq	%rax, -104(%rbp)                ## 8-byte Spill
	movl	-76(%rbp), %edi
	movl	-80(%rbp), %esi
	callq	_element
	movq	-104(%rbp), %rdi                ## 8-byte Reload
	movl	%eax, %r8d
	xorl	%esi, %esi
	movl	$4, %edx
	leaq	L_.str.3(%rip), %rcx
	movb	$0, %al
	callq	___sprintf_chk
	leaq	-20(%rbp), %rsi
	movq	-8(%rbp), %rdi
	leaq	-72(%rbp), %rdx
	callq	_cairo_text_extents
	movsd	LCPI21_0(%rip), %xmm2           ## xmm2 = mem[0],zero
	movsd	LCPI21_1(%rip), %xmm3           ## xmm3 = mem[0],zero
	movq	_y_diff@GOTPCREL(%rip), %rax
	movq	_x_diff@GOTPCREL(%rip), %rcx
	movsd	(%rcx), %xmm0                   ## xmm0 = mem[0],zero
	cvtsi2sdl	-80(%rbp), %xmm1
	addsd	%xmm3, %xmm1
	mulsd	%xmm1, %xmm0
	subsd	-72(%rbp), %xmm0
	movsd	-56(%rbp), %xmm1                ## xmm1 = mem[0],zero
	divsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -88(%rbp)
	movsd	(%rax), %xmm0                   ## xmm0 = mem[0],zero
	cvtsi2sdl	-76(%rbp), %xmm1
	addsd	%xmm3, %xmm1
	mulsd	%xmm1, %xmm0
	subsd	-64(%rbp), %xmm0
	movsd	-48(%rbp), %xmm1                ## xmm1 = mem[0],zero
	divsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)
	movl	-76(%rbp), %edi
	movl	-80(%rbp), %esi
	callq	_is_given
	cmpl	$0, %eax
	je	LBB21_8
## %bb.7:                               ##   in Loop: Header=BB21_3 Depth=2
	movq	-8(%rbp), %rdi
	xorps	%xmm2, %xmm2
	movaps	%xmm2, %xmm0
	movaps	%xmm2, %xmm1
	callq	_cairo_set_source_rgb
	jmp	LBB21_9
LBB21_8:                                ##   in Loop: Header=BB21_3 Depth=2
	movsd	LCPI21_2(%rip), %xmm2           ## xmm2 = mem[0],zero
	movq	-8(%rbp), %rdi
	xorps	%xmm1, %xmm1
	movaps	%xmm1, %xmm0
	callq	_cairo_set_source_rgb
LBB21_9:                                ##   in Loop: Header=BB21_3 Depth=2
	movq	-8(%rbp), %rdi
	movsd	-88(%rbp), %xmm0                ## xmm0 = mem[0],zero
	movsd	-96(%rbp), %xmm1                ## xmm1 = mem[0],zero
	callq	_cairo_move_to
	leaq	-20(%rbp), %rsi
	movq	-8(%rbp), %rdi
	callq	_cairo_show_text
LBB21_10:                               ##   in Loop: Header=BB21_3 Depth=2
	movl	-80(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -80(%rbp)
	jmp	LBB21_3
LBB21_11:                               ##   in Loop: Header=BB21_1 Depth=1
	jmp	LBB21_12
LBB21_12:                               ##   in Loop: Header=BB21_1 Depth=1
	movl	-76(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -76(%rbp)
	jmp	LBB21_1
LBB21_13:
	addq	$112, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Memory allocation error! size = %d * %zu\n"

	.comm	_grid_,8,3                      ## @grid_
	.comm	_n2,4,2                         ## @n2
	.comm	_empty_cells,4,2                ## @empty_cells
	.comm	_n,4,2                          ## @n
L_.str.1:                               ## @.str.1
	.asciz	"r"

L_.str.2:                               ## @.str.2
	.asciz	"Input file not found!\n"

L_.str.3:                               ## @.str.3
	.asciz	"%d"

L_.str.4:                               ## @.str.4
	.asciz	"Read\n"

	.comm	_stack_idx,4,2                  ## @stack_idx
	.comm	_stack,8,3                      ## @stack
L_.str.5:                               ## @.str.5
	.asciz	"../sudoku_hard.txt"

	.comm	_FPS,4,2                        ## @FPS
L_.str.6:                               ## @.str.6
	.asciz	"activate"

	.comm	_x_diff,8,3                     ## @x_diff
	.comm	_y_diff,8,3                     ## @y_diff
	.comm	_will_tick,4,2                  ## @will_tick
	.comm	_tick_once,4,2                  ## @tick_once
L_.str.7:                               ## @.str.7
	.asciz	"Sudoku Solver"

L_.str.8:                               ## @.str.8
	.asciz	"draw"

L_.str.9:                               ## @.str.9
	.asciz	"button-release-event"

L_.str.10:                              ## @.str.10
	.asciz	"key_release_event"

L_.str.11:                              ## @.str.11
	.asciz	"grid[%d][%d]\telement: %d\tavailable_n: %d\tavailables: "

L_.str.12:                              ## @.str.12
	.asciz	"%d "

L_.str.13:                              ## @.str.13
	.asciz	"\n"

.subsections_via_symbols
