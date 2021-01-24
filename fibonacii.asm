BITS 32

extern printf
extern scanf

section .data
	d: db "%d",0
	fib:db "%d th fibonacii is %d",10,0

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

	mov eax, dword [ebp-0x4]
	cmp eax, 0
	jz f0
	cmp eax, 1
	jz f1
	lea edx, dword [ebp-0x8]
	mov edx, 1
	mov ebx, 0
	mov ecx, 1
	cmp eax, 1
	jg fibno
	
	fibno:
	mov edx, ecx
	add ecx, ebx
	mov ebx, edx
	mov edx, dword [ebp-0x8]
	add edx, 1
	cmp eax, edx
	jz f
	jmp fibno
	

	f:
	mov eax, dword [ebp-0x4]
	push ecx
	push eax
	push fib
	call printf
	call end

	f0:
	mov eax, dword [ebp-0x4]
	mov ebx,0
	push ebx
	push eax
	push fib
	call printf
	call end


	f1:
	mov eax, dword [ebp-0x4]
        mov ebx,1
        push ebx
	push eax
        push fib
        call printf
	call end

	end:
	leave
	ret
