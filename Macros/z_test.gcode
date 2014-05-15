; Home all Axis in sequence
T0				;Select Nozzle 0 (T0)
G90 			;Use X Y Z Absolute positioning
G0 Z5			;Move up 5mm if homed
G0 B0			;Close Nozzle
G28 X Y			;Home X, then Y
G0 X111 Y75		;X Y Position Centre
G28 Z			;Home Z
G0 Z5			;Move up 5mm if homed

;Level Gantry
	G0 X30 Y75		;Level Gantry Position 1
	G28 Z0			;Home Z
	G0 Z5 			;Move up 5mm
	G0 X190 Y75		;Level Gantry Position 2
	G28 Z0			;Home Z
	G0 Z5 			;Move up 5mm
	G38 			;Level gantry
G0 X Y			;Home X, then Y

; Z Speed Test
G0 X120 Y75
G28 Z
G0 Z100
G0 Z10
G28 Z
G0 Z5

;Level Gantry
	G0 X30 Y75		;Level Gantry Position 1
	G28 Z0			;Home Z
	G0 Z5 			;Move up 5mm
	G0 X190 Y75		;Level Gantry Position 2
	G28 Z0			;Home Z
	G0 Z5 			;Move up 5mm
	G38 			;Level gantry
G0 X Y			;Home X, then Y
	
M84
M128			;Head LED off