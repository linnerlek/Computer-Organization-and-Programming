; Program Description:
; This program calculates the sum of the individual bytes of a DWORD value (dVal).
; It demonstrates loading individual bytes from a DWORD variable and performing addition operations in assembly language.
; The program initializes a DWORD variable named dVal with a hexadecimal value.
; It then extracts each byte of dVal and adds them together to calculate the sum.
; The resulting sum is stored in a BYTE variable named sum.
; Finally, the program exits using the ExitProcess function.

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitcode:DWORD

.data
dVal DWORD 04080102h
sum BYTE ?

.code
main PROC
    mov eax, dVal        ; Load the value of dVal into eax
    mov ebx, OFFSET dVal ; Get the offset address of dVal

    mov al, BYTE PTR [ebx]         ; Load the first byte (04) into al
    mov bl, BYTE PTR [ebx + 1]     ; Load the second byte (08) into bl
    mov cl, BYTE PTR [ebx + 2]     ; Load the third byte (01) into cl
    mov dl, BYTE PTR [ebx + 3]     ; Load the fourth byte (02) into dl

    add al, bl        ; Add the first and second bytes
    add al, cl        ; Add the third byte
    add al, dl        ; Add the fourth byte
       
    invoke ExitProcess, 0
main ENDP
END main
