Macro:Home_all_Axis_in_sequence

Macro:Level_Gantry_(2-points)

M190			;wait to get to Bed temp
M109			;wait to get to nozzle temp

G0 E-25			;Retract

M129			;Head LED on
M106			;Fan on

G0 X20 Y20
G36 E1500 F1200 ; Un-Park
Macro:Purge_T0
G0 X20 Y24
Macro:Purge_T0
G0 X20 Y28
Macro:Purge_T0
G0 X20 Y32
Macro:Purge_T0
G0 X20 Y36
Macro:Purge_T0

Macro:Finish-Abort_Print