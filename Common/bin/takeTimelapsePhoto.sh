#!/bin/bash

# Check for mounted usb directory
if [ -d /media/usb1 ]; then
	mkdir -p /media/usb1/Timelapse/$1;
	fswebcam -r 1280x720 --no-banner /media/usb1/Timelapse/$1/capture$2.jpg;
else
	mkdir -p ~/CEL\ Root/Timelapse/$1;
	fswebcam -r 1280x720 --no-banner ~/CEL\ Root/Timelapse/$1/capture$2.jpg;
fi
