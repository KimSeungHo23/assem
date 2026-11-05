
.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
GetStdHandle PROTO, nStdHandle:DWORD
WriteConsoleA PROTO, hConsoleOutput:DWORD, lpBuffer:PTR BYTE, nNumberOfCharsToWrite:DWORD, lpNumberOfCharsWritten:PTR DWORD, lpReserved:DWORD

.data
    msg BYTE "Name: Kim Seung Ho", 13, 10, "Student ID: 2023864014", 0
    written DWORD ?

.code
main PROC
    INVOKE GetStdHandle, -11
    mov ebx, eax

    INVOKE WriteConsoleA, ebx, ADDR msg, 41, ADDR written, 0

    INVOKE ExitProcess, 0
main ENDP
END main
