#!/bin/bash
#export DISPLAY=:0.0
#export XAUTHORITY=~/.Xauthority

# Run unclutter to hide the cursor.
export LD_LIBRARY_PATH=${ROOT_HOME}/animate/lib:${LD_LIBRARY_PATH}
/home/pi/ARM-32bit/Root/x-apps/unclutter -idle 0.01 -root &
