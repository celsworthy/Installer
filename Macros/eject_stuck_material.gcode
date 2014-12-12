M83				;Relative Extrusion
G90 			;Absolute positioning
T0				;Select Nozzle 0 (T0)
G0 B0			;Close Nozzle
G28 Z			;Home Z
G0 Z10			;Move Z up
G28 X Y			;Home X, then Y

M103			;Set & heat first layer nozzle temp.
M109			;Wait for Nozzle to get to temp.

;Short Purge
G0 Y0 X21 Z10
G36 E500 F1000
G0 Z2
G1 Y1.5 F400
T0
G0 B2
G1 E30 X44 F250
G0 B0
G0 Z5
G0 Y10

G36 E500 F1000
G0 Y0 Z8
T1
G0 Y0
G0 Z3
G1 Y1.5 F400
G0 B2
G1 E35 X21 F300
G0 B0
G0 Z5
G0 Y10
G0 X110 Y75

M121 E			;Eject Filament

;Finish/Abort Print
G0 B0			;Close Nozzle
M106			;Fan on full
G90 			;Absolute positioning
T0				;Select Nozzle 0 (T0)
G91				;Relative positioning
G0 Z5			;Move up 5mm
G90 			;Absolute positioning
G0 X15 Y0		;Move to back corner

;Every thing off
M170 S0			;Ambient control off
M103 S0			;Nozzle heater off
M140 S0			;Bed heater off
M107			;Fan off
M128			;Head Light off

;Open Door
G37 S			;Unlock door (S: don't wait for safe temp)
M84				;Motors off