; EE306 Lab5 Testcase 3
; Same input as lab document 


;   Nodes

; Head node pointer - address of head
.ORIG x4000
    .FILL x4002 ; pointer to first node
.END 

; First node 
.ORIG x4002
    .FILL x4004 ; pointer to second node
    .FILL x4800 ; EE306
.END 

; Second node 
.ORIG x4004
    .FILL x4006 ; pointer to third node 
    .FILL x4806 ; M408C
.END 

; Third node
.ORIG x4006
    .FILL x0000 ; null
    .FILL x480C ; PHY105M
.END 


; Strings 

; String 1 : XY123
.ORIG x4800
    .STRINGZ "EE306"
.END 

; String 2 : AB789
.ORIG x4806
    .STRINGZ "M408C"
.END

; String 3 : PQ567
.ORIG x480C 
    .STRINGZ "PHY105M"
.END


; Output Expectation

; Example 1:
; Console:
;   Type Course Number and press Enter: EE307E
;   EE307E is not offered this semester.
;
;   -----Halting the processor -----

; Example 2: 
; Console:
;   Type Course Number and press Enter: EE306
;   EE306 is offered this semester!
;
;   -----Halting the processor ----

; Example 3:
; Console:
;   Type Course Number and press Enter: PHY105M
;   PHY105M is offered this semester!
;
;   -----Halting the processor -----




