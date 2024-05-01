;Lab 2 


    .ORIG x3000
    
    LD R0, PTR 
    LDR R1, R0, #0
    LDR R2, R1, #0
    
    AND R4, R4, #0
    ADD R4, R4, #8

ALL 
    ADD R2, R2, #0 
    BRN YES 
    ADD R2, R2, R2
    BR NO 

YES 
    ADD R2, R2, R2
    ADD R2, R2, #1

NO 
    ADD R4, R4, #-1 
    BRZ END 
    BR ALL 
    
END 
    STR R2, R1, #0 
    
    HALT 
    
    
    
    
    
    PTR .FILL x4000
    
    .END 