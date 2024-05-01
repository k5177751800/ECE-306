;Konghwan Shin 
;Lab 7


; OPERATING SYSTEM CODE

.ORIG x500
        
        LD R0, VEC
        LD R1, ISR
        ; (1) Initialize interrupt vector table with the starting address of ISR.
        STR R1, R0, #0

        ; (2) Set bit 14 of KBSR. [To Enable Interrupt]
        LDI R2, KBSR
        LD  R3, MASK
        
        NOT R2, R2
        AND R3, R2, R3
        NOT R3, R3
        
        STI R3, KBSR
        
	

        ; (3) Set up system stack to enter user space. So that PC can return to the main user program at x3000.
	; R6 is the Stack Pointer. Remember to Push PC and PSR in the right order. Hint: Refer State Graph
        LD  R3, PSR
        LD  R4, PC
        
        LD R6, PC
        
        ADD R6, R6, #-1
        STR R3, R6, #0
        ADD R6, R6, #-1
        STR R4, R6, #0


        ; (4) Enter user Program.
        RTI
        
VEC     .FILL x0180
ISR     .FILL x1700
KBSR    .FILL xFE00
MASK    .FILL xBFFF
PSR     .FILL x8002
PC      .FILL x3000

.END


; INTERRUPT SERVICE ROUTINE

.ORIG x1700
ST R0, SAVER0
ST R1, SAVER1
ST R2, SAVER2
ST R3, SAVER3
ST R7, SAVER7

; CHECK THE KIND OF CHARACTER TYPED AND PRINT THE APPROPRIATE PROMPT

    LDI R0, KBDR 
    
    LD R1, ASCII58
    NOT R1, R1 
    ADD R1, R1, #1 
    ADD R3, R1, R0 
    BRZ FINISH 
    
    LD R1, ASCII78 
    NOT R1, R1
    ADD R1, R1, #1 
    ADD R3, R1, R0 
    BRZ FINISH 
    
    LD R1, ASCII_LC 
    ADD R3, R1, R0 
    BRZP ALPHABET2 
    
    LD R1, ASCII_UC 
    ADD R3, R1, R0 
    BRZP ALPHABET1  
    
    LD R1, ASCII_NUM 
    ADD R3, R1, R0 
    BRZP DECIMAL2 
    BR WRONG 
    
    
ALPHABET2
    LD R1, ASCII7A 
    NOT R1, R1 
    ADD R1, R1, #1 
    ADD R3, R1, R0 
    BRNZ INDALPHA 
    BR WRONG
ALPHABET1 
    LD R1, ASCII5A 
    NOT R1, R1 
    ADD R1, R1, #1 
    ADD R3, R1, R0 
    BRNZ INDALPHA 
    BR WRONG 
DECIMAL2 
    LD R1, ASCII39 
    NOT R1, R1
    ADD R1, R1, #1
    ADD R3, R1, R0 
    BRNZ DECIMAL  
    BR WRONG 

INDALPHA
    LEA R3, STRING1 
    BR PS 
DECIMAL 
    LEA R3, STRING2 
    BR PS 
WRONG 
    LEA R3, STRING3 
    BR PS 

FINISH 
    LEA R3, STRING4 
PS3 
    LDR R0, R3, #0 
    BRZ GONE 
PS4 
    LDI R1, DSR
    BRZP PS4
    STI R0, DDR
    ADD R3, R3, #1 
    BR PS3

GONE 
    HALT 

PS 
    LDR R0, R3, #0 
    BRZ end
PS2 
    LDI R1, DSR 
    BRZP PS2 
    STI R0, DDR
    ADD R3, R3, #1 
    BR PS 
    

end LD R0, SAVER0
    LD R1, SAVER1
    LD R2, SAVER2
    LD R3, SAVER3 
    LD R7, SAVER7
    RTI

DSR .FILL xFE04 
DDR .FILL xFE06
ASCII58 .FILL x58 
ASCII78 .FILL x78 
ASCII39 .FILL x39 
ASCII5A .FILL x5A 
ASCII_NUM .FILL x-30
ASCII_LC  .FILL x-61
ASCII_UC  .FILL x-41
ASCII7A .FILL X7A 
KBDR .FILL xFE02
STRING1 .STRINGZ "\nUser has entered a letter of the alphabet!\n"
STRING2 .STRINGZ "\nUser has entered a decimal digit!\n"
STRING3 .STRINGZ "\nERROR: User input is invalid!\n"
STRING4 .STRINGZ "\n---------- User has Exit the Program ----------\n"
SAVER0 .BLKW x1
SAVER1 .BLKW x1
SAVER2 .BLKW x1
SAVER3 .BLKW x1
SAVER7 .BLKW x1
.END




; USER PROGRAM

.ORIG x3000


; MAIN USER PROGRAM
; PRINT THE MESSAGE "Enter a character…" WITH A DELAY LOGIC


LEA R0, MESSAGE 
BRANCH 
    LD R2, CNT 
    PUTS 

COUNT 
    ADD R2, R2, #-1 
    BRZ BRANCH 
    BR COUNT 



CNT .FILL xFFFF
MESSAGE .STRINGZ  "Enter a character…\n"
.END