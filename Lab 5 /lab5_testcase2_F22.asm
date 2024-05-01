; EE306 Lab5 Testcase 2
; No element list 


;   Nodes

; Head node pointer - address of head
.ORIG x4000
    .FILL x0000 ; pointer to first node
.END 


; Strings : these don't matter as there are no nodes

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
;   EE306 is not offered this semester.
;
;   -----Halting the processor -----

; Example 2: 
; Console:
;   Type Course Number and press Enter: EE319K
;   EE319K is not offered this semester.
;
;   -----Halting the processor ----

