Macro:Home_all_Axis_in_sequence

Macro:Level_Gantry_(2-points)

M190			;wait to get to Bed temp
M109			;wait to get to nozzle temp

M129			;Head LED on
M106			;Fan on

G36 E1000 F12000 ; Un-Park
G36 D1000 F12000 ; Un-Park

G0 X20 Y15
Macro:Purge_T0
G0 Y30
Macro:Purge_T1
G0 Y45
Macro:Purge_T0
G0 Y60
Macro:Purge_T1
G0 Y75
Macro:Purge_T0
G0 Y90
Macro:Purge_T1
G0 Y105
Macro:Purge_T0
G0 Y120
Macro:Purge_T1
G0 Y135
Macro:Purge_T0

Macro:Finish-Abort_Print