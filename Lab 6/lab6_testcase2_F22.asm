; EE306 Lab6 Testcase 2
;   Empty current semester's course listing, 1 element (EE306) in remaining course catalog. 
;     - Check for EE306


; Current Semester's Course List  
    ;   Nodes

    ; Head node pointer - address of head
    .ORIG x4000
        .FILL x0000 ; empty current semester's course list
    .END 

; Remaining Course Catalog List 
    ;   Nodes

    ; Head node pointer - address of head
    .ORIG x4001
        .FILL x5000 ; pointer to first node
    .END 

    ; First node 
    .ORIG x5000
        .FILL x0000 ; null 
        .FILL x5002 ; EE306
    .END 


    ; Strings 

    ; String 1 : EE306
    .ORIG x5002
        .STRINGZ "EE306"
    .END 


; Garbage data 
    ; Strings 

    ; String 1 : EE306
    .ORIG x4800
        .STRINGZ "EE306"
    .END 

    ; String 2 : M408C
    .ORIG x4806
        .STRINGZ "M408C"
    .END

    ; String 3 : PHY105M 
    .ORIG x480C
        .STRINGZ "PHY105M"
    .END



; Output Expectation

; Example 1:
; Console:
;   Type Course Number and press Enter: EE306
;   EE306 has been added to this semester’s course offerings!
;
;   -----Halting the processor -----
; Note: The node containing EE306 should be deleted from the Remaining Course Catalog linked list and inserted in the Current Semester's Course linked list

; Example 2: 
; Console:
;   Type Course Number and press Enter: M408C
;   The entered Course Number does not exist in the current course catalog.
;
;   -----Halting the processor ----
; Note: The Current Semester's Courses and Remaining Course Catalog linked list should be unchanged after this input
