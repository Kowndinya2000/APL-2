	.file	"5.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp         ; previous function's base address is being pushed into the current stack
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp      ; rbp <- rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32       ; rsp <- 32
	mov	rax, QWORD PTR fs:40;	rax <- QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax; QWORD PTR -8[rbp] <- rax
	xor	eax, eax               ; eax <- 0
	mov	DWORD PTR -20[rbp], 1  ; DWORD PTR -20[rbp] <- 1
	mov	DWORD PTR -16[rbp], 2  ; DWORD PTR -16[rbp] <- 2
	mov	DWORD PTR -12[rbp], 3  ; DWORD PTR -12[rbp] <- 3
	mov	eax, DWORD PTR -20[rbp]; eax <- DWORD PTR -20[rbp]
	mov	DWORD PTR -32[rbp], eax; DWORD PTR -32[rbp] <- eax
	mov	eax, DWORD PTR -32[rbp]; eax <- DWORD PTR -32[rbp]
	mov	DWORD PTR -28[rbp], eax; DWORD PTR -28[rbp] <- eax
	mov	DWORD PTR -24[rbp], 0  ; DWORD PTR -24[rbp] <- 0
	jmp	.L2
.L5:
	mov	eax, DWORD PTR -24[rbp] ; eax <- DWORD PTR -24[rbp]
	cdqe
	mov	eax, DWORD PTR -20[rbp+rax*4] ; eax <- DWORD PTR -20[rbp+rax*4]
	cmp	DWORD PTR -32[rbp], eax       ;
	jle	.L3
	mov	eax, DWORD PTR -24[rbp]       ; eax <- DWORD PTR -24[rbp]
	cdqe
	mov	eax, DWORD PTR -20[rbp+rax*4] ; eax <- DWORD PTR -20[rbp+rax*4]
	mov	DWORD PTR -32[rbp], eax       ; DWORD PTR -32[rbp] <- eax
.L3:
	mov	eax, DWORD PTR -24[rbp]       ; eax <- DWORD PTR -24[rbp]
	cdqe
	mov	eax, DWORD PTR -20[rbp+rax*4] ; eax <- DWORD PTR -20[rbp+rax*4]
	cmp	DWORD PTR -28[rbp], eax       ;
	jge	.L4
	mov	eax, DWORD PTR -24[rbp]       ; eax <- DWORD PTR -24[rbp]
	cdqe
	mov	eax, DWORD PTR -20[rbp+rax*4] ; eax <- DWORD PTR -20[rbp+rax*4]
	mov	DWORD PTR -28[rbp], eax       ; DWORD PTR -28[rbp] <- eax
.L4:
	add	DWORD PTR -24[rbp], 1         ; DWORD PTR -24[rbp] < -DWORD PTR -24[rbp] + 1
.L2:
	cmp	DWORD PTR -24[rbp], 2
	jle	.L5
	mov	eax, 0                        ; eax <- 0
	mov	rdx, QWORD PTR -8[rbp]        ; rdx <- QWORD PTR -8[rbp]
	xor	rdx, QWORD PTR fs:40          ; rdx <- rdx xor QWORD PTR fs:40
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leave                             ; this instruction copies the frame pointer( in EBP register) into stack pointer register (ESP) which releases the stack space allocated to the stack frame
	.cfi_def_cfa 7, 8
	ret                              ; this instruction transfers control to the return address located on the stack
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
