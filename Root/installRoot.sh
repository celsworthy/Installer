#!/bin/bash
serviceFinalDir=/etc/systemd/system
rootServiceFile=roboxroot.service
browserServiceFile=roboxbrowser.service
installDir=`pwd`

echo ${installDir}

if [ "$(id -u)" != "0" ]; then
    echo "The installer must be run as root. Try sudo $0"
    exit 1
fi

rm -f ${serviceFinalDir}/${rootServiceFile}
rm -f ${serviceFinalDir}/${browserServiceFile}

echo '[Unit]' >> ${serviceFinalDir}/${rootServiceFile}
echo 'Description=Robox Root Node' >> ${serviceFinalDir}/${rootServiceFile}
echo 'After=syslog.target network.target remote-fs.target nss-lookup.target' >> ${serviceFinalDir}/${rootServiceFile}
echo '[Service]' >> ${serviceFinalDir}/${rootServiceFile}
echo 'Type=simple' >> ${serviceFinalDir}/${rootServiceFile}
echo "WorkingDirectory=${installDir}" >> ${serviceFinalDir}/${rootServiceFile}
echo "ExecStart=${installDir}/runRoot.sh" >> ${serviceFinalDir}/${rootServiceFile}
echo 'Restart=always' >> ${serviceFinalDir}/${rootServiceFile}
echo 'LimitNOFILE=10000' >> ${serviceFinalDir}/${rootServiceFile}
echo 'User=pi' >> ${serviceFinalDir}/${rootServiceFile}
echo '[Install]' >> ${serviceFinalDir}/${rootServiceFile}
echo 'WantedBy=multi-user.target' >> ${serviceFinalDir}/${rootServiceFile}

echo '[Unit]' >> ${serviceFinalDir}/${browserServiceFile}
echo 'Description=Robox Root Browser' >> ${serviceFinalDir}/${browserServiceFile}
echo "After=syslog.target network.target remote-fs.target nss-lookup.target ${rootServiceFile}" >> ${serviceFinalDir}/${browserServiceFile}
echo "Requires=${rootServiceFile}" >> ${serviceFinalDir}/${browserServiceFile}
echo '[Service]' >> ${serviceFinalDir}/${browserServiceFile}
echo 'Type=simple' >> ${serviceFinalDir}/${browserServiceFile}
echo "WorkingDirectory=${installDir}" >> ${serviceFinalDir}/${browserServiceFile}
echo "Environment=DISPLAY=:0.0" >> ${serviceFinalDir}/${browserServiceFile}
echo "ExecStartPre=${installDir}/waitForRoot.sh" >> ${serviceFinalDir}/${browserServiceFile}
echo "ExecStart=${installDir}/startBrowser.sh" >> ${serviceFinalDir}/${browserServiceFile}
echo 'Restart=always' >> ${serviceFinalDir}/${browserServiceFile}
echo 'LimitNOFILE=10000' >> ${serviceFinalDir}/${browserServiceFile}
echo 'User=pi' >> ${serviceFinalDir}/${browserServiceFile}
echo '[Install]' >> ${serviceFinalDir}/${browserServiceFile}
echo 'WantedBy=multi-user.target' >> ${serviceFinalDir}/${browserServiceFile}

systemctl daemon-reload
systemctl enable ${rootServiceFile}
systemctl start ${rootServiceFile}
systemctl enable ${browserServiceFile}
systemctl start ${browserServiceFile}

echo Installed Robox Root Node and browser services
