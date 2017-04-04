#!/bin/bash

if [ "$(id -u)" != "0" ]; then
    echo "The uninstaller must be run as root. Try sudo $0"
    exit 1
fi

serviceFinalDir=/etc/systemd/system
rootServiceFile=roboxroot.service
browserServiceFile=roboxbrowser.service

systemctl stop ${rootServiceFile}
systemctl stop ${browserServiceFile}
systemctl daemon-reload

rm -f ${serviceFinalDir}/${rootServiceFile}
rm -f ${serviceFinalDir}/${browserServiceFile}

echo Robox Root Node and browser services uninstalled
