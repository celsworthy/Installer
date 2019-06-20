; stylus_start#RBX01-SP
G91             ;Relative positioning
G0 Z 10         ; Raise head by 10mm
G37             ; Open door
M1              ; Pause to allow user to lower peg

Macro:Home_all_Axis_in_sequence
Macro:Level_Gantry_(2-points)
Macro:7_point_Bed_probing-Set_Washout

G39 S0          ; Set bed leveling to always be applied. (infinite wash out).
M129			;Head LED on

G90 			;Absolute positioning
G0 Z5		    ;Raise head
G0 X5			;Move to front corner
G37				;Unlock door
M1              ;Pause to allow user to raise peg