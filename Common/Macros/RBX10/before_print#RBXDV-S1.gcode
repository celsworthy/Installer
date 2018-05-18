M83				;Set Extruder to Relative moves
M139			;Set & heat first layer Bed temp.

Macro:Home_all_Axis_in_sequence

M190			;Wait for Bed to get to temp.

T0
G0 Y-1 X0		;Move to start of short purge
G28 Z
G0 Z1

M103			;Set & heat first layer nozzle temp.
M109			;Wait for Nozzle to get to temp.
M170			;Set Ambient temp.

M129			;Head LED on

Macro:Short_Purge#RBXDV-S1

Macro:Level_Gantry_(2-points)

Macro:7_point_Bed_probing-Set_Washout

G0 E20			;Un-retract

