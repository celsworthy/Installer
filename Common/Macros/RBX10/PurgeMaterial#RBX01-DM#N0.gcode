Macro:Home_all_Axis_in_sequence

Macro:Level_Gantry_(2-points)

M190			;wait to get to Bed temp
M109			;wait to get to nozzle temp

M129			;Head LED on
M106			;Fan on

G36 D1500 F400 ; Un-Park

;Prime
G1 E3 F500

G0 X20 Y20
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