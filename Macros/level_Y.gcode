M129			;Head LED on

; Home all Axis in sequence
T0				;Select Nozzle 0 (T0)
G90 			;Use X Y Z Absolute positioning
G0 Z5			;Move up 5mm if homed
G0 B0			;Close Nozzle
G28 X Y			;Home X, then Y
G0 X111 Y75		;X Y Position Centre
G28 Z			;Home Z
G0 Z5			;Move up 5mm if homed

	G0 X113 Y20		;Bed levelling Y Position 1
	G28 Z0			;Home Z
	G0 Z5 			;Move up 5mm
	G0 X113 Y130	;Bed levelling Y Position 2
	G28 Z0			;Home Z
	G0 Z5 			;Move up 5mm
	G39 			;level bed
G0 X0 Y0			;Home X, then Y

M104 S0			;Nozzle heater off
M106			;Fan off
M128			;Head Light off
M84				;Motor off