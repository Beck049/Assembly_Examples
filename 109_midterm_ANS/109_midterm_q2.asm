INCLUDE Irvine32.inc

.data
str1 byte "1234 ABCD abcdefg", 0
.code
main PROC
	mov esi, offset str1
	mov ax, 0
	mov bl, 0
l1:
	mov cl, [esi]
	cmp cl, 0
	jz l5
	cmp cl, '0'
	jb l2
	cmp cl, '9'
	ja l3
	inc bl
	jmp l2
l3:
	cmp cl, 'A'
	jb l2
	cmp cl, 'Z'
	ja l4
	inc al
	jmp l2
l4:
	cmp cl, 'a'
	jb l2
	cmp cl, 'z'
	ja l2
	inc ah
l2:
	inc esi
	jmp l1
l5:
	call dumpregs
	exit
main ENDP

END main