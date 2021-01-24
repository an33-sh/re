BITS 32

extern printf
extern scanf

section .data
	d:db "%d",0
	output: db "factorial is %d",10,0

section .text
	global main

	main:
	push ebp
	mov ebp, esp
	sub esp, 0x10


	lea eax, [ebp-0x4]
	push eax
	push d
	call scanf

	mov ebx, dword [ebp-0x4]
	mov eax, 1
	mov ecx, 1
	call facto


	facto:
	mul ecx
	cmp ecx, ebx
	jz end
	add ecx, 1
	jmp facto

	end:
	push eax
	push output
	call printf
	leave
	ret

