	.arch armv8-a
	.file	"decomment.c"
	.text
	.align	2
	.global	handleStartState
	.type	handleStartState, %function
handleStartState:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L2
	mov	w0, 1
	str	w0, [sp, 44]
	b	.L3
.L2:
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L4
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 4
	str	w0, [sp, 44]
	b	.L3
.L4:
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L5
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 7
	str	w0, [sp, 44]
	b	.L3
.L5:
	ldr	w0, [sp, 28]
	bl	putchar
	str	wzr, [sp, 44]
.L3:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	handleStartState, .-handleStartState
	.align	2
	.global	handleMightBeCommentState
	.type	handleMightBeCommentState, %function
handleMightBeCommentState:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L8
	mov	w0, 32
	bl	putchar
	mov	w0, 2
	str	w0, [sp, 44]
	b	.L9
.L8:
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L10
	mov	w0, 47
	bl	putchar
	mov	w0, 1
	str	w0, [sp, 44]
	b	.L9
.L10:
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L11
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 4
	str	w0, [sp, 44]
	b	.L9
.L11:
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L12
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 7
	str	w0, [sp, 44]
	b	.L9
.L12:
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 28]
	bl	putchar
	str	wzr, [sp, 44]
.L9:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	handleMightBeCommentState, .-handleMightBeCommentState
	.align	2
	.global	handleCommentState
	.type	handleCommentState, %function
handleCommentState:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L15
	mov	w0, 3
	str	w0, [sp, 44]
	b	.L16
.L15:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L17
	mov	w0, 10
	bl	putchar
	mov	w0, 2
	str	w0, [sp, 44]
	b	.L16
.L17:
	mov	w0, 2
	str	w0, [sp, 44]
.L16:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2:
	.size	handleCommentState, .-handleCommentState
	.align	2
	.global	handleMightEndCommentState
	.type	handleMightEndCommentState, %function
handleMightEndCommentState:
.LFB3:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L20
	mov	w0, 3
	str	w0, [sp, 44]
	b	.L21
.L20:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L22
	mov	w0, 10
	bl	putchar
	mov	w0, 2
	str	w0, [sp, 44]
	b	.L21
.L22:
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L23
	str	wzr, [sp, 44]
	b	.L21
.L23:
	mov	w0, 2
	str	w0, [sp, 44]
.L21:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3:
	.size	handleMightEndCommentState, .-handleMightEndCommentState
	.align	2
	.global	handleStartOfQuotationState
	.type	handleStartOfQuotationState, %function
handleStartOfQuotationState:
.LFB4:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 92
	bne	.L26
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 5
	str	w0, [sp, 44]
	b	.L27
.L26:
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L28
	ldr	w0, [sp, 28]
	bl	putchar
	str	wzr, [sp, 44]
	b	.L27
.L28:
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 4
	str	w0, [sp, 44]
.L27:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4:
	.size	handleStartOfQuotationState, .-handleStartOfQuotationState
	.align	2
	.global	handleStartOfSingleQuotationState
	.type	handleStartOfSingleQuotationState, %function
handleStartOfSingleQuotationState:
.LFB5:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 92
	bne	.L31
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 6
	str	w0, [sp, 44]
	b	.L32
.L31:
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L33
	ldr	w0, [sp, 28]
	bl	putchar
	str	wzr, [sp, 44]
	b	.L32
.L33:
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 7
	str	w0, [sp, 44]
.L32:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5:
	.size	handleStartOfSingleQuotationState, .-handleStartOfSingleQuotationState
	.align	2
	.global	handleBackslashState
	.type	handleBackslashState, %function
handleBackslashState:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	mov	w0, 4
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	bl	putchar
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE6:
	.size	handleBackslashState, .-handleBackslashState
	.align	2
	.global	handleBackslashSingleState
	.type	handleBackslashSingleState, %function
handleBackslashSingleState:
.LFB7:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	mov	w0, 7
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	bl	putchar
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE7:
	.size	handleBackslashSingleState, .-handleBackslashSingleState
	.section	.rodata
	.align	3
.LC0:
	.string	"Error: line %d: unterminated comment\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB8:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	mov	w0, 1
	str	w0, [sp, 28]
	str	wzr, [sp, 24]
	str	wzr, [sp, 20]
	b	.L40
.L51:
	ldr	w0, [sp, 16]
	cmp	w0, 10
	bne	.L41
	ldr	w0, [sp, 28]
	add	w0, w0, 1
	str	w0, [sp, 28]
.L41:
	ldr	w0, [sp, 20]
	cmp	w0, 7
	beq	.L42
	ldr	w0, [sp, 20]
	cmp	w0, 7
	bhi	.L40
	ldr	w0, [sp, 20]
	cmp	w0, 6
	beq	.L43
	ldr	w0, [sp, 20]
	cmp	w0, 6
	bhi	.L40
	ldr	w0, [sp, 20]
	cmp	w0, 5
	beq	.L44
	ldr	w0, [sp, 20]
	cmp	w0, 5
	bhi	.L40
	ldr	w0, [sp, 20]
	cmp	w0, 4
	beq	.L45
	ldr	w0, [sp, 20]
	cmp	w0, 4
	bhi	.L40
	ldr	w0, [sp, 20]
	cmp	w0, 3
	beq	.L46
	ldr	w0, [sp, 20]
	cmp	w0, 3
	bhi	.L40
	ldr	w0, [sp, 20]
	cmp	w0, 2
	beq	.L47
	ldr	w0, [sp, 20]
	cmp	w0, 2
	bhi	.L40
	ldr	w0, [sp, 20]
	cmp	w0, 0
	beq	.L48
	ldr	w0, [sp, 20]
	cmp	w0, 1
	beq	.L49
	b	.L40
.L48:
	ldr	w0, [sp, 16]
	bl	handleStartState
	str	w0, [sp, 20]
	b	.L40
.L49:
	ldr	w0, [sp, 16]
	bl	handleMightBeCommentState
	str	w0, [sp, 20]
	ldr	w0, [sp, 20]
	cmp	w0, 2
	bne	.L40
	ldr	w0, [sp, 28]
	str	w0, [sp, 24]
	b	.L40
.L47:
	ldr	w0, [sp, 16]
	bl	handleCommentState
	str	w0, [sp, 20]
	b	.L40
.L46:
	ldr	w0, [sp, 16]
	bl	handleMightEndCommentState
	str	w0, [sp, 20]
	b	.L40
.L45:
	ldr	w0, [sp, 16]
	bl	handleStartOfQuotationState
	str	w0, [sp, 20]
	b	.L40
.L42:
	ldr	w0, [sp, 16]
	bl	handleStartOfSingleQuotationState
	str	w0, [sp, 20]
	b	.L40
.L44:
	ldr	w0, [sp, 16]
	bl	handleBackslashState
	str	w0, [sp, 20]
	b	.L40
.L43:
	ldr	w0, [sp, 16]
	bl	handleBackslashSingleState
	str	w0, [sp, 20]
	nop
.L40:
	bl	getchar
	str	w0, [sp, 16]
	ldr	w0, [sp, 16]
	cmn	w0, #1
	bne	.L51
	ldr	w0, [sp, 20]
	cmp	w0, 1
	bne	.L52
	mov	w0, 47
	bl	putchar
.L52:
	ldr	w0, [sp, 20]
	cmp	w0, 2
	beq	.L53
	ldr	w0, [sp, 20]
	cmp	w0, 3
	bne	.L54
.L53:
	adrp	x0, stderr
	add	x0, x0, :lo12:stderr
	ldr	x3, [x0]
	ldr	w2, [sp, 24]
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	mov	x0, x3
	bl	fprintf
	mov	w0, 1
	bl	exit
.L54:
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.4.1 20231218 (Red Hat 11.4.1-3)"
	.section	.note.GNU-stack,"",@progbits
