; Park Filament

;retract code
M106   			;Fan on full
M104 S140		;reduce nozzle temp
M109   			;wait to get to temp
M104 S0  		;nozzle heater off
G0 E-150  		;Finish retract
M107			;Head Fan off

G37 S			;Unlock door (S: don't wait for safe temp)

M170 S0			;Ambient control off
M107			;Fan off
M128			;Head Light off
M84				;Motor off