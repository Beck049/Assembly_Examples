INCLUDE Irvine32.inc

.data
b sdword 1, 2, 3, 4, 10, 20, 30, 40, 50, 60, 70, 80
num sdword 10
i dword ?
.code
main PROC
	mov ecx, num
	mov esi, offset b
l1:
	inc dword ptr [esi]
	add esi, 4
	loop l1
	mov esi, offset b
	mov ecx, num
l2:
	mov eax, [esi]
	call writeint
	call crlf
	add esi, 4
	loop l2
	exit
main ENDP

END main