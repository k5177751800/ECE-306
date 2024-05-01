;10/26/2022 LAB 4
;tsc2262 
;TONY CHAE


.ORIG x3000
;++++++++++Creating the histogram+++++++++++++

;Store 'F','S','J','G'
LD R0,PTR1 ;load x4000 into R0 register 
AND R1,R1,#0 ;clear R1 register

LD R1,F 
JSR SHIFT8 ;shift [7:0] bit into [15:8] bit
STR R1,R0,#0 ;store ASCII 'F' into x4000(R0) 
LD R1,S
JSR SHIFT8
STR R1,R0,#1 ;store ASCII 'S' into x4001
LD R1,J
JSR SHIFT8
STR R1,R0,#2 ;store ASCII 'J' into x4002
LD R1,G
JSR SHIFT8
STR R1,R0,#3 ;store ASCII 'G' into x4003

AND R1,R1,#0 ;clear R0,R1

;Flowchart Box 1
ADD R0,R0,#4 ;R0=x4004
AND R2,R2,#0 ;clear R2(freshman counter)
AND R3,R3,#0 ;clear R3(sophomore counter)
AND R4,R4,#0 ;clear R4(Junior counter)
AND R5,R5,#0 ;clear R5(Graduate counter)


LOOP
;Flowchart Box 2
LDR R1,R0,#0 ;R1=mem[R0]

;Flowchart condition 1 - using R6 to check 'Is R1[15:8] is zero'
LD R6,Checkzero15to8 ;R6=xFF00
AND R6,R1,R6 
BRz FINISH

;Flowchart condition 2 ,use R7 as a num-comparater(30)
LD,R6,Checkzero7to0 ;R0=x00FF
AND R6,R1,R6
LD R7,NUMcompare1 ;R7=#30
NOT R7,R7 
ADD R7,R7,#1 ;make -#30 - 2's complement
ADD R7,R6,R7 ;if R7 is minus=yes
BRn step1
;Flowchart condition 3 ,use R7 as a num-comparater(61)
LD R7,NUMcompare2 ;R7=#61
NOT R7,R7
ADD R7,R7,#1 ;make -#61 - 2's complement
ADD R7,R6,R7 ;if R7 is minus=yes
BRn step2
;Flowchart conditioni 4
LD R7,NUMcompare3 ;R7=#91
NOT R7,R7
ADD R7,R7,#1 ;make -#91 - 2's complement
ADD R7,R6,R7 ;if R7 is minus=yes
BRn step3

ADD R5,R5,#1 ;Step 4 if no
ADD R0,R0,#1
BR LOOP
;----------each conditions-----------
step1
ADD R2,R2,#1
ADD R0,R0,#1
BR LOOP

step2
ADD R3,R3,#1
ADD R0,R0,#1
BR LOOP

step3
ADD R4,R4,#1
ADD R0,R0,#1
BR LOOP

;store R2,R3,R4,R5, in bits [7:0] of x4000~x4003 respectively
FINISH
LD R0,PTR1 ;load x4000 into R0 register 
AND R1,R1,#0 ;clear R1

LDR R1,R0,#0 ;load x4000's data
ADD R1,R1,R2 ;ADD
STR R1,R0,#0 ;Store back data to x4000

LDR R1,R0,#1 ;load x4000's data
ADD R1,R1,R3 ;ADD
STR R1,R0,#1 ;Store back data to x4000

LDR R1,R0,#2 ;load x4000's data
ADD R1,R1,R4 ;ADD
STR R1,R0,#2 ;Store back data to x4000

LDR R1,R0,#3 ;load x4000's data
ADD R1,R1,R5 ;ADD
STR R1,R0,#3 ;Store back data to x4000
;============================================================

;Calculatin Prgram - MAX,MIN,and MEAN 
LD,R0,PTR1
ADD,R0,R0,#4 ;R0=x4004

JSR MAX  ;R1 == max value of array
JSR SHIFT8

LD,R0,PTR1
ADD,R0,R0,#4 ;R0=x4004

JSR MIN
ADD R1,R1,R2
BRz NONE ;if nothings in the array.
LD R4,PTR2 
STR R1,R4,#0

LD,R0,PTR1
ADD,R0,R0,#4 ;R0=x4004

JSR MEAN

LD R4,PTR2
STR R1,R4,#1
BR fin

NONE
LD R1,Nothing
LD R4,PTR2
STR R1,R4,#0
STR R1,R4,#1

fin

HALT

Checkzero15to8 .FILL xFF00
Checkzero7to0 .FILL x00FF
PTR1 .FILL x4000
PTR2 .FILL x6000

F .FILL #70
S .FILL #83
J .FILL #74
G .FILL #71

NUMcompare1 .FILL #30
NUMcompare2 .FILL #61
NUMcompare3 .FILL #91

Nothing .FILL xFFFF

;===============SUBROUTINE 1 ================
SHIFT8 ;Shift 8bits [7:0]-->[15:8]
ADD R1,R1,R1
ADD R1,R1,R1
ADD R1,R1,R1
ADD R1,R1,R1
ADD R1,R1,R1
ADD R1,R1,R1
ADD R1,R1,R1
ADD R1,R1,R1

RET
;===============SUBROUTINE MAX ================ return MAX in R1(max data of array)
MAX

AND R2,R2,#0 ;immediate store register
AND R1,R1,#0 ;where store max value



maxLOOP
LD R5,Checkzero15to8 ;R5=xFF00
LDR R2,R0,#0 

AND R2,R5,R2;mask [15:8]
BRz maxFIN ;if R5 is zero --finish

LDR R2,R0,#0 
LD R5,Checkzero7to0  ;R5 =x00FF
AND R2,R5,R2 ;mask [7:0] bit
ADD R6,R2,#0 ;R6<-R2

NOT R2,R2
ADD R2,R2,#1 ;make -R2

ADD R4,R1,R2 ;R4<0 -->store to R1, R4>=0 Do not sotre
BRn compare1  ;if R1<R2
ADD R0,R0,#1 ;increase pointer
BR maxLOOP ;go check next num

compare1
ADD R1,R6,#0 ;store R6 into R1
ADD R0,R0,#1 ;increase pointer
BR maxLOOP ;go check next num

maxFIN

RET
;===============SUBROUTINE MIN ================ return MIN in R1(min data of array)
MIN

ADD R3,R1,#0 ;store R1 saver

AND R1,R1,#0 ;immediate store register
AND R2,R2,#0 ;where store min value

LDR R1,R0,#0 

LD R5,Checkzero15to8 ;R5=xFF00
AND R1,R5,R1;mask [15:8]
BRz minFIN ;if R1 is zero --finish

LDR R1,R0,#0
LD R5,Checkzero7to0  ;R5 =x00FF
AND R1,R5,R1 ;mask [7:0] bit
ADD R2,R1,#0 ;R2=R1


minLOOP
LD R5,Checkzero15to8 ;R5=xFF00
LDR R1,R0,#0 

AND R1,R5,R1;mask [15:8]
BRz minFIN ;if R1 is zero --finish

LDR R1,R0,#0
LD R5,Checkzero7to0  ;R5 =x00FF

AND R1,R5,R1 ;mask [7:0] bit
ADD R6,R1,#0 ;store R1 into R6 immeadiatly


NOT R1,R1
ADD R1,R1,#1 ;make -R1


ADD R4,R2,R1 ;R4>0 -->store to R2, R4<=0 Do not store
BRp compare2  ;if R2<R1
ADD R0,R0,#1 ;increase pointer
BR minLOOP ;go check next num

compare2
ADD R2,R6,#0 ;store R6 into R2
ADD R0,R0,#1 ;increase pointer
BR minLOOP ;go check next num

minFIN
ADD R1,R3,#0 ;saver (get R1 back)
RET

;===============SUBROUTINE MEAN =============== return MEAN (mean of array)
MEAN

AND R2,R2,#0 ;immediate store register
AND R1,R1,#0 ;where store sum->mean  value
AND R4,R4,#0 ;clear R4
ADD R4,R4,#1 ;R4=1(num pointer)
AND R5,R5,#0 ;(devide pointer)




LD R3,Checkzero15to8 ;R5=xFF00
LDR R1,R0,#0
AND R1,R3,R1;mask [15:8]
BRz meanEXIT ;if R1 is zero --exit

AND R1,R1,#0 ;where store sum->mean  value

LD R3,Checkzero7to0  ;R3 =x00FF

meanLOOP
LD R5,Checkzero15to8 ;R5=xFF00
LDR R2,R0,#0 

AND R5,R5,R2;mask [15:8]
BRz meanFIN ;if R5 is zero --finish

AND R2,R3,R2 ;mask [7:0]
ADD R1,R1,R2 ;R1=R1+R2 (sum)
ADD R4,R4,#1 ;increase num pointer
ADD R0,R0,#1 ;increase pointer
BR meanLOOP


meanFIN


ADD R4,R4,#-1
NOT R4,R4
ADD R4,R4,#1

AND R5,R5,#0

DEVIDE
ADD R1,R1,R4;
BRzp PLUS
BR meanEXIT

PLUS
ADD R5,R5,#1
BR DEVIDE



meanEXIT
ADD R1,R5,#0
RET

;==================================================

.END







