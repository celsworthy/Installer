#!/bin/bash
export ROBOX_PRO_FILE=/boot/RoboxPro

if [ -e "$ROBOX_PRO_FILE" ]
then
	# This is a RoboxPro
	X_MIN=3840
	X_MAX=1600
	Y_MIN=400
	Y_MAX=6400

else
	# This is a Root/Mote.
	X_MIN=300
	X_MAX=2500
	Y_MIN=4000
	Y_MAX=-2300
fi

cd /home/pi/ARM-32bit/GRoot
sudo /home/pi/ARM-32bit/Root/java/bin/java -Dmonocle.input.0/0/0/0.minX=$X_MIN -Dmonocle.input.0/0/0/0.maxX=$X_MAX -Dmonocle.input.0/0/0/0.minY=$Y_MIN -Dmonocle.input.0/0/0/0.maxY=$Y_MAX  -Dmonocle.input.0/0/0/0.flipXY=true -jar ./GRoot.jar -u 500 -s
