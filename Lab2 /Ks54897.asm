    ;Lab 2: Konghwan Shin
           
           
            .ORIG x3000
            
            LD R0, PTR1             ;Load PRT1 to R0
            LDR R1, R0, #0          ;Load R0 to R1 (Address)
            LDR R2, R1, #0          ;Road R1 to R0 (Number)
            
            AND R4, R4, #0          ;CLEAR R4
            ADD R4, R4, #8          ;Add 8bits to R4
            
KONG        ADD R2,R2, #0           ;Write R2
            BRN DONKEYKONG          ;Proceed to DonkeyKong when R2 is negative
            ADD R2, R2, R2          ;Move a bit to the left
            BR KINGKONG             ;Proceed to Kingkong 
            
DONKEYKONG  ADD R2, R2, R2          ;Move bit to the left and MSB has to be 0, LSB has to be 1
            ADD R2, R2, #1          ;Add 1 to change LSB to MSB 
            
KINGKONG    ADD R4, R4, #-1     
            BRZ ECE                 ;When R4=0, must proceed to ECE 
            BR KONG                 
            
ECE         STR R2, R1, #0          ;STR=store, therfore store R2 into R1
            HALT
            
            
            
PTR1        .FILL x4000

            .END 