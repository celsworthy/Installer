; Home all Axis in sequence
T0				;Select Nozzle 0 (T0)
G90 			;Use X Y Z Absolute positioning
G0 Z5			;Move up 5mm if homed
G0 B0			;Close Nozzle
G28 X Y			;Home X, then Y
G0 X111 Y75		;X Y Position Centre
G28 Z			;Home Z
G0 Z5			;Move up 5mm if homed

; Y Speed Test
G0 Y154
G0 Y0
G0 Y154
G0 Y0
G0 Y154
G0 Y0
G0 Y154
G0 Y0
G0 Y154
G0 Y0
G0 Y154
G0 Y0
G0 Y154
G0 Y0
G0 Y154
G0 Y0
G0 Y154
G0 Y0
G0 Y154
G0 Y0
G0 Y154
G0 Y0
G0 Y154
G0 Y0
G0 Y154
G0 Y0
G0 Y154
G0 Y0
G0 Y154
G0 Y0
G0 Y154
G0 Y0
G0 Y154
G0 Y0
G0 Y154
G0 Y0
G0 Y154
G0 Y0

G28 X Y		;Home X, then Y
M128			;Head LED off

M84				;Motors off