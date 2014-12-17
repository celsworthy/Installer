M103
M129			;Head Light on

; Home all Axis in sequence
G90 			;Use X Y Z Absolute positioning
G0 Z5			;Move up 5mm if homed
G28 Y			;Home Y
G0 Y40			;Position Y
G28 Z			;Home Z
G0 Z10			;Move up 10mm if homed
G28 X			;Home X

M109			;Wait for Nozzle to get to temp.

G0 Z30

;Un-park Filament
G36 E500 F1200

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

G36 E1000 F1200
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

G36 E1000 F1200
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

G36 E1000 F1200
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

G36 E1000 F1200
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

;After Job
M103 S0			;Nozzle heater off
M140 S0			;Bed heater off

;Finish/Abort Print
G91				;Relative positioning
G0 Z5			;Move up 5mm
G90 			;Absolute positioning
G0 X15 Y0		;Move to back corner

;Open Door
G37 S				;Unlock door (S: don't wait for safe temp)

;Every thing off
M170 S0			;Ambient control off
M107			;Fan off
M128			;Head Light off

M84				;Motors off