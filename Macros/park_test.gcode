M103 

; Home all Axis in sequence
G90 			;Use X Y Z Absolute positioning
T0				;Select Nozzle 0 (T0)
G0 B0			;Close Nozzle
G0 Z10			;Move up 5mm if homed
G28 X Y			;Home X, then Y
G0 X111 Y75		;X Y Position Centre
G28 Z			;Home Z
G0 Z10			;Move up 5mm if homed

M109

G36 E1000 F12000

G0 Z20
T1
G0 B1
G1 E200 F200
G0 B0

;retract code
G0 E-150
;M106   			;Fan on full
;M104 S140		;reduce nozzle temp
;M109   			;wait to get to temp
;G0 E-10   		;Retract the filament
;M104 S90  		;reduce nozzle temp
;M109			;wait to get to temp
;M104 S0  		;nozzle heater off
;G0 E-140  		;Finish retract

;Finish Gcode
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

M121 E