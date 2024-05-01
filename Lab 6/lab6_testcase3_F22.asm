; EE306 Lab6 Testcase 3
;   3 elements in current semester's course listing (EE306, M408C, M408D). 2 elements in remaining course catalog (EE307, PHYS105M) 
;       - Check for EE306
;       - Check for EE307


; Current Semester's Course List 
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
        .FILL x480C ; M408D
    .END 


    ; Strings 

    ; String 1 : EE306
    .ORIG x4800
        .STRINGZ "EE306"
    .END 

    ; String 2 : M408C
    .ORIG x4806
        .STRINGZ "M408C"
    .END

    ; String 3 : M408D 
    .ORIG x480C
        .STRINGZ "M408D"
    .END


; Remaining Course Catalog List 
    ;   Nodes

    ; Head node pointer - address of head
    .ORIG x4001
        .FILL x5000 ; pointer to first node
    .END 

    ; First node 
    .ORIG x5000
        .FILL xF000 ; pointer to second node
        .FILL x5002 ; EE307
    .END 

    ; Second node
    .ORIG xF000
        .FILL x0000 ; null 
        .FILL xEF00 ; PHY105M
    .END


    ; Strings 

    ; String 1 : EE307
    .ORIG x5002
        .STRINGZ "EE307"
    .END 
    
    ; String 2 : PHYS105M 
    .ORIG xEF00
        .STRINGZ "PHY105M"
    .END





; Output Expectation

; Example 1:
; Console:
;   Type Course Number and press Enter: EE307
;   EE307 has been added to this semester’s course offerings!
;
;   -----Halting the processor -----
; Note: The node containing EE307 should be deleted from the Remaining Course Catalog linked list and inserted in the Current Semester's Course linked list

; Example 2:
; Console:
;   Type Course Number and press Enter: EE306
;   EE306 is already being offered this semester.
;
;   -----Halting the processor ----
; Note: The Current Semester's Courses and Remaining Course Catalog linked list should be unchanged after this input

