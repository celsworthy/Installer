#!/bin/bash
output=`lsusb -d$1`
if [ "$output" = "" ]
then
	echo "NOT_CONNECTED"
else
	echo $output
fi
