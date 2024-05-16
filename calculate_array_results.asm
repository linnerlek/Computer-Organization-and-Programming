; Program Description:
; This program calculates results based on the values of WORD variables and stores them in an array.
; It demonstrates basic arithmetic operations and array manipulation in assembly language.
; The program initializes four variables: x, y, and r as WORDs, and z as a DWORD array with 3 elements.
; It performs a series of arithmetic operations using these variables to compute results.
; The results are stored in the z array.
; Finally, the program exits using the ExitProcess function.


; Student: Linn Erle Klofta
; Class: CSC3210
; Assignment 2

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    x       WORD 10
    y       WORD 15
    r       WORD 4
    z       DWORD 3 DUP(?)

.code
main PROC
    movzx eax, x          ; Move x to eax
    movzx edx, y          ; Move y to edx
    add eax, edx          ; Add x and y
    movzx edx, r          ; Move r to edx
    add eax, edx          ; Add r
    mov z[0], eax         ; Store the result in z[0]

    mov eax, z[0]         ; Move z[0] to eax
    movzx edx, y          ; Move y to edx
    movzx ebx, r          ; Move r to ebx
    sub edx, ebx          ; Subtract r from y
    add eax, edx          ; Add the result to z[0]
    mov z[4], eax         ; Store the result in z[1]

    mov eax, z[0]         ; Move z[0] to eax
    mov edx, z[4]         ; Move z[1] to edx
    movzx ebx, y          ; Move y to ebx
    add edx, ebx          ; Add y to z[1]
    add eax, edx          ; Add z[1] to z[0]
    mov z[8], eax         ; Store the result in z[2]

    invoke ExitProcess, 0
main ENDP
END main
