DATA SEGMENT
    NUM1 DW 4567H
    NUM2 DW 2345H
    DIF DW 1 DUP(0)
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA

START:
    MOV AX, DATA
    MOV DS, AX
    CLC ; Clearing Carry

    ; Subtract NUM2 from NUM1
    LEA SI, NUM1          ; SI points to NUM1
    MOV AX, [SI]          ; Move NUM1 to AX
    SBB AX, [NUM2]        ; Subtract NUM2 from AX (Takes care of both smaller and larger number subtraction)
    MOV DIF, AX           ; Store the result

    MOV AH, 4CH
    INT 21H

CODE ENDS
END START
