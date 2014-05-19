#!/bin/bash
output=`ls  /dev/serial/by-id/ | grep $1 | grep $2`
if [ "$output" = "" ]
then
	echo "NOT_CONNECTED"
else
        if [ -h /dev/serial/by-id/"$output" ]
        then
            output=`readlink -f /dev/serial/by-id/"$output"`
        fi
	echo $output
fi
