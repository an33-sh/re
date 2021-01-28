BITS 32

extern printf
extern scanf

section .data
	c:db "%s",0
	output:db "%c",10,0
	null:db "\0"

section .text
	global main
	
	main:
	push ebp
	mov ebp, esp
	sub esp, 0x10

	lea eax, [ebp-0x4]
	push eax
	push c
	call scanf
	call letter

	letter:
	mov cl, byte [ebp-0x4]
	call print
	cmp cl, 0
	jz end	
	inc byte [ebp-0x4]
	jmp letter
	

	print:
	push ecx
	push output
	call printf

	end:
	leave 
	ret
	
