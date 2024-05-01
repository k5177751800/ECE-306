; EE306 Lab5 Testcase 1
; Two element list 


;   Nodes

; Head node pointer - address of head
.ORIG x4000
    .FILL x5002 ; pointer to first node
.END 

; First node 
.ORIG x5002
    .FILL x5004 ; pointer to second node
    .FILL x4200 ; EE306
.END 

; Second node 
.ORIG x5004
    .FILL x0000 ; null 
    .FILL x4206 ; EE319K
.END 


; Strings 

; String 1 : EE306
.ORIG x4200
    .STRINGZ "EE306"
.END 

; String 2 : EE319K
.ORIG x4206
    .STRINGZ "EE319K"
.END



; Output Expectation

; Example 1:
; Console:
;   Type Course Number and press Enter: EE306
;   EE306 is offered this semester!
;
;   -----Halting the processor ----

; Example 2:
; Console:
;   Type Course Number and press Enter: EE319
;   EE319 is not offered this semester.
;
;   -----Halting the processor ----- 

; Example 3:
; Console:
;   Type Course Number and press Enter: EE306Z
;   EE306Z is not offered this semester.
;
;   -----Halting the processor ----
