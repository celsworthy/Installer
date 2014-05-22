G90 			;Absolute positioning
G0 B0			;Close Nozzle
G91				;Relative positioning
G0 Z5			;Move up 5mm
G90 			;Absolute positioning
M128			;Head LED off
M104 S0			;Heated nozzle off
M106			;Fan on full
G0 X15 Y0		;Move to back corner
G37	S			;Open door
M107			;Fan off
M84				;Disable axes