; Home all Axis in sequence
G90 			;Use X Y Z Absolute positioning
G0 Z5			;Move up 5mm if homed
G28 Y			;Home Y
G0 Y40			;Position Y
G28 Z			;Home Z
G0 Z10			;Move up 10mm if homed
G28 X			;Home X

; Level Gantry
G0 X20 Y75		;Level Gantry Position 1
G28 Z			;Home Z
G0 Z5 			;Move up 5mm
G0 X190 Y75		;Level Gantry Position 2
G28 Z			;Home Z
G0 Z5 			;Move up 5mm
G38 			;Level gantry
G0 X20 Y40 Z10	;Position

M190			;wait to get to Bed temp
M109			;wait to get to nozzle temp

M129			;Head LED on
M106			;Fan on

G36 E1000 F12000 ; Un-Park

G0 X15 Y15
T0
G0 Z0.3
G0 B2
T0
T0
T0
T0
G1 E15 F50
G0 Z1.5
G1 X195 E80 F800
G0 Z0.3
G1 E15 F50
G0 B0
G0 Z8

G0 Y35
T1
G0 Z0.3
G0 B2
T1
T1
T1
T1
G0 B2
G1 E15 F100
G0 Z1.5
G1 X15 E150 F800
G0 Z0.3
G1 E15 F100
G0 B0
G0 Z8

G0 Y55
T0
G0 Z0.3
G0 B2
T0
T0
T0
T0
G0 B2
G1 E15 F50
G0 Z1.5
G1 X195 E80 F800
G0 Z0.3
G1 E15 F50
G0 B0
G0 Z8

G0 Y75
T1
G0 Z0.3
G0 B2
T1
T1
T1
T1
G1 E15 F100
G0 Z1.5
G1 X15 E150 F800
G0 Z0.3
G1 E15 F100
G0 B0
G0 Z8

G0 Y95
T0
G0 Z0.3
G0 B2
T0
T0
T0
T0
G1 E15 F50
G0 Z1.5
G1 X195 E80 F800
G0 Z0.3
G1 E15 F50
G0 B0
G0 Z8

G0 Y115
T1 
G0 Z0.3
G0 B2
T1
T1
T1
T1
G1 E15 F100
G0 Z1.5
G1 X15 E150 F800
G0 Z0.3
G1 E15 F100
G0 B0
G0 Z8

G0 Y135
T0
G0 Z0.3
G0 B2
T0
T0
T0
T0
G1 E15 F50
G0 Z1.5
G1 X195 E80 F800
G0 Z0.3
G1 E15 F50
G0 B0
G0 Z8

G0 X20 Y20 Z15

;After Job
M103 S0			;Nozzle heater off
M140 S0			;Bed heater off

;Finish/Abort Print
G91				;Relative positioning
G0 Z5			;Move up 5mm
G90 			;Absolute positioning
G0 X15 Y0		;Move to back corner

;Open Door
G37 S				;Unlock door (S: don't wait for safe temp)

;Every thing off
M170 S0			;Ambient control off
M107			;Fan off
M128			;Head Light off

M84				;Motors off
M84				;Motors off
