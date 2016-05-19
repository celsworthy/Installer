T1 B0			;Select 0.8mm Nozzle
M104 T			;Set & heat nozzle temp from SmartReel
M109			;Wait for Nozzle to get to temp.
M106			;Head Fan on 100%
G0 B1			;Fully Open Nozzle
G1 E200 F150	;Flush Fill Nozzle
T0				;Switch to 0.3mm Nozzle
G1 E80 F150		;Flush Fine Nozzle
G0 B0			;Close Nozzle
M104 T155		;Set & heat nozzle to eject temp
M109			;Wait for Nozzle to get to temp.
G0 E-50			;Create 'neck' in filament
M104 T125		;Set Heater to snap temp.
M109			;Wait for Nozzle to get to temp.
G0 E-1200		;Eject Filament
M104 T0			;Turn off Heater
M107			;Turn off Fan
M84				;Motors Off