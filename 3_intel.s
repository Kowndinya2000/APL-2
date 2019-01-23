	.file	"3.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp               ; previous function's base address is being pushed into the current stack
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp           ; rbp <- rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48            ; rsp <- rsp -48
	mov	rax, QWORD PTR fs:40; rax <- QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax ; QWORD PTR -8[rbp] <- rax
	xor	eax, eax            ; eax <- 0
	mov	DWORD PTR -32[rbp], 1 ; 	DWORD PTR -32[rbp] <- 1
	mov	DWORD PTR -28[rbp], 2 ; 	DWORD PTR -28[rbp] <- 1
	mov	DWORD PTR -24[rbp], 3 ; 	DWORD PTR -24[rbp] <- 1
	mov	DWORD PTR -20[rbp], 4 ; 	DWORD PTR -20[rbp] <- 1
	mov	DWORD PTR -16[rbp], 5 ; 	DWORD PTR -16[rbp] <- 1
	mov	DWORD PTR -36[rbp], 0 ; 	DWORD PTR -36[rbp] <- 1
	jmp	.L2
.L3:
	mov	eax, DWORD PTR -36[rbp] ; eax <- DWORD PTR -36[rbp]
	cdqe
	mov	eax, DWORD PTR -32[rbp+rax*4] ; eax <- DWORD PTR -32[rbp+rax*4]
	lea	edx, 1[rax]                 ; loading pointer (1[rax]) into the register(edx)
	mov	eax, DWORD PTR -36[rbp]       ; eax <- DWORD PTR -36[rbp]
	cdqe
	mov	DWORD PTR -32[rbp+rax*4], ; edx <- DWORD PTR -32[rbp+rax*4]
	add	DWORD PTR -36[rbp], 1     ; DWORD PTR -36[rbp] <-  DWORD PTR -36[rbp] + 1
.L2:
	cmp	DWORD PTR -36[rbp], 4     ;
	jle	.L3
	mov	eax, 0                    ; eax <- 0
	mov	rcx, QWORD PTR -8[rbp]    ; rcx <- QWORD PTR -8[rbp]
	xor	rcx, QWORD PTR fs:40      ; rcx <- rcx xor QWORD PTR fs:40
	je	.L5
	call	__stack_chk_fail@PLT
.L5:
	leave                        ; this instruction copies the frame pointer( in EBP register) into stack pointer register (ESP) which releases the stack space allocated to the stack frame
	.cfi_def_cfa 7, 8
	ret                          ; this instruction transfers control to the return address located on the stack
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
