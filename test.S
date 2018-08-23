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

	.section ".note.gnu.property", "a"
#ifdef __LP64__
	.p2align 3
#else
	.p2align 2
#endif
	.long 1f - 0f		/* name length.  */
	.long 3f - 1f		/* data length.  */
	/* NT_GNU_PROPERTY_TYPE_0 */
	.long 5			/* note type.  */
0:
	.asciz "GNU"		/* vendor name.  */
1:
#ifdef __LP64__
	.p2align 3
#else
	.p2align 2
#endif
	.long 0			/* pr_type.  */
	.long 5f - 4f		/* pr_datasz.  */
4:
	.zero 0x4000
5:
#ifdef MULTIPLE_NOTE
# ifdef __LP64__
	.p2align 3
# else
	.p2align 2
# endif
3:

	.section ".note.gnu.property", "a"
# ifdef __LP64__
	.p2align 3
# else
	.p2align 2
# endif
	.long 1f - 0f		/* name length.  */
	.long 3f - 1f		/* data length.  */
	/* NT_GNU_PROPERTY_TYPE_0 */
	.long 5			/* note type.  */
0:
	.asciz "GNU"		/* vendor name.  */
1:
#endif
#ifdef __LP64__
	.p2align 3
#else
	.p2align 2
#endif
	/* GNU_PROPERTY_X86_FEATURE_1_AND */
	.long 0xc0000002	/* pr_type.  */
	.long 5f - 4f		/* pr_datasz.  */
4:
	.long 0x3
5:
#ifdef __LP64__
	.p2align 3
#else
	.p2align 2
#endif
3:
