; Program Description:
; This program searches for the maximum value in an array of WORDs and stores it in the variable MAXIMUM.
; It demonstrates basic array traversal and comparison operations in assembly language.
; The program initializes an array named Array with several WORD values.
; It then iterates through each element of the array, comparing it with the current maximum value stored in MAXIMUM.
; If the current element is greater than MAXIMUM, MAXIMUM is updated with the value of the current element.
; After traversing the entire array, the program exits using the ExitProcess function.


.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    Array WORD 10, 2, 23, 45, 21, 11
    MAXIMUM WORD ?

.code
main PROC
    mov esi, OFFSET Array      ; Point ESI to the beginning of Array
    mov ax, [esi]              ; Initialize MAXIMUM with the first element of Array
    mov [MAXIMUM], ax          ; Store MAXIMUM

    mov ecx, LENGTHOF Array    ; Set loop counter to the length of the array

compare_loop:
    add esi, 2                 ; Move to the next element of Array
    cmp ax, [esi]              ; Compare MAXIMUM with the current element
    jge skip_update            ; If MAXIMUM >= current element, skip update
    mov ax, [esi]              ; Update MAXIMUM with the current element
    mov [MAXIMUM], ax
skip_update:
    loop compare_loop          ; Repeat loop until all elements are compared

	invoke ExitProcess, 0
main ENDP
END main