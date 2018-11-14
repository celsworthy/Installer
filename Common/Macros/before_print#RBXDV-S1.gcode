M83				;Set Extruder to Relative moves
M139			;Set & heat first layer Bed temp.

Macro:Home_all_Axis_in_sequence

M190			;Wait for Bed to get to temp.

G0 Y-6 X11 Z8	;Wait over tip wipe blade
G0 Z3

M104 S395 		;Set & heat first layer nozzle temp.
M109			;Wait for Nozzle to get to temp.
M170			;Set Ambient temp.

M129			;Head LED on

Macro:Level_Gantry_(2-points)

Macro:7_point_Bed_probing-Set_Washout

G0 Y-6 X11 Z8	;Move to start of short purge
G0 Z3
G0 E25			;Un-Retract

Macro:Short_Purge#RBXDV-S1

G0 E25			;Un-retract