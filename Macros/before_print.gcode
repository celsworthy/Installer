M103			;Set & heat first layer nozzle temp.

G90 			;Absolute positioning
G0 B0			;Close Nozzle
G91				;Use X, Y relative Mode
G0 Z5			;Move up 5mm
G90 			;Absolute positioning
G28 X Y			;Home X, then Y

M109			;Wait for Nozzle to get to temp.

T0				;Select Nozzle 0 (T0)
G0 X30 Y75		;Level Gantry Position 1
G28 Z			;Home Z
G0 Z5 			;Move up 5mm
G0 X190 Y75		;Level Gantry Position 2
G28 Z			;Home Z
G0 Z5 			;Move up 5mm
G38 			;Level gantry
G0 X113 Y20		;Bed levelling Y Position 1
G28 Z			;Home Z
G0 Z5 			;Move up 5mm
G0 X113 Y130	;Bed levelling Y Position 2
G28 Z			;Home Z
G0 Z5 			;Move up 5mm
G39 			;level bed

G0 Y0 X21 Z10
M106

;Un-park Filament
M906 X0.1 Y0.1
G36 E500 F1000
M906 X1.1 Y1.1

;Short Purge
G0 Z3
T0
G0 B2
G1 E15 X44 F100
G0 B0
T0
T0
G0 Z5
G0 Y10

G0 Y0 Z10
T1
G0 Y0
G0 Z3
T1
G0 B2
G1 E15 X21 F100
G0 B0
T1
T1
G0 Z5
G0 Y10

M129			;Head LED on
M190			;Wait for Bed to get to temp.