#!/bin/bash
export DISPLAY=:0.0
rm -fr ~/.cache/chromium/*
sed -i 's/\("exited_cleanly": *\)false,/\1true,/' /home/pi/.config/chromium/Default/Preferences
sed -i 's/\("exit_type": *"\)[^"]*",/\1Normal",/' /home/pi/.config/chromium/Default/Preferences
chromium-browser --kiosk --noerrdialogs http://localhost:8080/index.html

