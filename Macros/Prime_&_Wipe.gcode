; Home all Axis in sequence
T0				;Select Nozzle 0 (T0)
G90 			;Use X Y Z Absolute positioning
G0 Z5			;Move up 5mm if homed
G0 B0			;Close Nozzle
G28 X Y			;Home X, then Y
G0 X111 Y75		;X Y Position Centre
G28 Z			;Home Z
G0 Z5			;Move up 5mm if homed

G0 Z10 			;Move up 10mm

;Unretract
G0 E130
G36 E30 F100

T0				;Select Nozzle 0 (T0)
	G0 X0 Y0
	G0 X10
	G0 Z4
	G0 B1
	G1 E5 F100
	G0 B0
	G0 Y10
	G0 Z6
	G0 Y0
	G0 Z4
	G0 B1
	G1 E5 F100
	G0 B0
	G0 Y10
	G0 Z6
T1				;Select Nozzle 1 (T1)
	G0 Y0
	G0 X60
	G0 Z4
	G0 B1
	G1 E5 F200
	G0 B0
	G0 Y10
	G0 Z6
	G0 Y0
	G0 Z4
	G0 B1
	G1 E5 F200
	G0 B0
	G0 Y10
	G0 Z10

Go X0 Y0			;Home

;retract code
M106   			;Fan on full
M104 S140		;reduce nozzle temp
M109   			;wait to get to temp
M104 S0  		;nozzle heater off
G0 E-150   		;Retract the filament

G37 S			;Unlock door (S: don't wait for safe temp)

M170 S0			;Ambient control off
M107			;Fan off
M128			;Head Light off
M84				;Motor off