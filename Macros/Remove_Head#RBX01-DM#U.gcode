Macro:Home_all_Axis_in_sequence

Move to Eject position;
T0 B0
G0 X210 Y120 Z6

Eject all material;
M122 E D

M106			;Fan on Full
G37 S			;Open Door
M107			;Fan Off