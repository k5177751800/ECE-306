    .ORIG x3000

    
    
    
    
    
    
    
    
    
    
    
    


    LD R0, PTR  ; R0 = X3100
    LDR R1, R0, #0  ; R1 = mem[x3100]
    LDR R2, R0, #1  ; R2 = mem[X3101]
    AND R2, R2, #3   ; R2[1:0] contains they key 
    
    NOT R2, R2  ;Negate the key, and load back into R2
    ADD R2, R2, #1   
    
  
    ;   Load first character into R3
            LDR R3, R1, #0
    ;   Add negative of the key to R3, and look back into R3
            ADD R3, R3, R2
    ;   Store R3 back into same location where the character was read from 
            STR R3, R1, #0
            
    ;Load second character into R3
            LDR R3, R1, #1
    ; Add negative of key to R3, and load back into R3
            ADD R3, R3, R2
    ; Store R3 back into some location where the character was read from 
            STR R3, R1, #1
        
    ; Load third character into R3
            LDR R3, R1, #2
    ; Add negative of key R3, and load back into R3
            ADD R3, R3, R2
    ; Store R3 back into some location where the character war read from 
            STR R3, R1, #2
    HALT 
    
 PTR .FILL   X3100

    .END