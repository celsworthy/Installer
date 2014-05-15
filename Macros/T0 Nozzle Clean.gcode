M103
M129			;Head Light on

; Home all Axis in sequence
T0				;Select Nozzle 0 (T0)
G90 			;Use X Y Z Absolute positioning
G0 Z5			;Move up 5mm if homed
G0 B0			;Close Nozzle
G28 X Y			;Home X, then Y
G0 X111 Y75		;X Y Position Centre
G28 Z			;Home Z
G0 Z5			;Move up 5mm if homed

M109			;Wait for Nozzle to get to temp.

G0 Z30

; Nozzle Clean, repeat 20 times
T0
G0 B2
G0 B0
T0
G0 B2
G0 B0
T0
G0 B2
G0 B0
T0
G0 B2
G0 B0
T0
G0 B2
G0 B0
T0
G0 B2
G0 B0
T0
G0 B2
G0 B0
T0
G0 B2
G0 B0
T0
G0 B2
G0 B0
T0
G0 B2
G0 B0
T0
G0 B2
G0 B0
T0
G0 B2
G0 B0
T0
G0 B2
G0 B0
T0
G0 B2
G0 B0
T0
G0 B2
G0 B0
T0
G0 B2
G0 B0
T0
G0 B2
G0 B0
T0
G0 B2
G0 B0
T0
G0 B2
G0 B0
T0
G0 B2
G0 B0

M104 S0			;Nozzle heater off
M106			;Fan off
M128			;Head Light off
M84				;Motor off