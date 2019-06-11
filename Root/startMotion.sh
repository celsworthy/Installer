#!/bin/bash
if pidof motion >/dev/null
then
   echo "Motion is already running"
else
   sudo motion -m -b -l /home/pi/CEL\ Root/motion.log
fi
