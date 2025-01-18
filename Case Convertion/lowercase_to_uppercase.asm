.Model small

; Data Segment
.Data
temp1 db "Enter a Lowercase Character: $"
temp2 db "Uppercase Character is: "
temp3 db "?","$"


;Code Segment
.Code 
 
;Move Data Segment
MOV AX, @data
MOV DS, AX         


;Printing String
MOV AH,9                       
LEA DX,temp1
INT 21h                     


;Taking Input
MOV AH,1
INT 21h

;Converting Lowercase & Copy to temp3
SUB AL,20h   
MOV temp3,AL


;Move cursor at the begining of the line
MOV DL,0Dh
MOV AH,2
INT 21h

;Move cursor to the new line
MOV DL,0Ah
MOV AH,2
INT 21h  

;Printing the string with result
LEA DX,temp2
MOV AH,9
INT 21h      
