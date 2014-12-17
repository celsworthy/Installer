; Home all Axis in sequence
G90 			;Use X Y Z Absolute positioning
G0 Z5			;Move up 5mm if homed
G28 Y			;Home Y
G0 Y40			;Position Y
G28 Z			;Home Z
G0 Z10			;Move up 10mm if homed
G28 X			;Home X

M103			;Set & heat first layer nozzle temp.
M109			;Wait for Nozzle to get to temp.

;Short Purge T0
G0 Y-6 X14 Z10
G0 Z2
G1 Y-4 F400
T0
G36 E500 F1000
G0 B2
G1 E2 F250
G1 E30 X37 F250
G0 B0
G0 Z5
G0 Y8

;Short Purge T1
G0 Y-6 Z8
T1
G0 Y0
G0 Z3
G1 Y-4 F400
G36 E500 F1000
G0 B2
G1 E4 F300
G1 E35 X14 F300
G0 B0
G0 Z5
G0 Y8

M121 E			;Eject Filament

M103 S0			;Nozzle heater off
M140 S0			;Bed heater off

;Finish/Abort Print
M106			;Fan on full
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