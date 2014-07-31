M103			;Heat Nozzle to first later temp.

; Home all Axis in sequence
G0 Z5
T0
G28 X Y
G0 X115 Y75
G28 Z
G0 Z5

; Eject stuck material
M103
M109
T1
G0 B1
G36 E5 F50
G0 B0
G36 E-10 F50
G36 E-150 F1200

T1
G0 B1
G36 E10 F50
G0 B0
G36 E-5 F50
G36 E-150 F1200

T1
G0 B1
G36 E10 F50
G0 B0
G36 E-5 F50
G36 E-150 F1200

T0

M121 E			;Eject Filament

G37 S			;Unlock door (S: don't wait for safe temp)

M170 S0			;Ambient control off
M107			;Fan off
M128			;Head Light off
M84				;Motor off
