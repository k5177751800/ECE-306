; EE306 Lab1 Testcase 2
;

    .ORIG   x3100
    
    .FILL   x3160   ; location x3100
    .FILL   x0003   ; location x3101
    
    .END
    
    
    .ORIG   x3160
    
    .FILL   x0064   ; ASCII code for 'd'
    .FILL   x0077   ; ASCII code for 'w'
    .FILL   x0048   ; ASCII code for 'H'
    
    ; after program is executed location x3160 should get x0061
    ; after program is executed location x3161 should get x0074
    ; after program is executed location x3162 should get x0045
    
    .END