TITLE HW01 : ArrarSum

; 詢問陣列的列數和行數
; 依序由第一列起輸入兩個陣列各元素的值 (有正負號數)
; 顯示兩個陣列的內容，各數值間須有空格，兩列間應換行
; 計算各元素的和
; 顯示結果

INCLUDE Irvine32.inc

SPACE = 32

.data
    strr BYTE "Please enter the row : ", 0
    strc BYTE "Please enter the column : ", 0
    str1 BYTE "Please enter 1st 2D-array:", 0dh, 0ah, 0
    str2 BYTE "Please enter 2nd 2D-array:", 0dh, 0ah, 0
    space BYTE " ", 0
    arr1 SWORD 128 DUP(?)  ; 128 BYTE not init
    arr2 SWORD 128 DUP(?)

.code

main PROC

    call Clrscr

; Do The Input of ROW & COL
    mov  edx, OFFSET strr
    call WriteString    ; write element in edx as the form of String

    call ReadInt        ; read a integer to EAX
    call Crlf
    mov  ecx, eax       ; use EBX to save the row
    mov  ebx, eax

    mov  edx, OFFSET strc
    call WriteString
    call ReadInt
    call Crlf
    mov  ebx, eax       ; use ECX to save the column
    mul  ecx            ; check the OF

    ; ecx = the number of the element in total
    ; ebx = the number of the element in the row

; Input the Elements in the 1st 2D-Array
    mov  edx, OFFSET str1
    call WriteString    ; write the question
    mov  esi, OFFSET arr1
    mov  edx, ecx       ; temp save ecx_value in edx
L1:
    call ReadInt
    call Crlf
    mov  [esi], eax
    add  esi, TYPE SWORD; go to next number
    loop L1

    mov  ecx = edx      ; send origin ecx_value back

; Input the Elements in the 2nd 2D-Array
    mov  edx, OFFSET str2
    call WriteString    ; write the question
    mov  esi, OFFSET arr2
    mov  edx, ecx       ; temp save ecx_value in edx
L2:
    call ReadInt
    call Crlf
    mov  [esi], eax
    add  esi, TYPE SWORD; go to next number
    loop L2

    mov  ecx, edx       ; send origin ecx_value back

; Print Out the 1st 2D-Array
    mov  esi, OFFSET arr1
    mov  edx, ecx       ; temp save ecx_value in edx (all)
    mov  edi, ebx       ; temp save ebx_value in edi (col)
L3:
    MOVZX  eax, [esi]
    call WriteDec
    mov  al, SPACE
    call WriteChar

    add  esi, TYPE SWORD
    dec  ebx

    ; check endl for every (ebx) integers
    .IF ebx == 0
        call Clrscr
        mov ebx, edi    ; return the original ebx value
    .ENDF

    loop L3

    mov  ecx, edx
    call Clrscr
    call Clrscr

; Print Out the 2nd 2D-Array
    mov  esi, OFFSET arr2
    mov  edx, ecx       ; temp save ecx_value in edx (all)
    mov  edi, ebx       ; temp save ebx_value in edi (col)
L4:
    MOVZX  eax, [esi]
    call WriteDec
    mov  al, SPACE
    call WriteChar

    add  esi, TYPE SWORD
    dec  ebx

    ; check endl for every (ebx) integers
    .IF ebx == 0
        call Clrscr
        mov ebx, edi    ; return the original ebx value
    .ENDF

    loop L4

    mov  ecx, edx
    call Clrscr
    call Clrscr

; Print Out the sum 2D-Array
    mov  esi, OFFSET arr1
    mov  edi, OFFSET arr2
    mov  edx, ebx
L5:
    MOVZX  eax, [esi]
    add    eax, [edi]
    call WriteDec
    mov  al, SPACE
    call WriteChar

    add  esi, TYPE SWORD
    add  edi, TYPE SWORD
    dec  ebx

    ; check endl for every (ebx) integers
    .IF ebx == 0
        call Clrscr
        mov ebx, edx    ; return the original ebx value
    .ENDF

    loop L5

    call Clrscr
    exit

main ENDP