 .ORIG x3000
;Practice 
    
    
   
    
   LD R0, PTR1      ;R0=x4004
   ADD R1, R0, #1   
   
LOOP
    LDR R2, R0, #0 
    LD R5, PTR2 ;R5=xFF00
    AND R2, R2, R5
    BRZ YES

    LDR R3, R1, #0
    LD R5, PTR2 
    AND R3, R3, R5
    BRZ YES1
    BR COMPARE 

YES 
    HALT 
    
YES1 
    ADD R0, R0, #1
    ADD R1, R1, #1 
    BR LOOP 
;========================================================
COMPARE 
    LD R4, PTR3
    AND R5, R2, R4
    AND R6, R3, R4
    
    NOT R6, R6 
    ADD R6, R6, #1 
    
    ADD R5, R5, R6 
    
    BRP YES2
    BRNZ NO
YES2 
    AND R4, R4, #0
    ADD R4, R4, #1 
    BR RESTORE 
NO 
    AND R4, R4, #0
    ADD R4, R4, #0 
    BR RESTORE 
RESTORE 
    LD R2, SAVE1 
    LD R3, SAVE2 
    LD R4, SAVE3 
    LD R5, SAVE4
    
RET 

SAVE1 .FILL x0 
SAVE2 .FILL x0 
SAVE3 .FILL x0 
SAVE4 .FILL x0 
    
    
    
    
    
    

PTR1 .FILL x4004
PTR2 .FILL xFF00
PTR3 .FILL x00FF
PTR0 .FILL x0000

.END
