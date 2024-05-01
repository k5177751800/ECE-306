; EE306 Lab1 Testcase 1
;

    .ORIG   x3100
    
    .FILL   x3150   ; location x3100
    .FILL   x0002   ; location x3101
    
    .END
    
    
    .ORIG   x3150
    
    .FILL   x004E   ; ASCII code for 'N'
    .FILL   x0063   ; ASCII code for 'c'
    .FILL   x0064   ; ASCII code for 'd'
    
    ; after program is executed location x3150 should get x004C
    ; after program is executed location x3151 should get x0061
    ; after program is executed location x3152 should get x0062
    
    .END