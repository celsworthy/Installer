M104 S0  		;nozzle heater off

;Finish/Abort Print
M106			;Fan on full
G91				;Relative positioning
G0 Z5			;Move up 5mm
G90 			;Absolute positioning
T0				;Select Nozzle 0 (T0)
G0 X15 Y0		;Move to back corner
G90 			;Absolute positioning
G0 B0			;Close Nozzle

;Retract and Park
M106   			;Fan on full
M104 S140		;reduce nozzle temp
M109   			;wait to get to temp
G0 E-150  	 	;Retract the filament
M104 S0  		;nozzle heater off
M107			;Fan off

;Open Door
G37 S				;Unlock door (S: don't wait for safe temp)

;Every thing off
M170 S0			;Ambient control off
M103 S0			;Nozzle heater off
M140 S0			;Bed heater off
M107			;Fan off
M128			;Head Light off
M84				;Motors off