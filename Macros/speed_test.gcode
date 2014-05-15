M129			;Head LED on
G91				;Use X, Y relative Mode
G0 Z5 	 		;Move up 5mm
G90 			;Absolute positioning
G28 X Y			;Home X, then Y
G0 X233
G0 Y150
G0 X0
G0 Y0
G0 X233 Y150
G0 Y0
G0 X0 Y150
G0 Y0
G0 X233
G0 X0 Y150
G0 X233
G0 X0 Y0		;Park X Y 0

G28 X Y			;Home X, then Y
M128			;Head LED off