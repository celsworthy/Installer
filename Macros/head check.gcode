
; Eject stuck material
M104
M109
G36 E160 F800
G1 E10 F100
M129

T0
G0 B2
G1 E100 F100
G0 B0

T1
G0 B2
G1 E100 F150
G0 B0

T0
G0 B2
G1 E100 F100
G0 B0

T1
G0 B2
G1 E100 F150
G0 B0

T0
G0 B2
G1 E100 F100
G0 B0

T1
G0 B2
G1 E100 F150
G0 B0

T0
G0 B2
G1 E100 F100
G0 B0

T1
G0 B2
G1 E100 F150
G0 B0

T0
G0 B2
G1 E100 F100
G0 B0

T1
G0 B2
G1 E100 F150
G0 B0

M128

G0 E-150		;Park

M104 S0			;Heat Nozzle off
