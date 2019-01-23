	.file	"1.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp                  ; previous function's base address is being pushed into the current stack
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp               ; rbp <- rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR -24[rbp], 2  ; rbp <- 2
	mov	DWORD PTR -20[rbp], 3  ; rbp <- 3
	mov	edx, DWORD PTR -24[rbp]; edx <- 2
	mov	eax, DWORD PTR -20[rbp]; edx <- 3
	add	eax, edx               ; eax <- eax + edx
	mov	DWORD PTR -16[rbp], eax; rbp <- eax
	mov	eax, DWORD PTR -24[rbp]; eax <- -24[rbp]
	sub	eax, DWORD PTR -20[rbp]; eax <- eax - -20[rbp]
	mov	DWORD PTR -12[rbp], eax; -12[rbp] <- eax
	mov	eax, DWORD PTR -24[rbp]; eax <- -24[rbp]
	cdq                        
	idiv	DWORD PTR -20[rbp]   ; -20[rbp] <- -20[rbp]/-20[rbp]
	mov	DWORD PTR -8[rbp], eax ; -8[rbp] <- eax
	mov	eax, DWORD PTR -24[rbp]; eax <- -24[rbp]
	imul	eax, DWORD PTR -20[rbp];eax <- eax * -20[rbp]
	mov	DWORD PTR -4[rbp], eax ; -4[rbp] <- eax
	mov	eax, 0                 ; eax <- 0
	pop	rbp                    ; restoring whatever is on the top of the stack into the register
	.cfi_def_cfa 7, 8
	ret                        ; this instruction transfers control to the return address located on the stack
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
