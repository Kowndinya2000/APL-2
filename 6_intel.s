	.file	"6.c"
	.intel_syntax noprefix
	.text
	.globl	fun
	.type	fun, @function
fun:
.LFB0:
	.cfi_startproc
	push	rbp     ; previous function's base address is being pushed into the current stack
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp  ; rbp <- rsp
	.cfi_def_cfa_register 6
	push	rbx    ; previous function's base address is being pushed into the current stack
	sub	rsp, 24  ; rsp <- 24
	.cfi_offset 3, -24
	mov	DWORD PTR -20[rbp], edi ; DWORD PTR -20[rbp] <- edi
	cmp	DWORD PTR -20[rbp], 0   ;
	je	.L2
	cmp	DWORD PTR -20[rbp], 1   ;
	jne	.L3
.L2:
	mov	eax, DWORD PTR -20[rbp] ; eax <- DWORD PTR -20[rbp]
	jmp	.L4
.L3:
	mov	eax, DWORD PTR -20[rbp] ; eax <- DWORD PTR -20[rbp]
	sub	eax, 1                  ; eax <- eax - 1
	mov	edi, eax                ; edi <- eax
	call	fun                   ; funcion is being called
	mov	ebx, eax                ; ebx <- eax
	mov	eax, DWORD PTR -20[rbp] ; eax <- DWORD PTR -20[rbp]
	sub	eax, 2                  ; eax <- 2
	mov	edi, eax                ; edi <- eax
	call	fun                   ; function is being called as part of recursion
	add	eax, ebx                ; eax <- eax + ebx
.L4:
	add	rsp, 24                 ; rsp <- rsp + 24
	pop	rbx                     ; current address (rbx) is being removed
	pop	rbp                     ; current address (rbp) is being removed
	.cfi_def_cfa 7, 8
	ret                         ;
	.cfi_endproc
.LFE0:
	.size	fun, .-fun
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	push	rbp                ; previous function's base address is being pushed into the current stack
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp            ; rbp <- rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16             ; rsp <- rsp -16
	mov	DWORD PTR -4[rbp], 2; DWORD PTR -4[rbp] <- 2
	mov	eax, DWORD PTR -4[rbp]; eax<-  DWORD PTR -4[rbp]
	mov	edi, eax             ; edi <- eax
	call	fun                ; function is being called from the main function
	mov	eax, 0               ; eax <- 0
	leave                    ; this instruction copies the frame pointer( in EBP register) into stack pointer register (ESP) which releases the stack space allocated to the stack frame
	.cfi_def_cfa 7, 8
	ret                      ; this instruction transfers control to the return address located on the stack
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
