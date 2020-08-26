#!/bin/bash

JOB_ID=$1
VIDEO_DEVICE=$2
RESOLUTION=$3
shift
shift
shift

#!/bin/bash
# Try to find a USB directory
USB_DIR=`find /media/ -maxdepth 1 -type d -name 'usb*' -print -quit`
SNAP_DIR=""
if [ ! -z "$USB_DIR" ]
then
    # If we have a USB then move the snap to a project folder on the USB
    if [ ! -d "$USB_DIR/$JOB_ID" ]
    then
        sudo mkdir "$USB_DIR/$JOB_ID"
    fi
    SNAP_DIR="$USB_DIR/$JOB_ID"
else
    # If we don't have a USB then we make a project folder in the User folder
    USER_DIR="/home/pi/CEL Root/snapshot"
    if [ ! -d "$USER_DIR/$JOB_ID" ]
    then
        sudo mkdir -p "$USER_DIR/$JOB_ID"
    fi
    SNAP_DIR="$USER_DIR/$JOB_ID"
fi

# Take photo.
TIME_STAMP=`date +"%Y%m%d%H%M%S"`
sudo fswebcam -q -d $VIDEO_DEVICE -r $RESOLUTION "$@" --no-banner "$SNAP_DIR/$JOB_ID$TIME_STAMP.jpg"

