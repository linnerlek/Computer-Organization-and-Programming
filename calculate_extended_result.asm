; Program Description:
; This program calculates a result based on the values of DWORD and BYTE variables.
; It demonstrates the use of zero and sign extension in assembly language.
; The program initializes four variables: val1, val2 as DWORDs, and val3, val4 as BYTEs.
; It performs a series of arithmetic operations using these variables to compute the result.
; The result is stored in a register ECX.
; Finally, the program exits using the ExitProcess function.

; Student: Linn Erle Klofta
; Class: CSC3210
; Assignment 2


.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    val1        DWORD 12
    val2        DWORD 9
    val3        BYTE 2
    val4        BYTE 20

.code
main PROC
    movzx eax, val3         ; Move val3 to eax (zero-extend to 32-bit)
    sub eax, val1           ; Subtract val1 from eax (eax = val3 - val1)
    neg eax                 ; Negate eax (eax = -(val3 - val1))
    mov ecx, eax            ; Move eax to ECX

    movsx eax, val4         ; Move val4 to eax (sign-extend to 32-bit)
    neg eax                 ; Negate eax (eax = -val4)
    add eax, val2           ; Add val2 to eax (eax = -val4 + val2)
    add ecx, eax            ; Add eax to ECX (ECX = -(val3 - val1) + (-val4 + val2))

    add ecx, 3              ; Add 3 to ECX (ECX = -(val3 - val1) + (-val4 + val2) + 3)

    invoke ExitProcess, 0
main ENDP
END main
