; Program Description:
; This program defines a procedure for searching for a specific item in an array of DWORDs. 
; The main procedure demonstrates the usage of this search procedure by searching for a sample item in an example array. 
; The search procedure takes the following arguments:
;   - EBX: The item to search for
;   - ESI: Address of the first item in the array
;   - ECX: Number of items in the array
;   - EDX: Size of each item in the array
; The search procedure returns the index of the found item (0-based index) in the EAX register. 
; If the item is not found, it returns -1. 
; After calling the search procedure, the main procedure retrieves the result from EAX and exits the program.

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    array DWORD 1, 2, 3, 4, 5  ; Example array
    sample DWORD 5               ; Item to search for

.code
Search PROC
    ; Save a copy of the registers except EAX in the stack
    push EBX
    push ESI
    push ECX
    push EDX

    ; Procedure arguments:
    ; EBX - Item to search for
    ; ESI - Address of the first item in the array
    ; ECX - Number of items in the array
    ; EDX - Size of each item in the array

    mov EDI, ESI            ; Set EDI to point to the start of the array
    mov EAX, -1             ; Default return value to -1

    ; Loop through the array
search_loop:
    cmp ECX, 0              ; Check if ECX (counter) is zero
    je not_found            ; If zero, item not found, jump to not_found

    mov EAX, [EDI]          ; Load the current item in the array into EAX
    cmp EAX, EBX            ; Compare current item with the item to search for
    je found                ; If equal, item found, jump to found

    add EDI, EDX            ; Move to the next item in the array
    sub ECX, 1              ; Decrement the counter
    jmp search_loop         ; Repeat the loop

found:
    ; Item found, store it in EAX
    jmp done

not_found:
    ; Item not found, set EAX back to -1
    mov EAX, -1

done:
    ; Restore the items from the stack
    pop EDX
    pop ECX
    pop ESI
    pop EBX

    ret
Search ENDP

main PROC
    ; Example usage:
    mov EBX, sample         ; Item to search for
    lea ESI, array          ; Address of the first item in the array
    mov ECX, 5              ; Number of items in the array
    mov EDX, 4              ; Size of each item in the array (assuming DWORDs)

    call Search             ; Call the Search procedure

    ; Result will be in EAX

    ; Clean up and exit
    invoke ExitProcess, 0
main ENDP
END main
