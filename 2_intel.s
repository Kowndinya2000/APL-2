	.file	"2.c"
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
	mov	rbp, rsp            ; rbp <- rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32             ; rsp <- rsp -32
	mov	rax, QWORD PTR fs:40; rax <- QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax  ; QWORD PTR -8[rbp] <- rax
	xor	eax, eax                ; eax <- 0
	mov	DWORD PTR -24[rbp], 2   ; DWORD PTR -24[rbp] <- 2
	mov	DWORD PTR -20[rbp], 3   ; DWORD PTR -20[rbp] <- 3
	lea	rax, -24[rbp]           ; loading pointer (-24[rbp]) into the register(rax)
	mov	QWORD PTR -16[rbp], rax ;QWORD PTR -16 [rbp] <- rax
	mov	eax, DWORD PTR -20[rbp] ; eax <- DWORD PTR -20[rbp]
	mov	DWORD PTR -24[rbp], eax ; DWORD PTR -24[rbp] <- eax
	mov	rax, QWORD PTR -16[rbp] ; rax <- QWORD PTR -16[rbp]
	mov	eax, DWORD PTR [rax]    ; eax <- DWORD PTR [rax]
	mov	DWORD PTR -20[rbp], eax ; DWORD PTR -20[rbp] <- eax
	mov	eax, 0                  ; eax <- 0
	mov	rdx, QWORD PTR -8[rbp]  ; rdx <- QWORD PTR -8[rbp]
	xor	rdx, QWORD PTR fs:40    ; rdx <- rdx xor QWORD PTR fs:40
	je	.L3
	call	__stack_chk_fail@PLT
.L3:
	leave                      ; this instruction copies the frame pointer( in EBP register) into stack pointer register (ESP) which releases the stack space allocated to the stack frame
	.cfi_def_cfa 7, 8
	ret                        ; this instruction transfers control to the return address located on the stack
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
