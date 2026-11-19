
.386
.model flat, stdcall
option casemap:none

includelib kernel32.lib
includelib msvcrt.lib

ExitProcess PROTO, dwExitCode:DWORD
printf PROTO C :PTR BYTE, :VARARG
scanf PROTO C :PTR BYTE, :VARARG

.data
    msg1 BYTE "Enter first number: ", 0
    msg2 BYTE "Enter second number: ", 0

    fmt BYTE "%d", 0

    addMsg BYTE "Addition: %d", 13, 10, 0
    subMsg BYTE "Subtraction: %d", 13, 10, 0
    mulMsg BYTE "Multiplication: %d", 13, 10, 0
    divMsg BYTE "Division: %d", 13, 10, 0

    regMsg BYTE 13, 10, "AX = %u", 13, 10,
                 "BX = %u", 13, 10,
                 "CX = %u", 13, 10,
                 "DX = %u", 13, 10, 0

    num1 SDWORD ?
    num2 SDWORD ?

    resultAdd SDWORD ?
    resultSub SDWORD ?
    resultMul SDWORD ?
    resultDiv SDWORD ?

.code
main PROC

    invoke printf, ADDR msg1
    invoke scanf, ADDR fmt, ADDR num1

    invoke printf, ADDR msg2
    invoke scanf, ADDR fmt, ADDR num2

    ; 덧셈
    mov eax, num1
    add eax, num2
    mov resultAdd, eax

    ; 뺄셈
    mov eax, num1
    sub eax, num2
    mov resultSub, eax

    ; 곱셈
    mov eax, num1
    imul eax, num2
    mov resultMul, eax

    ; 나눗셈
    mov eax, num1
    cdq
    idiv num2
    mov resultDiv, eax

    ; 사칙연산 출력
    invoke printf, ADDR addMsg, resultAdd
    invoke printf, ADDR subMsg, resultSub
    invoke printf, ADDR mulMsg, resultMul
    invoke printf, ADDR divMsg, resultDiv

    ; 레지스터 저장
    mov ax, WORD PTR resultAdd
    mov bx, WORD PTR resultSub
    mov cx, WORD PTR resultMul
    mov dx, WORD PTR resultDiv

    ; 레지스터 출력
    movzx eax, ax
    movzx ebx, bx
    movzx ecx, cx
    movzx edx, dx

    invoke printf, ADDR regMsg, eax, ebx, ecx, edx

    invoke ExitProcess, 0

main ENDP
END main
