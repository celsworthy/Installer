M139			;Set & heat first layer Bed temp.
M83				;Relative Extrusion
G90 			;Absolute positioning
T0				;Select Nozzle 0 (T0)
G0 B0			;Close Nozzle
G28 Y			;Home Y
G0 Y42			;move to metal clip
G28 Z			;Home Z
G0 Z5			;Move Z up
G28 X			;Home X

M103			;Set & heat first layer nozzle temp.
M109			;Wait for Nozzle to get to temp.
M170			;Set Ambient temp.

;Short Purge T0
G0 Y0 X20 Z10
G36 E500 F1000
G0 Z2
G1 Y1.5 F400
T0
G0 B2
G1 E2 F250
G1 E30 X43 F250
G0 B0
G0 Z5
G0 Y10
;Short Purge T1
G36 E500 F1000
G0 Y0 Z8
T1
G0 Y0
G0 Z3
G1 Y1.5 F400
G0 B2
G1 E4 F300
G1 E35 X20 F300
G0 B0
G0 Z5
G0 Y10

;Bed Levelling
T0				;Select Nozzle 0 (T0)
G0 X30 Y75		;Level Gantry Position 1
G28 Z			;Home Z
G0 Z5 			;Move up 5mm
G0 X190 Y75		;Level Gantry Position 2
G28 Z?			;Probe Z
G38 			;Level gantry
G0 X113 Y20		;Bed levelling Y Position 1
G28 Z			;Home Z
G0 Z2 			;Move up 5mm
G0 X113 Y130	;Bed levelling Y Position 2
G28 Z?			;Probe Z
G39 S0.5		;level bed and washout transform over the first 2mm

G0 X110 Y75 Z5
M190			;Wait for Bed to get to temp.

G1 E3 F1000
M129			;Head LED on