BITS 32

extern printf
extern scanf

section .data
	fmt: db "%d",0
	d: db "%d",10,0
	output: db " %d is prime ",10,0
	output2: db " %d is not prime",10,0
	output3: db "neither nor prime",10,0

section .text
	global main

	main:
	push ebp
	mov ebp, esp
	sub esp, 0x10
	
	lea eax, [ebp-0x4]
	push eax
	push fmt
	call scanf

	mov eax, dword [ebp-0x4]
	sub eax, 1
	mov ebx, eax
	push ebx
	push d
	call printf

	mov eax, dword [ebp-0x4]
	mov ecx, 2
	cmp eax, 0
	jl not
	cmp eax, 1
	jz l1
	cmp eax, 2
	jz is
	cmp eax, 2
	jg prime

	prime:
	mov edx, 0
	mov eax, dword [ebp-0x4]
	div ecx
	cmp edx, 0
	jz not
	cmp ecx, ebx
	jz is
	add ecx, 1
	jmp prime

	is:
	push dword [ebp-0x4]
	push output
	call printf
	call end
	
	l1:
	push output3
	call printf
 	call end

	not:
	push ecx
	push d
	call printf

	mov eax, dword [ebp-0x4]
	push eax
	push output2
	call printf
	call end

	end:
	leave
	ret
