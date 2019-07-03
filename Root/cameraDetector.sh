#!/bin/bash
camera_devices="/dev/video*"

for device in $camera_devices
do
	# If there are no camera devices this will loop once with device equal to /dev/video*
	if [[ $device = "$camera_devices" ]]
	then
		echo NOT_CONNECTED
		exit
	fi
	echo $device > /dev/stdout
	echo " "
done
