; Program Description:
; This program calculates a result based on the values of several WORD variables.
; It demonstrates basic arithmetic operations and bitwise shifting in assembly language.
; The program initializes four WORD variables (val1, val2, val3, val4) with hexadecimal values.
; It then performs a series of arithmetic operations on these variables to compute the result.
; The result is stored in the variable 'result'.
; Finally, the program exits using the ExitProcess function.


; Student: Linn Erle Klofta
; Class: CSC3210
; Assignment 2


.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
val1        WORD 0134h
val2        WORD 0139h
val3        WORD 0043h
val4        WORD 002Fh
result      WORD ?

.code
main PROC
    movzx eax, val3         ; Move val3 to eax
    movzx ebx, val4         ; Move val4 to ebx
    add eax, ebx            ; Add val4 to eax (eax = val3 + val4)
    movzx edx, val1         ; Move val1 to edx
    sub eax, edx            ; Subtract val1 from eax (eax = (val3 + val4) - val1)
    movzx edx, val2         ; Move val2 to edx
    sub eax, edx            ; Subtract val2 from eax (eax = (val3 + val4) - val1 - val2)
    mov edx, 30             ; Move 30 to edx
    imul edx, 4             ; Multiply edx by 4 (edx = 30*4)
    shr edx, 3              ; Divide edx by 8 (edx = (30*4)/8)
    sub eax, edx            ; Subtract edx from eax (eax = (val3 + val4) - val1 - val2 - (30*4)/8)
    mov result, ax          ; Move result to ax

    ; Exit
    invoke ExitProcess, 0
main ENDP
END main
