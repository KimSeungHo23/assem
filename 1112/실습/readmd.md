
.386
.MODEL FLAT, STDCALL
.STACK 4096

ExitProcess PROTO, dwExitCode:DWORD
printf PROTO C, :PTR BYTE, :VARARG
scanf PROTO C, :PTR BYTE, :VARARG

.DATA
    msg1 BYTE "Enter 5 numbers: ", 0
    inputFmt BYTE "%d %d %d %d %d", 0
    outputFmt BYTE "Average = %d", 13, 10, 0

    num1 DWORD ?
    num2 DWORD ?
    num3 DWORD ?
    num4 DWORD ?
    num5 DWORD ?
    total DWORD ?

.CODE
main PROC

    push OFFSET msg1
    call printf
    add esp, 4

    push OFFSET num5
    push OFFSET num4
    push OFFSET num3
    push OFFSET num2
    push OFFSET num1
    push OFFSET inputFmt
    call scanf
    add esp, 24

    mov eax, num1
    add eax, num2
    add eax, num3
    add eax, num4
    add eax, num5

    mov total, eax

    mov edx, 0
    mov ebx, 5
    div ebx

    push eax
    push OFFSET outputFmt
    call printf
    add esp, 8

    invoke ExitProcess, 0

main ENDP
END main
