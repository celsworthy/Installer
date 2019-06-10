#!/bin/bash

# First take the photo with webcam
if curl -s -o /dev/null http://localhost:8101/0/action/snapshot
then
   # Try to find a USB directory
   USB_DIR=`find /media/ -maxdepth 1 -type d -name 'usb*' -print -quit`
   SNAP_DIR="/var/lib/motion"

   # We need a short break to give the webcam time to take the photo
   sleep 0.25s

   if [ ! -z "$USB_DIR" ]
   then
      # If we have a USB then move the snap to a project folder on the USB
      if [ ! -d "$USB_DIR/$1" ]
      then
         sudo mkdir "$USB_DIR/$1"
      fi

      find "$SNAP_DIR" -maxdepth 1 -type f -print0 | xargs -0 sudo mv -t "$USB_DIR/$1"
   else
      # If we don't have a USB then we make a project folder in the snap dir
      if [ ! -d "$SNAP_DIR/$1" ]
      then
         sudo mkdir "$SNAP_DIR/$1"
      fi
      find "$SNAP_DIR" -maxdepth 1 -type f -print0 | xargs -0 sudo mv -t "$SNAP_DIR/$1"
   fi
fi
