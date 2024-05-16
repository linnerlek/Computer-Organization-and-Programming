; Program Description:
; This program calculates the sum of even numbers in an array.
; It demonstrates nested loops and conditional branching in assembly language.
; The program initializes an array named array_list with DWORD values.
; It then iterates through the array, checking each element for evenness.
; If an element is even, its value is added to the sum.
; The final sum is stored in the variable 'sum'.
; Finally, the program exits using the ExitProcess function.


.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitcode:DWORD

.data
array_list DWORD 10, 11, 13, 18, 21, 23, 23, 17, 45
array_size DWORD 0
index DWORD 0
sum DWORD 0

.code
main PROC
    ; Calculate array_size
    MOV eax, LENGTHOF array_list   ; Get the number of elements in the array
    MOV array_size, eax            ; Store the result in array_size

    ; Initialize index and sum
    MOV index, 0
    MOV sum, 0

    ; Outer loop (current_size = array_size)
    MOV ecx, array_size
    L1:
        ; Reset index for each iteration
        MOV index, 0

        ; Inner loop (index < current_size)
        L2:
            CMP index, ecx
            JAE L3  ; Jump if index >= current_size

            ; Calculate the address of array_list[index]
            MOV eax, index
            SHL eax, 2                  ; Multiply index by 4 (assuming DWORD array)
            ADD eax, OFFSET array_list  ; Calculate the address of array_list[index]

            ; Check if array_list[index] is even
            MOV ebx, [eax]              ; Move the value at the address into ebx
            TEST ebx, 1                 ; Test if the least significant bit is set (odd number)
            JNZ next_iteration         ; If odd, go to next iteration

            ; Add array_list[index] to sum
            ADD sum, ebx

        next_iteration:
            ; Increment index
            INC index
            JMP L2  ; Repeat inner loop

        L3:
        ; Decrement current_size
        DEC ecx
        JNZ L1  ; Repeat outer loop if current_size > 0 

    ; Store the result in the variable sum
    ; The result is already stored in the sum variable

    ; Exit the program
    invoke ExitProcess, 0
main ENDP
END main
