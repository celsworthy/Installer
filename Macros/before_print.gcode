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
M109			;Wait for Nozzle to get to temp.
M190

G36 E1000 F1200
;G1 E1 F100
M129			;Head LED on