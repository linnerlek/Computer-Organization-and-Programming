; Program Description:
; This program demonstrates conditional branching in assembly language.
; It compares the values of three DWORD variables (var1, var2, var3) and performs different operations based on the comparison results.
; If var1 is less than or equal to var2, or if var3 is greater than or equal to var2, it decrements all variables by 1.
; If var1 is greater than var2 and var3 is less than var2, it calculates var1 as the sum of var2 and var3, and increments var2 and var3 by 1.
; The program then exits using the ExitProcess function.

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitcode:DWORD

.data
var1 DWORD 10
var2 DWORD 11
var3 DWORD 12

.code
main PROC
    ; Compare var1 and var2
    mov eax, var1
    cmp eax, var2
    jle else_block ; Jump to else block if var1 <= var2

    ; Compare var3 and var2
    mov eax, var3
    cmp eax, var2
    jge then_block ; Jump to then block if var3 >= var2

else_block:
    ; Code block executed if var1 <= var2 or var3 >= var2
    sub var1, 1 ; var1--
    sub var2, 1 ; var2--
    sub var3, 1 ; var3--
    jmp end_if ; Jump to the end of the if-else statement

then_block:
    ; Code block executed if var1 > var2 and var3 < var2
    mov eax, var2
    add eax, var3 ; var2 + var3
    mov var1, eax ; var1 = var2 + var3

    inc var2 ; var2++
    inc var3 ; var3++

end_if:
    invoke ExitProcess, 0
main ENDP
END main
