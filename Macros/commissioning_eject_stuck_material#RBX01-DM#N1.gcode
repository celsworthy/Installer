T1 B0			;Select right hand nozzle				
M104 T			;Set & heat nozzle temp from SmartReel
M109			;Wait for Nozzle to get to temp.
G0 B1			;Fully Open Nozzle
G1 E200 F150	;Flush Nozzle
G0 B0			;Close Nozzle
M104 T155		;Set & heat nozzle to eject temp
M109			;Wait for Nozzle to get to temp.
G0 E-50			;Eject Filament
M104 T125		;Go to snap temperature
M109			;Wait for Nozzle to get to temp.
G0 E-1200		;Eject Filament
M107			;Turn off Fan
M84				;Motors Off