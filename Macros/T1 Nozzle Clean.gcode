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

;Un-park Filament
G36 E500 F1200

; Nozzle Clean, repeat 20 times
T1
G0 B2
G0 B0
T1
G0 B2
G0 B0
T1
G0 B2
G0 B0
T1
G0 B2
G0 B0

G36 E1000 F1200
T1
G0 B2
G0 B0
T1
G0 B2
G0 B0
T1
G0 B2
G0 B0
T1
G0 B2
G0 B0

G36 E1000 F1200
T1
G0 B2
G0 B0
T1
G0 B2
G0 B0
T1
G0 B2
G0 B0
T1
G0 B2
G0 B0

G36 E1000 F1200
T1
G0 B2
G0 B0
T1
G0 B2
G0 B0
T1
G0 B2
G0 B0
T1
G0 B2
G0 B0

G36 E1000 F1200
T1
G0 B2
G0 B0
T1
G0 B2
G0 B0
T1
G0 B2
G0 B0
T1
G0 B2
G0 B0

M103 S0			;Nozzle heater off
M140 S0			;Bed heater off

;retract code
M106   			;Fan on full
M104 S140		;reduce nozzle temp
M109   			;wait to get to temp
M104 S0  		;nozzle heater off
G0 E-150   		;Retract the filament

;Open Door
G37 S			;Unlock door (S: don't wait for safe temp)

;Every thing off
M170 S0			;Ambient control off
M103 S0			;Nozzle heater off
M140 S0			;Bed heater off
M107			;Fan off
M128			;Head Light off
M84				;Motors off