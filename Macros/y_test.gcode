; Home all Axis in sequence
G90 			;Use X Y Z Absolute positioning
G0 Z5			;Move up 5mm if homed
G28 Y			;Home Y
G0 Y40			;Position Y
G28 Z			;Home Z
G0 Z10			;Move up 10mm if homed
G28 X			;Home X

; Y Speed Test
G0 Y154
G0 Y-6
G0 Y154
G0 Y-6
G0 Y154
G0 Y-6
G0 Y154
G0 Y-6
G0 Y154
G0 Y-6
G0 Y154
G0 Y-6
G0 Y154
G0 Y-6
G0 Y154
G0 Y-6
G0 Y154
G0 Y-6
G0 Y154
G0 Y-6
G0 Y154
G0 Y-6
G0 Y154
G0 Y-6
G0 Y154
G0 Y-6
G0 Y154
G0 Y-6
G0 Y154
G0 Y-6
G0 Y154
G0 Y-6
G0 Y154
G0 Y-6
G0 Y154
G0 Y-6
G0 Y154
G0 Y-6

;After Job
M103 S0			;Nozzle heater off
M140 S0			;Bed heater off

;Finish Position
G0 X15			;Move to back corner

;Open Door
G37 S				;Unlock door (S: don't wait for safe temp)

;Every thing off
M170 S0			;Ambient control off
M107			;Fan off
M128			;Head Light off

M84				;Motors off