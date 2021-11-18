INCLUDE Irvine32.inc

.data
NUM1 DWORD 00001234H, 56780000H
NUM2 DWORD 0ABCD0000H, 0EF123456H
NUM3 DWORD 3 DUP (?)
.code
main PROC
	mov eax, num1
	add eax, num2
	mov num3, eax
	mov eax, num1 + 4
	adc eax, num2 + 4
	mov num3 + 4, eax
	mov num3 + 8, 0
	jnc l1;
	mov num3 + 8, 1
l1:
	mov eax, num3
	call writehex
	call crlf
	mov eax, num3 + 4
	call writehex
	call crlf
	mov eax, num3 + 8
	call writehex
	exit
main ENDP

END main