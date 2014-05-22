; Home all Axis in sequence
G90 			;Use X Y Z Absolute positioning
T0				;Select Nozzle 0 (T0)
G0 B0			;Close Nozzle
G0 Z10			;Move up 5mm if homed
G28 X Y			;Home X, then Y
G0 X111 Y75		;X Y Position Centre
G28 Z			;Home Z
G0 Z10			;Move up 5mm if homed