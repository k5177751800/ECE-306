.ORIG x3000
;Tony Chae
;tsc2262
;LAB 3
;10/19/2022

;Main program

LD R0, PTR1 ; Black pointer
ADD R1,R0,#1 ; Red pointer

LOOP1

LD R6,Checkzero ;Clear bit [7:0] and unchange bit [15:8] and check

LDR R2,R0,#0 ;R2=mem[R0] ;read data at R0 and load to R2
AND R6,R2,R6 ;leave bit [15:8]unchanged 
BRz FINISH ;if R2[15:8] is zero, halt the program because black pointer is with null-terminal

LOOP2

LD R6,Checkzero 

LDR R2,R0,#0 ;R2=mem[R0] ***
LDR R3,R1,#0 ;R3=mem[R1]
AND R6,R3,R6 ;leave bit [15:8]unchanged

BRnp NEXT
ADD R0,R0,#1 ;increment R0(Black pointer)
ADD R1,R0,#1 ;increment R1(Red pointer is below Black pointer)

BR LOOP1 ;if yes, go back to Loop1

NEXT

JSR Compare ;call subroutine

ADD R4,R4,#0 ;check condition code of R4 for swap
BRp NEXT2
ADD R1,R1,#1
;if swap=0 go to LOOP2
BR LOOP2

NEXT2
;if swap = 1
STR R2,R1,#0
STR R3,R0,#0
ADD R1,R1,#1
BR LOOP2


FINISH 
HALT


PTR1 .FILL x4004

Checkzero .FILL xFF00

;===============================================
;subroutin Compare
;input : R2 contains first student's information
;      : R3 contains second student's information
;output : R4=0 ---> no swap
;       : R4=1 ---> swap

Compare ;subroutine 

ST R2,Save1
ST R3,Save2
ST R5,Save3
ST R6,Save4

LD R4,x ;set R4 to x00FF

AND R5,R2,R4 ;R5= R2 AND x00FF
AND R6,R3,R4 ;R6= R3 AND x00FF

;R5=R5-R6
NOT R6,R6 
ADD R6,R6,#1; make R6 --> -R6


AND R4,R4,x0

ADD R5,R5,R6 ;R5=R5-R6

BRnz shouldswap
ADD R4,R4,#1 ;swap --> R4=1


shouldswap
ADD R4,R4,#0 ;no swap --> R4=0


LD R2,Save1
LD R3,Save2
LD R5,Save3
LD R6,Save4

RET


Save1 .FILL x0
Save2 .FILL x0
Save3 .FILL x0
Save4 .FILL x0

x .FILL x00FF

.END


