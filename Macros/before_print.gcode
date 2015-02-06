M83				;Set Extruder to Relative moves
M139			;Set & heat first layer Bed temp.

; Home all Axis in sequence
G90 			;Use X Y Z Absolute positioning
G0 Z5			;Move up 5mm if homed
G28 Y			;Home Y
G0 Y40			;Position Y
T0				;Select Nozzle 0
G39				;Clear the bed levelling points
G28 Z			;Home Z
G0 Z10			;Move up 10mm if homed
G28 X			;Home X

M190			;Wait for Bed to get to temp.
M103			;Set & heat first layer nozzle temp.
M109			;Wait for Nozzle to get to temp.
M170			;Set Ambient temp.

;Nozzle fault detection
T0				;Select nozzle 0
T1				;Select nozzle 1
T0				;Select nozzle 0

;Short Purge T0
G0 Y-6 X14 Z10
T0
G0 Z3
G1 Y-4 F400
G36 E500 F400
G0 B2
G1 E2 F250
G1 E30 X36 F250
G0 B0
G0 Z5
G0 Y3

;Short Purge T1
G0 Y-6 Z8
T1
G0 Z4
G1 Y-4 F400
G36 E500 F400
G0 B2
G1 E4 F300
G1 E35 X14 F300
G0 B0
G0 Z5
G0 Y3

; do the first two bed levelling points, which are also used to level the gantry
T0			;Select Nozzle 0 (T0)
G0 X20 Y75		;Level Gantry Position 1
G28 Z			;Home Z
G0 Z4 			;Move up 4mm
G0 X190 Y75		;Level Gantry Position 2
G28 Z			;Home Z
G0 Z4 			;Move up 4mm
G38 			;Level gantry

; do the remaining 7 bed levelling points
G0 Y20
G28 Z
G0 Z2
G0 X105
G28 Z
G0 Z2
G0 X20
G28 Z
G0 Z2
G0 Y130
G28 Z
G0 Z2
G0 X105
G28 Z
G0 Z2
G0 X190
G28 Z
G0 Z2
G0 X105 Y75
G28 Z
G0 Z2

G39 S0.5		;set washout over the first 2mm

G0 X105 Y75 Z5

G1 E3 F1000
M129			;Head LED on