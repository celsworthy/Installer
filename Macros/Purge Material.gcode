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

M190			;wait to get to Bed temp
M109			;wait to get to nozzle temp

M129			;Head LED on
M106			;Fan on

G36 E1000 F12000 ; Un-Park

G0 X25 Y15
T0
G0 Z0.3
G0 B2
T0
G0 B2
T0
G0 B2
T0
G0 B2
T0
G0 B2
G1 E15 F50
G0 Z1.5
G1 X200 E80 F800
G0 Z0.3
G1 E15 F50
G0 B0
G0 Z8

G0 Y35
T1
G0 Z0.3
G0 B2
T1
G0 B2
T1
G0 B2
T1
G0 B2
T1
G0 B2
G1 E15 F100
G0 Z1.5
G1 X25 E150 F800
G0 Z0.3
G1 E15 F100
G0 B0
G0 Z8

G0 Y55
T0
G0 Z0.3
G0 B2
T0
G0 B2
T0
G0 B2
T0
G0 B2
T0
G0 B2
G1 E15 F50
G0 Z1.5
G1 X200 E80 F800
G0 Z0.3
G1 E15 F50
G0 B0
G0 Z8

G0 Y75
T1
G0 Z0.3
G0 B2
T1
G0 B2
T1
G0 B2
T1
G0 B2
T1
G0 B2
G1 E15 F100
G0 Z1.5
G1 X25 E150 F800
G0 Z0.3
G1 E15 F100
G0 B0
G0 Z8

G0 Y95
T0
G0 Z0.3
G0 B2
T0
G0 B2
T0
G0 B2
T0
G0 B2
T0
G0 B2
G1 E15 F50
G0 Z1.5
G1 X200 E80 F800
G0 Z0.3
G1 E15 F50
G0 B0
G0 Z8

G0 Y115
T1 
G0 Z0.3
G0 B2
T1
G0 B2
T1
G0 B2
T1
G0 B2
T1
G0 B2
G1 E15 F100
G0 Z1.5
G1 X25 E150 F800
G0 Z0.3
G1 E15 F100
G0 B0
G0 Z8

G0 Y135
T0
G0 Z0.3
G0 B2
T0
G0 B2
T0
G0 B2
T0
G0 B2
T0
G0 B2
G1 E15 F50
G0 Z1.5
G1 X200 E80 F800
G0 Z0.3
G1 E15 F50
G0 B0
G0 Z8

G0 X20 Y20 Z15

M104 S0  		;nozzle heater off
M140 S0			;Bed heater off

;Finish/Abort Print
M106			;Fan on full
G90 			;Absolute positioning
T0				;Select Nozzle 0 (T0)
G0 B0			;Close Nozzle
G91				;Relative positioning
G0 Z5			;Move up 5mm
G90 			;Absolute positioning
G0 X15 Y0		;Move to back corner

M104 S140		;reduce nozzle temp

;Open Door
G37 S			;Unlock door (S: don't wait for safe temp)

;retract code
M106   			;Fan on full
M109   			;wait to get to temp
M104 S0  		;nozzle heater off
G0 E-150   		;Retract the filament

;Every thing off
M170 S0			;Ambient control off
M103 S0			;Nozzle heater off
M140 S0			;Bed heater off
M107			;Fan off
M128			;Head Light off
M84				;Motors off
