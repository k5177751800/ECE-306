; EE306 Lab1 Testcase 3
;

    .ORIG   x3100
    
    .FILL   x4000   ; location x3100
    .FILL   xABCD   ; location x3101 : Key is in bits [1:0]
    
    .END
    
    
    .ORIG   x4000
    
    .FILL   x004B   ; ASCII code for 'K'
    .FILL   x0050   ; ASCII code for 'P'
    .FILL   x005A   ; ASCII code for 'Z'
    
    ; after program is executed location x4000 should get x004A
    ; after program is executed location x4001 should get x004F
    ; after program is executed location x4002 should get x0059
    
    .END