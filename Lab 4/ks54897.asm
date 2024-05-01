;Lab 4 
;Konghwan Shin 


    .ORIG x3000
            
    LD R1, PTR4     ;R1=x4000
    LD R0, PTRF     ;loading asci code of F into R0   
    STR R0, R1, #0  
        
    ADD R1, R1, #1  ;R1=R1 increment 
    LD R0, PTRS     ;Loaing asci code for s into r0 
    STR R0, R1, #0  ;storing values 
        
    ADD R1, R1, #1  ;R1=R1+1
    LD R0, PTRJ      
    STR R0, R1, #0      
        
    ADD R1, R1, #1  ;R1=R1+1
    LD R0, PTRG       
    STR R0, R1, #0    
        
    LD R0, PTR1     ;R0=x4004
    AND R2, R2, #0  
    AND R3, R3, #0     
    AND R4, R4, #0      
    AND R5, R5, #0     

 
LOOP         
    LDR R1, R0, #0  ;load R1=R0 
    LD R6, PTR2     ;R6=xFF00
    AND R7, R7, #0      
    AND R7, R1, R6   
    BRZ BOX           ;IF EQUAL 0 MOVE TO BOX
        
    AND R6, R6, #0     
    LD R6, PTR3     ;LOAD PTR3 TO R6
    AND R7, R7, #0      
    AND R7, R1, R6      
    AND R6, R6, #0    
    LD R6, PTR5       ;load ptr5 to r6
    ADD R7, R7, R6      
    BRN YES1         ;IF EQUAL 0 MOVE TO YES 2 
        
    AND R6, R6, #0      
    LD R6, PTR3       ;LOAD PTR3 TO R6 
    AND R7, R7, #0      
    AND R7, R1, R6  
     
    LD R6, PTR6       ;LOAD PTR6 TO R6
    ADD R7, R7, R6     
    BRN YES2          ;IF EQUAL 0 MOVE TO YES 2 
    
    AND R6, R6, #0      
    LD R6, PTR3        
    AND R7, R7, #0      ;CLEAR BITS 
    AND R7, R1, R6     
    AND R6, R6, #0      
    LD R6, PTR7      ;PTR7=R6
    ADD R7, R7, R6    
    BRN YES3             ;IF EQUAL 0 MOVE TO YES3
        
    ADD R5, R5, #1      
    BR RELOOP
        
        
BOX
    LD R1, PTR4       ;R1=PTR4
    AND R6, R6, #0     ;CLEARING BITS 
    LD R6, PTR3        ;R1=PTR3
    AND R2, R2, R6      
    AND R6, R6, #0   
    LDR R6, R1, #0      
    ADD R6, R6, R2     ;R6=R6+R2
    STR R6, R1, #0      
    

    ADD R1, R1, #1      ;R1=R1+1
    AND R6, R6, #0    
    LD R6, PTR3        ;load ptr3 into r6 
    AND R3, R3, R6    ;Anding R3 and R6 and sotring at r3
    AND R6, R6, #0       ;CLEARING BITS 
    LDR R6, R1, #0    
    ADD R6, R6, R3    
    STR R6, R1, #0      

    ADD R1, R1, #1      
    LD R6, PTR3    
    AND R4, R4, R6   
    AND R6, R6, #0       ;CLEARING BITS 
    LDR R6, R1, #0      
    ADD R6, R6, R4  
    STR R6, R1, #0     
    
 
    ADD R1, R1, #1    
    AND R6, R6, #0       ;CLEARING BITS 
    LD R6, PTR3       
    AND R5, R5, R6     
    AND R6, R6, #0      ;CLEARING BITS 
    LDR R6, R1, #0    
    ADD R6, R6, R5     
    STR R6, R1, #0     

        
        
    JSR MAX
        
    ADD R1, R1, R1      ;REPREATING PROCESS FOR EIGHT TIMES 
    ADD R1, R1, R1
    ADD R1, R1, R1
    ADD R1, R1, R1
    ADD R1, R1, R1
    ADD R1, R1, R1
    ADD R1, R1, R1
    ADD R1, R1, R1
        
    ST R1, PTR70
        
    JSR MIN
        
    LD R1, PTR70        ;load ptr70 to r1
    LD R3, PTR60        ;load ptr60 to r3
    ADD R4, R1, R2
    STR R4, R3, #0
        
    JSR MEAN
    
    LD R5, PTR61    ;load ptr61 to r5
    STR R4, R5, #0
        
    BR ENDING        ;for all values move to ending 
 
 
YES1
    ADD R2, R2, #1  ;R2=R2+1
    BR RELOOP       ;MOVE TO RELOOP
        

YES2
    ADD R3, R3, #1      ;R3=R3+1
    BR RELOOP      ;MOVE TO RELOOP

        
YES3
    ADD R4, R4, #1  ;R4=R4+1
    BR RELOOP    ;MOVE TO RELOOP
        

RELOOP
    ADD R0, R0, #1   ;R0=R0+1  
    BR LOOP         ;MOVE TO LOOP   
 

ENDING
    HALT
    
    

;===========================================================================

MAX
    LD R0, PTR1
    ADD R1, R0, #0
    
    LD R6, PTRM
    LDR R2, R0, #0
    LD R3, PTR2      
    AND R2, R2, R3 
    BRZ DONE
        
    LDR R6, R0, #0
        
SUPMAX  
    AND R2, R2, #0
    ADD R2, R6, #0    
    LDR R5, R1, #0
    LD R3, PTR2         
    AND R4, R5, R3      
    BRZ DONE
        
    AND R3, R3, #0
    AND R4, R4, #0
        
    LD R0, PTR3
    AND R3, R2, R0
    AND R4, R5, R0
        
    NOT R4, R4
    ADD R4, R4, #1
        
    ADD R3, R3, R4
    BRN NEGATE

REDO
    ADD R1, R1, #1
    BR SUPMAX

NEGATE
    ADD R6, R5, #0
    BR REDO
        
DONE
    AND R1, R1, #0
    ADD R1, R6, #0
    LD R0, PTR3
    AND R1, R1, R0
    RET
        
        

MIN
    LD R0, PTR1
    ADD R1, R0, #0
        
    LD R6, PTRM
    LDR R2, R0, #0
    LD R3, PTR2        
    AND R2, R2, R3      
    BRZ DONE2
        
    LDR R6, R0, #0
        
SUPMIN    
    AND R2, R2, #0
    ADD R2, R6, #0      
    LDR R5, R1, #0
    AND R3, R3, #0   
    LD R3, PTR2        
    AND R4, R4, #0
    AND R4, R5, R3     
    BRZ DONE2
        
    AND R3, R3, #0
    AND R4, R4, #0
        
    LD R0, PTR3
    AND R3, R2, R0
    AND R4, R5, R0
        
    NOT R4, R4
    ADD R4, R4, #1
        
    ADD R3, R3, R4
    BRP POS

REDO2
    ADD R1, R1, #1
    BR SUPMIN

POS
    ADD R6, R5, #0
    BR REDO2
        
DONE2
    AND R2, R2, #0
    ADD R2, R6, #0
    LD R0, PTR3
    AND R2, R2, R0
    RET


MEAN
    LD R0, PTR1
        
    AND R1, R1, #0
    AND R2, R2, #0
        
LOOP1
    LDR R3, R0, #0   
    LD R5, PTR2
    AND R6, R3, R5   
    AND R4, R4, #0
    ADD R6, R6, #0
    BRZ DONE3
        
    LD R4, PTR3        
    AND R3, R3, R4     
    ADD R1, R1, R3    
    ADD R2, R2, #1     
    ADD R0, R0, #1   
    BR LOOP1
        
DONE3   
        
    ADD R2, R2, #0
    BRZ ECE
        
    NOT R2, R2
    ADD R2, R2, #1
    
TEMP
    ADD R1, R1, R2
        
    BRNZ EE
        
    ADD R4, R4, #1
    BR TEMP
    
EE
    RET
    
ECE
    LD R4, PTRM
    BR EE

PTR1 .FILL x4004
PTR2 .FILL xFF00 
PTR3 .FILL x00FF
PTR4 .FILL x4000
PTR5 .FILL #-30 
PTR6 .FILL #-61
PTR7 .FILL #-91
PTRM .FILL xFFFF
PTR70 .FILL x7000 
PTR60 .Fill x6000 
PTR61 .FILL x6001 

PTRF .FILL x4600
PTRS .FILL x5300
PTRJ .FILL x4A00
PTRG .FILL x4700
        
        


        .END




































