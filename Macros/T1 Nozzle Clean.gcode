M103
M129			;Head Light on

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

M109			;Wait for Nozzle to get to temp.

G0 Y-6 X36 Z10
T1
G0 Z2
G1 Y-4 F400

;Un-park Filament

; Nozzle Clean, repeat 10 times
G36 E500 F1200
T1
G0 B2
T1
G0 B2
T1
G0 B2
T1
G0 B2

G36 E1000 F400
T1
G0 B2
T1
G0 B2
T1
G0 B2
T1
G0 B2

G36 E1000 F400
T1
G0 B2
T1
G0 B2
T1
G0 B2
T1
G0 B2

G36 E1000 F400
T1
G0 B2
T1
G0 B2
T1
G0 B2
T1
G0 B2

G36 E1000 F400
T1
G0 B2
T1
G0 B2
T1
G0 B2
T1
G0 B2

G36 E1000 F400
T1
G0 B2
T1
G0 B2
T1
G0 B2
T1
G0 B2

G36 E1000 F400
T1
G0 B2
T1
G0 B2
T1
G0 B2
T1
G0 B2

G36 E1000 F400
T1
G0 B2
T1
G0 B2
T1
G0 B2
T1
G0 B2

G36 E1000 F400
T1
G0 B2
T1
G0 B2
T1
G0 B2
T1
G0 B2

G36 E1000 F400
T1
G0 B2
T1
G0 B2
T1
G0 B2
T1
G0 B2

G1 E5 F400 		;Prime Nozzle

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



;After Job
M103 S0			;Nozzle heater off
M140 S0			;Bed heater off

;Open Door
G37 S			;Unlock door (S: don't wait for safe temp)

;Every thing off
M170 S0			;Ambient control off
M107			;Fan off
M128			;Head Light off

M84				;Motors off