M83				;Set Extruder to Relative moves
M139 E			;Set & heat first layer Bed temp.

Macro:Home_all_Axis_in_sequence

M190			;Wait for Bed to get to temp.
M103 T			;Set & heat first layer nozzle temp.
T1
M109			;Wait for Nozzle to get to temp.
M170 E			;Set Ambient temp.

Macro:Level_Gantry_(2-points)

Macro:7_point_Bed_probing-Set_Washout

M129			;Head LED on

Macro:Short_Purge

;Prime
G1 E3 F500