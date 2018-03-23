#!/bin/bash
# This version is for the SPI touch interface
export DISPLAY=:0.0

# Rotation but no calibration
#xinput --set-prop 'ADS7846 Touchscreen' 'Coordinate Transformation Matrix'  0 -1 1 1 0 0 0 0 1

# Default calibration for GPIO-based screen
#xinput --set-prop 'ADS7846 Touchscreen' --type=float 'Coordinate Transformation Matrix' 0 1 0 -1 0 1 0 0 1
xinput --set-prop 'ADS7846 Touchscreen' --type=float 'Coordinate Transformation Matrix' 0.0 1.047 -0.026 -1.076 0.0 1.041 0 0 1

# Default calibration for USB-based screen
#xinput --set-prop 'BYZHYYZHY By ZH851' 'Coordinate Transformation Matrix' 0 -1.1 1.06 1.1 0 -0.05 0 0 1
