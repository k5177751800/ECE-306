;Lab 5 
;Konghwan Shin 

    .ORIG x3000
;
    LEA R0, PROMPT      ;Prompt loaded into R0 
    PUTS                ;Shows stringz content on screen 
;
    LD R1, NEG0A        ;Load -(asci code of 0A) into R1 
    LD R2, PTR32        ;load x3200 into R2 
    
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
    BRZ NULL            ;When it does not equal 0 
    LDR R1, R0, #1      ;Load mem(R0+1) into R1 
    LD R2, PTR32        ;Load x3200 into R2
    
    ST R1, SAVE1
    ST R2, SAVE2 
    ST R5, SAVE3 
    ST R6, SAVE4
    
;Subroutine 
MATCH 
        LDR R5, R1, #0      ;R5=MEM(R1)
        LDR R6, R2, #0      ;R6=MEM(R2)
        BRZ YES 
        
        NOT R6, R6          ;Negate R6 
        ADD R6, R6, #1      ;PC+1 
        ADD R5, R5, R6      ;Add negated value of R6 and R5 and store it at R5
        BRZ YES2 
        
        LD R1, SAVE1 
        LD R2, SAVE2 
        LD R5, SAVE3 
        LD R6, SAVE4 
        LDR R0, R0, #0 
        
        BR LOOP 
MATCHING
    LD R0, PTR32        ;Load R0=x3200
    PUTS
    LEA R0, PROMPT2     ;is offered this semester!
    PUTS
    HALT
NULL 
    LD R0, PTR32            ;load x3200 into r0 
    PUTS
    LEA R0, PROMPT1         ;is not offered this semester
    PUTS 
    HALT 
    
YES 
        ADD R6, R5, R6 
        BRZ MATCHING 
        LD R1, SAVE1 
        LD R2, SAVE2 
        LD R5, SAVE3 
        LD R6, SAVE4 
        LDR R0, R0, #0 
        BR LOOP

YES2 
        ADD R1, R1, #1 
        ADD R2, R2, #1 
        BR MATCH

SAVE1 .FILL x0
SAVE2 .FILL x0
SAVE3 .FILL x0
SAVE4 .FILL x0
PROMPT2 .STRINGZ " is offered this semester!"
PROMPT1 .STRINGZ " is not offered this semester."
NODE0 .FILL x4000
NEG0A .FILL x-0A
POSI .FILL x0A
PTR4000 .FILL x4000
PTR32 .FILL x3200
PROMPT .STRINGZ "Type Course Number and press Enter: "

.END    
