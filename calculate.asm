; Program Description:
; This program calculates the value of var4 using the formula: var4 = (var1 * var2) / (var3 * 5).
; It demonstrates basic arithmetic operations in assembly language.
; The program initializes four DWORD variables: var1, var2, var3, and var4.
; It then performs the calculation specified by the formula and stores the result in var4.
; Finally, the program exits using the ExitProcess function.

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitcode:DWORD

.data
var1 DWORD 100
var2 DWORD 200
var3 DWORD 50
var4 DWORD ?


.code
main PROC 
    ; Evaluate var4 = (var1 * var2) / (var3 * 5)
    mov  eax, var1       ; Move var1 into EAX
    imul eax, var2       ; Multiply var1 by var2, result in EAX
    cdq                  ; Convert double word (EAX) to quad word (EDX:EAX) for division
    mov  ebx, var3       ; Move var3 into EBX
    imul ebx, 5          ; Multiply var3 by 5, result in EBX
    idiv ebx             ; Divide EAX (var1 * var2) by EBX (var3 * 5), result in EAX
    
    mov  var4, eax       ; Save the result in var4
    invoke ExitProcess, 0
main ENDP
END main
