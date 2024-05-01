        ;Lab 3: Konghwan Shin 

        .ORIG x3000
        
    ;R0 is x4004
        LD R0, PTR1
    ;R1 is x4005
        LD R1, PTR2     
ECE    
    ;Move content in R0 to R2 
        LDR R2, R0, #0
    ;R5= xFF00
        LD R5, PTR3 
        AND R2, R2, R5
    ;If R2=0 end program 
        BRZ EXIT  
BME
    ;Move content in R1 to R3 
        LDR R3, R1, #0
    ;Move content in R0 to r2 
        LDR R2, R0, #0
    ;R5=xFF00
        LD R5, PTR3
        AND R3, R3, R5 
    ;When student id is 0 move to HELLO 
        BRZ EE
    ;Move on to BME 
        JSR SCI
    ;
        ADD R4, R4, #0
        BRP ENG
COMP
    ;Increment PC+1
        ADD R1, R1, #1
        BR BME
EE
    ;PC+1 for R0 
        ADD R0, R0, #1
        ADD R1, R0, #1
        BR ECE
ENG
    ;Store value of R0 in R1
        STR R2, R1, #0
    ;The same as previous 
        STR R3, R0 #0
        BR COMP
EXIT
        HALT 
        
SCI
    ;Move content in R0 to R2 
        LDR R2, R0, #0
    ;Move content in R1 to R3 
        LDR R3, R1, #0 
        AND R5, R5, #0 
        AND R6, R6, #0 
        LD R4, PTR4
        AND R5, R2, R4 
    ;store last eight bit in of R3 in R6
        AND R6, R3, R4 
        
        NOT R6, R6 
        ADD R6, R6, #1
        
        ADD R5, R5, R6
        BRP UGS
        AND R4, R4, #0 
MATH
        RET
UGS
        AND R4, R4, #0 
        ADD R4, R4, #1
        BR MATH 
        
PTR1 .FILL x4004
PTR2 .FILL x4005
PTR3 .FILL XFF00
PTR4 .FILL x00FF
       
        .END 
    
    
        
        
        
        
        

        
        
        
        