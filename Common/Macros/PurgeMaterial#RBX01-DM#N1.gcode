Macro:Home_all_Axis_in_sequence

Macro:Level_Gantry_(2-points)

M190			;wait to get to Bed temp
M109			;wait to get to nozzle temp

M129			;Head LED on
M106			;Fan on

G36 E1500 F400 ; Un-Park

G0 X190 Y20
Macro:Purge_T1
G0 X190 Y23
Macro:Purge_T1
G0 X190 Y26
Macro:Purge_T1
G0 X190 Y29
Macro:Purge_T1
G0 X190 Y32
Macro:Purge_T1

Macro:Finish-Abort_Print