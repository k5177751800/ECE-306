;Practice lab 1

    .ORIG x3000
    
    LD R0, PTR      ;R0=3100
    LDR R1, R0, #0 
    LDR R2, R0, #1 
    AND R2, R2, #3
    
    NOT R2, R2
    ADD R2, R2, #1
    
    LDR R1, R0, #0
    LDR R2, R1, #1
    AND R2, R2, R6
    
    NOT R2, R2 
    ADD R2, R2, #1
    
    LDr R3, R1, #0
    ADD R3, R3, R2 
    STR R3, R1, #0
    
    LDR R3, R1, #1
    ADD R3, R3, R2
    STR R3, R1, #1
    
    LDR R3, R1, #2
    ADD R3, R3, R2
    STR R3, R1, #2
    
    HALT 
    
    
PTR  .FILL X3100

    .END 