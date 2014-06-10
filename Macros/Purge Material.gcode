M104
M140 S90

; Home all Axis in sequence
T0				;Select Nozzle 0 (T0)
G90 			;Use X Y Z Absolute positioning
G0 Z8			;Move up 5mm if homed
G0 B0			;Close Nozzle
G28 X Y			;Home X, then Y
G0 X111 Y75		;X Y Position Centre
G28 Z			;Home Z
G0 Z8			;Move up 5mm if homed

; Level Gantry
	G0 X30 Y75		;Level Gantry Position 1
	G28 Z0			;Home Z
	G0 Z8 			;Move up 5mm
	G0 X190 Y75		;Level Gantry Position 2
	G28 Z0			;Home Z
	G0 Z8 			;Move up 5mm
	G38 			;Level gantry
G0 X0 Y0			;Home X, then Y

M129			;Head LED on
M106			;Fan on

M109
M190

; Un-Park
G36 E1000 F12000
; G1 E2 F75	

G0 X30

G0 Y20
T0
G0 Z0.3
G0 B2 
G1 E15 F50
G0 Z2
G1 X200 E80 F800
G0 Z0.3
G1 E15 F50
G0 B0
G0 Z8

G0 Y40
T0
G0 Z0.3
G0 B2
G1 E15 F50
G0 Z2
G1 X31 E80 F800
G0 Z0.3
G1 E15 F50
G0 B0
G0 Z8

G0 Y60
T0
G0 Z0.3
G0 B2
G1 E15 F50
G0 Z2
G1 X199 E80 F800
G0 Z0.3
G1 E15 F50
G0 B0
G0 Z8

G0 Y80
T1
G0 Z0.3
G0 B2
G1 E15 F100
G0 Z2
G1 X31 E120 F800
G0 Z0.3
G1 E15 F100
G0 B0
G0 Z8

G0 Y100
T1
G0 Z0.3
G0 B2
G1 E15 F100
G0 Z2
G1 X200 E120 F800
G0 Z0.3
G1 E15 F100
G0 B0
G0 Z8

G0 Y120
T1 
G0 Z0.3
G0 B2
G1 E15 F100
G0 Z2
G1 X30 E120 F800
G0 Z0.3
G1 E15 F100
G0 B0
G0 Z10

G0 E-150 		;Retract the filament

G37 S

M104 S0			;Nozzle heater off
M140 S0			;Bed heater off
M106			;Fan off
M128			;Head Light off
M84				;Motor off