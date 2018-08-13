#include <syscall.h>

	.text
	.globl	main
	.type	main, @function
main:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	$foo, %rdi
	call	*%rdi
	movl	$SYS_exit, %edi
	xorl	%esi, %esi
	call	syscall
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
	.size	main, .-main
	.p2align 4,,15
	.type	foo, @function
foo:
	.cfi_startproc
	ret
	.cfi_endproc
	.size	foo, .-foo
