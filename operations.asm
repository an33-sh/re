BITS 32

extern printf
extern scanf

section .data
	fmt: db "%d",0
	sum: db "sum is %d",10,0
	difference: db "difference is %d",10,0
	product: db "product is %d",10,0
	divide:db "qoutient is %d",10,0
	remainder:db "remainder is %d",10,0
section .text
	global main
	
	main:
	push ebp
	mov ebp,esp

	lea eax, [ebp-0x4]
	push eax
	push fmt
	call scanf

	lea edx, [ebp-0x8]
	push edx
	push fmt
	call scanf 
	
	mov ebx, dword [ebp-0x4]
	mov eax, dword [ebp-0x8]
	add eax, ebx

	push eax
	push sum
	call printf
	
	mov ebx, dword [ebp-0x4]
	mov eax, dword [ebp-0x8]
	sub ebx,eax

	push ebx
	push difference
	call printf

	mov ebx, dword [ebp-0x4]
	mov eax, dword [ebp-0x8]
	mul ebx
	
	push eax
	push product
	call printf

	mov edx, 0
	mov eax, dword [ebp-0x4]
	mov ecx, dword [ebp-0x8]
	div ecx
	mov ebx, edx

	push eax
	push divide
	call printf

	push ebx
	push remainder
	call printf

	leave
	ret
