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


; INTERRUPT SERVICE ROUTINE     (this )
    

.ORIG x1700
ST R0, SAVER0
ST R1, SAVER1
ST R2, SAVER2
ST R3, SAVER3
ST R7, SAVER7

; CHECK THE KIND OF CHARACTER TYPED AND PRINT THE APPROPRIATE PROMPT

    LDI R0, KBDR 
    
    LD R2, ASCII_Z 
    NOT R2, R2
    ADD R2, R2, #1 
    ADD R2, R2, #0 
    
    BRP ECE 
    
    LD R2, ASCII_60 
    NOT R2, R2
    ADD R2, R2, #1 
    ADD R2, R2, #0 
    
    BRP ??????
    
    LD R2, ASCII_5A
    NOT R2, R2, 
    ADD R2, R2, #1 
    ADD R2, R2, #0 
    
    BRP ?????
    
    LD R2, ASCII_40 
    NOT R2, R2 
    ADD R2, R2, #1 
    ADD R2, R2, #0 
    
    BRP?????
    
    LD R2, ASCII_39 
    NOT R2, R2 
    ADD R2, R2, #1 
    ADD R2, R2, #0 
    
    BR????
    
    LD R2, ASCII_2F 
    NOT R2, R2 
    ADD R2, R2, #1  
    ADD R2, R2, #0 
    
    BR ?????
    
    LD R2, ASCII_20 
    NOT R2, R2 
    ADD R2, R2, #1 
    ADD R2, R2, #0 
    
    BR 
    
    
    
    
;-------------------------
ECE 
    LEA R1, STRING4 
L1
    LDR R0, R1, #0 
    BRZ END 
L2 
    LDI R3, DSR 
    BRZP L2 
    STI DDR 
    ADD R1, R1, @1 
    BR L1 
END 
    HALT 

;-------------





end LD R0, SAVER0
    LD R1, SAVER1
    LD R2, SAVER2
    LD R3, SAVER3 
    LD R7, SAVER7
    RTI



ASCII_NUM .FILL x-30
ASCII_LC  .FILL x-61
ASCII_UC  .FILL x-41
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
DSR .FILL xFE04 
DDR .FILL xFE06 
ASCII_Z .FILL x7A
ASCII_60 .FILL x60
ASCII_5A .FILL x5A
ASCII_40 .FILL x40 
ASCII_39 .FILL x39
ASCII_2F .FILL x2F
ASCII_20 .FILL x20 
.END




; USER PROGRAM        

.ORIG x3000


; MAIN USER PROGRAM
; PRINT THE MESSAGE "Enter a character…" WITH A DELAY LOGIC
LEA R0, MESSAGE 
BRANCH LD R2, CNT 
    PUTS 

COUNT ADD R2, R2, #-1 
BRZ BRANCH 
BR COUNT 

CNT .FILL xFFFF
MESSAGE .STRINGZ  "Enter a character…\n"
.END