M139			;Set & heat first layer Bed temp.
M190			;Wait for Bed to get to temp.

M103			;Set & heat first layer nozzle temp.

G90 			;Absolute positioning
G0 B0			;Close Nozzle
G91				;Use X, Y relative Mode
G0 Z5			;Move up 5mm
G90 			;Absolute positioning
M190			;Wait for Bed to get to temp.

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

G36 E500 F1000
;Short Purge
G0 Z3
T0
G0 B2
G1 E25 X44 F150
G0 B0
T0
G0 Z5
G0 Y10

G36 E500 F1000
G0 Y0 Z8
T1
G0 Y0
G0 Z3
T1
G0 B2
G1 E35 X21 F200
G0 B0
T1
G0 Z5
G0 Y10
G0 X110 Y75

G1 E3 F1000
M129			;Head LED on