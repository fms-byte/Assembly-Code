DATA SEGMENT
   NUM1 DW 0FFFFH, 0FFFFH
   NUM2 DW 1111H, 1111H
   SUM  DW 4 DUP(0)
DATA ENDS

CODE SEGMENT
   ASSUME CS:CODE, DS:DATA

START:
   MOV AX, DATA
   MOV DS, AX

   ; Add LSB of NUM1 to AX
   MOV AX, NUM1
   ADD AX, NUM2
   MOV SUM, AX

   ; Add MSB of NUM1 to AX with Carry
   MOV AX, NUM1+2
   ADC AX, NUM2+2

   ; Check for overflow (Carry) and adjust the MSB accordingly
   JNC NO_OVERFLOW
   INC SUM+4
NO_OVERFLOW:

   MOV AH, 4CH
   INT 21H

CODE ENDS
END START
