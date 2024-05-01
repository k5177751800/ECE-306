; EE306 Lab6 Testcase 1
; Same as lab document. 
;   3 elements in current semester's course listing (EE306, M408C, PHY105M), 1 element in remaining course catalog (EE307E)
;     - Check for EE307E, HIS698, EE306


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


; Remaining Course Catalog List 
    ;   Nodes

    ; Head node pointer - address of head
    .ORIG x4001
        .FILL x5000 ; pointer to first node
    .END 

    ; First node 
    .ORIG x5000
        .FILL x0000 ; null 
        .FILL x5002 ; EE307E
    .END 


    ; Strings 

    ; String 1 : EE307E
    .ORIG x5002
        .STRINGZ "EE307E"
    .END 



; Output Expectation

; Example 1:
; Console:
;   Type Course Number and press Enter: EE307E
;   EE307E has been added to this semester’s course offerings!
;
;   -----Halting the processor -----
; Note: The node containing EE307E should be deleted from the Remaining Course Catalog linked list and inserted in the Current Semester's Course linked list

; Example 2: 
; Console:
;   Type Course Number and press Enter: HIS698
;   The entered Course Number does not exist in the current course catalog.
;
;   -----Halting the processor ----
; Note: The Current Semester's Courses and Remaining Course Catalog linked list should be unchanged after this input

; Example 3:
; Console:
;   Type Course Number and press Enter: EE306
;   EE306 is already being offered this semester.
;
;   -----Halting the processor ----
; Note: The Current Semester's Courses and Remaining Course Catalog linked list should be unchanged after this input
