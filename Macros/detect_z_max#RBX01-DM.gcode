T0				;Select Nozzle 0
M104 S T		:Heat Both Nozzles
G90 			;Use X Y Z Absolute positioning
G0 Z5			;Move up 5mm if homed
G28 Y			;Home Y
G0 Y75			;Position Y
G39				;Clear the bed levelling points
M109			;Wait for Nozzle 0 Temperature
T1				;Select Nozzle 1
M109			;Wait for Nozzle 1 Temperature
G28 Z			;Home Z
M104 S0 T0		;Turn off heaters
G0 Z10			;Move up 10mm if homed
G28 X			;Home X
Macro:Level_Gantry_(2-points)
G0 X105	Y75		;Position head and bed in centre
G0 Z70			;Drive at full speed to z=70mm
G1 Z95 F50		;Slow travel to z=95
G0 Z5			:Home Z