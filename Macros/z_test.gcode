M129			;Head LED on
G0 B0
T0

; Home all Axis in sequence
G90 			;Use X Y Z Absolute positioning
G0 Z10			;Move up 10mm if homed
G28 Y			;Home Y
G0 Y75			;Position Y
G28 Z			;Home Z
G0 Z10			;Move up 10mm if homed
G28 X			;Home X

; Level Gantry
G0 X20 Y75		;Level Gantry Position 1
G28 Z			;Home Z
G0 Z5 			;Move up 5mm
G0 X190 Y75		;Level Gantry Position 2
G28 Z			;Probe Z
G0 Z10 			;Move up 5mm
G38 			;Level gantry

; Z Speed Test
G0 X105 Y75
G28 Z
G0 Z100
G0 Z10
G28 Z
G0 Z5

; Level Gantry
G0 X20 Y75		;Level Gantry Position 1
G28 Z			;Home Z
G0 Z5 			;Move up 5mm
G0 X190 Y75		;Level Gantry Position 2
G28 Z			;Home Z
G0 Z5 			;Move up 5mm
G38 			;Level gantry
G0 X20 Z10		;Position
	
;After Job
M103 S0			;Nozzle heater off
M140 S0			;Bed heater off

;Open Door
G37 S				;Unlock door (S: don't wait for safe temp)

;Every thing off
M170 S0			;Ambient control off
M107			;Fan off
M128			;Head Light off

M84				;Motors off