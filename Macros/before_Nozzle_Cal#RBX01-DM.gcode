M83				;Set Extruder to Relative moves

Macro:Home_all_Axis_in_sequence

M103 S T		;Set & heat first layer nozzle temp.
M109			;Wait for Nozzle to get to temp.

Macro:Short_Purge#RBX01-DM#N0

Macro:Short_Purge#RBX01-DM#N1

;Centre head
G0 X105 Y75 Z50

M129			;Head LED on