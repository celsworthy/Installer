M103 S			;Set & heat first layer nozzle temp.

Macro:Home_all_Axis_in_sequence

M106			;Fan on Full
M109			;Wait for Nozzle to get to temp.
G4 S5			;Dwell

Macro:Short_Purge

G0 D-1200		;Eject Filament

Macro:Finish-Abort_Print