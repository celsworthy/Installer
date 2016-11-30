#!/bin/bash
wifion=$(networksetup -getairportpower en0 | cut -d : -f2 | sed 's/^[ \t]*//;s/[ \t]*$//' | awk '{print tolower($0)}' )
ssid=$(networksetup -getairportnetwork en0 | cut -d : -f2 | sed 's/^[ \t]*//;s/[ \t]*$//')

associated='no'
if [ ${ssid} == "You are not associated with an AirPort network." ]
then
   associated='yes'	
fi

echo {\"power\":\"${wifion}\", \"associated\":\"${associated}\", \"ssid\":\"${ssid}\"}
