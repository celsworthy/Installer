; Home all Axis in sequence
T0				;Select Nozzle 0 (T0)
G90 			;Use X Y Z Absolute positioning
G0 Z5			;Move up 5mm if homed
G0 B0			;Close Nozzle
G28 X Y			;Home X, then Y
G0 X111 Y75		;X Y Position Centre
G28 Z			;Home Z
G0 Z5			;Move up 5mm if homed

; X Speed Test
G0 X233
G0 X0
G0 X233
G0 X0
G0 X233
G0 X0
G0 X233
G0 X0
G0 X233
G0 X0
G0 X233
G0 X0
G0 X233
G0 X0
G0 X233
G0 X0
G0 X233
G0 X0
G0 X233
G0 X0
G0 X233
G0 X0
G0 X233
G0 X0
G0 X233
G0 X0
G0 X233
G0 X0
G0 X233
G0 X0
G0 X233
G0 X0
G0 X233
G0 X0
G0 X233
G0 X0
G0 X233
G0 X0
G0 X233
G0 X0

G28 X Y			;Home X, then Y
M128			;Head LED off