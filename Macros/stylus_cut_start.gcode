G39				;Clear the bed levelling points

;Home_all_Axis_in_sequence
G90 			;Use X Y Z Absolute positioning
G0 Z18			;Move up 5mm if homed
G28 Y			;Home Y
G0 Y115			;Position Y
G28 X			;Home X

;Move to down leg
G0 X19 
G0 Y-3
G28 Z
G39				;Clear the bed levelling points
G92 Z8
G0 Y4
G0 Z4
G0 Y1.5000 Z0
G28 Z
G39				;Clear the bed levelling points
G0 Z4


;Level_Gantry
G0 X20 Y75		;Level Gantry Position 1
G28 Z			;Home Z
G0 Z4 			;Move up 4mm
G0 X190 Y75		;Level Gantry Position 2
G28 Z			;Home Z
G0 Z4 			;Move up 4mm
G38 			;Level gantry

;7_point_Bed_probing-Set_Washout
G0 Y20
G28 Z
G0 Z2
G0 X105
G28 Z
G0 Z2
G0 X20
G28 Z
G0 Z2
G0 Y130
G28 Z
G0 Z2
G0 X105
G28 Z
G0 Z2
G0 X190
G28 Z
G0 Z2
G0 X105 Y75
G28 Z
G0 Z2

G39 S0.5		;set washout over the first 2mm

;Move to up leg
G0 X19 Y4 Z11
G0 Y0
G1 Y-4 Z9 F100
G1 Z8
G0 Y8
G92 Z8.5		;Off set of the Pen to the Home (lower Z number to reduce pressure)
