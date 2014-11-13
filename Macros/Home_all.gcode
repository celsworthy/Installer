; Home all Axis in sequence
G90 			;Use X Y Z Absolute positioning
G0 Z10			;Move up 5mm if homed
G28 X Y			;Home X, then Y
G0 X111 Y75		;X Y Position Centre
G28 Z			;Home Z
G0 Z10			;Move up 5mm if homed

M84				;Motors Off