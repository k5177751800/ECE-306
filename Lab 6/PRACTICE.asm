;Lab 6
;Konghwan Shin 

    .ORIG x3000
;
    LEA R0, PROMPT      ;Prompt loaded into R0 
    PUTS                ;Shows stringz content on screen 
;
    LD R1, NEG0A        ;Load -(asci code of 0A) into R1 
    LD R2, PTR        ;load x3200 into R2 
    
BACK    GETC                ;Getting character user typed 
        OUT                 ;Display all other value
        ADD R3, R1, R0      ;-0A+Ro=store in R3 
        BRZ DONE            ;When value=0, or when user type enter go to done
        STR R0, R2, #0      ;Store the context the user typed into R2(x4000)
        ADD R2, R2, #1      ;PC increment 
        BR BACK             ;Everything goes to back until the value is 0 or the use hit enter 

Done    
    AND R0, R0, #0      ;Clear bits 
    STR R0, R2, #0      ;Store R0, in R2(x4000)

;Search the linked list to see if there is match 
    LDI R0, NODE0       ;Node0 contains head pointer x4000
LOOP 
    BRZ SEC            ;When it does not equal 0 
    LDR R1, R0, #1      ;Load mem(R0+1) into R1 
    LD R2, PTR        ;Load x3200 into R2
    
    ST R1, SAVE1
    ST R2, SAVE2 
    ST R5, SAVE3 
    ST R6, SAVE4
    
;Subroutine 
MATCH 
        LDR R5, R1, #0      ;R5=MEM(R1)
        LDR R6, R2, #0      ;R6=MEM(R2)
        BRZ YES             ;When equal 0 everything goes to yes
        
        NOT R6, R6          ;Negate R6 
        ADD R6, R6, #1      ;PC+1 
        ADD R5, R5, R6      ;Add negated value of R6 and R5 and store it at R5
        BRZ YES2            ;When equal 0 everything goes to yes2
        
        LD R1, SAVE1 
        LD R2, SAVE2 
        LD R5, SAVE3 
        LD R6, SAVE4 
        LDR R0, R0, #0 
        
        BR LOOP 
MATCHING
    LD R0, PTR        ;Load R0=x3200
    PUTS                ;Shows stringz content on screen
    LEA R0, PROMPT2     ;is offered this semester!
    PUTS                ;Shows stringz content on screen
    HALT
NULL 
    LD R0, PTR            ;load x3200 into r0 
    PUTS                    ;Shows stringz content on screen
    LEA R0, PROMPT1         ;is not offered this semester
    PUTS                    ;Shows stringz content on screen
    HALT 
    
YES 
        ADD R6, R5, R6      ;ADD R5 and R6 and store it at R6 
        BRZ MATCHING        ;When equal 0 everything goes to Matching
        LD R1, SAVE1 
        LD R2, SAVE2 
        LD R5, SAVE3 
        LD R6, SAVE4 
        LDR R0, R0, #0 
        BR LOOP             ;Everything goes back to loop 

YES2 
        ADD R1, R1, #1      ;PC+1
        ADD R2, R2, #1      ;PC+1
        BR MATCH            ;Everything goes back to Match 
        
NODE0 .FILL x4000
NEG0A .FILL x-0A
PTR .FILL x3200
PROMPT .STRINGZ "Type Course Number and press Enter: "
;Second output for second branch 
SEC 
    LDI R0, PTR41       ;Node0 contains head pointer x4001
    LD R7, PTR41        ;Load x4001 into R7
LOOP1 
    BRZ NULL2            ;When it does not equal 0 
    LDR R1, R0, #1      ;Load mem(R0+1) into R1 
    LD R2, PTR32        ;Load x3200 into R2
    
    ST R1, SAVE1
    ST R2, SAVE2 
    ST R5, SAVE3 
    ST R6, SAVE4
MATCH1 
    LDR R5, R1, #0      ;R5=MEM(R1)
    LDR R6, R2, #0      ;R6=MEM(R2)
    BRZ YES1            ;When equal 0 everything goes to YES1 
        
    NOT R6, R6          ;Negate R6 
    ADD R6, R6, #1      ;PC+1 
    ADD R5, R5, R6      ;Add negated value of R6 and R5 and store it at R5
    BRZ YES3            ;When equal 0 everything goes to YES3
        
    LD R1, SAVE1 
    LD R2, SAVE2 
    LD R5, SAVE3 
    LD R6, SAVE4 
    LDR R0, R0, #0 
        
    BR LOOP1            ;Everything goes back to Loop 
YES1 
        ADD R6, R5, R6 
        BRZ LP          ;When=0 goes to LP
        LD R1, SAVE1 
        LD R2, SAVE2 
        LD R5, SAVE3 
        LD R6, SAVE4 
        LDR R0, R0, #0 
        BR LOOP1        ;Everything goes back to loop 
YES3 
    ADD R1, R1, #1          ;PC+1
    ADD R2, R2, #1          ;PC+1
    BR MATCH1           ;Everything goes back to Match1 
NULL2 
    LEA R0, PROMPT4         ;The entered Course Number does not exist in the current course catolog.
    PUTS                    ;Shows stringz content on screen
    HALT 
LP
    ST R7, SAVE1 
    ST R0, SAVE2
    LDR R1, R0, #0 
    STI, R0, PTR4000
    STI R1, SAVE1 
    STI R2, SAVE2 
    LD R0, PTR32            ;Load x3200 into R0
    PUTS                    ;Shows stringz content on screen
    LEA R0, PROMPT3         
    PUTS                    ;Shows stringz content on screen
    HALT 

SAVE1 .FILL x0
SAVE2 .FILL x0
SAVE3 .FILL x0
SAVE4 .FILL x0
PROMPT2 .STRINGZ " is already being offered this semester!"
PROMPT1 .STRINGZ " is not offered this semester."
PROMPT3 .STRINGZ " has been added to this semester's course offerings!"
PROMPT4 .STRINGZ " The entered Course Number does not exist in the current course catolog."
POSI .FILL x0A
PTR4000 .FILL x4000
PTR41 .FILL x4001 
PTR32 .FILL x3200


.END    
