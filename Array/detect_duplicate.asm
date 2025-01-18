.Model small
.Stack 100h
.Data
arr db 1, 2, 3, 4, 5         ; Array of 5 elements
no_dup db "No Duplicate Found $"
dup db "Duplicate Found $"

.Code
MOV AX, @data                 ; Initialize data segment
MOV DS, AX
MOV SI, 0                     ; Outer loop index (starting from 0)

OuterLoop:
    INC SI                    ; Increment SI to point to the next element
    CMP SI, 5                 ; Check if we reached the end of the array
    JE NoDuplicate            ; If yes, no duplicates found

    LEA DI, arr               ; Load the start of the array into DI
    MOV CX, SI                ; Set CX to the number of comparisons for the inner loop

InnerLoop:
    MOV AL, [arr + SI]        ; Load the current outer loop element
    CMP AL, [DI]              ; Compare with the current inner loop element
    JE Duplicate              ; If equal, duplicate found

    INC DI                    ; Move DI to the next element
    LOOP InnerLoop            ; Repeat until CX becomes 0

    JMP OuterLoop             ; Go to the next outer loop iteration

Duplicate:
    MOV AH, 9                 ; Print "Duplicate Found"
    LEA DX, dup
    INT 21h
    JMP Exit                  ; Exit program

NoDuplicate:
    MOV AH, 9                 ; Print "No Duplicate Found"
    LEA DX, no_dup
    INT 21h

Exit:
    MOV AH, 4Ch               ; Terminate program
    INT 21h
