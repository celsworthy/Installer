Macro:Home_all_Axis_in_sequence

Move to Eject position;
T0 B0
G0 X210 Y120 Z8

Eject all material;
M104 S160 T160 		;Set & heat nozzle to eject temp
M109				;Wait for nozzle to get to temp.
G0 E-50 D-50		;Create a small ‘neck’ in the filament which can be snapped easily
M104 S125 T125		;Go to snap temperature
M109				;Wait for nozzle to get to temp.
G0 E-1500 D-1500	;Eject Filament

M106			;Fan on Full
G37 S			;Open Door
M107			;Fan Off