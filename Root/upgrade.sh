#!/bin/bash
# 
# Post upgrade script - run once after upgrade.

ARM_DIR="ARM-32bit"
ROOT_DIR="Root"
PI_HOME="/home/pi"

ARM_HOME=${PI_HOME}/${ARM_DIR}
ROOT_HOME=${ARM_HOME}/${ROOT_DIR}

# Remove the roboxbrowser service if present.
SERVICE_DIR=/etc/systemd/system
BROWSER_SERVICE_FILE=roboxbrowser.service
BROWSER_SERVICE_PATH=${SERVICE_DIR}/${BROWSER_SERVICE_FILE}
if [ -e ${BROWSER_SERVICE_PATH} ]
then
	sudo systemctl stop ${BROWSER_SERVICE_FILE}
	sudo rm -f ${BROWSER_SERVICE_PATH}
	sudo systemctl daemon-reload
fi
pkill chromium

if [ ! -e /usr/bin/unclutter ]
then
	# Install unclutter.
	pushd ${ROOT_HOME}/upgrade_data/offline/unclutter
	${ROOT_HOME}/upgrade_data/offline/unclutter/install.sh
	popd
fi

#==============================
# pmount and all files needed for mounting of USB drives
#==============================
if [ ! -e /usr/bin/pmount ]
then
	pushd ${ROOT_HOME}/upgrade_data/offline/pmount
	${ROOT_HOME}/upgrade_data/offline/pmount/install.sh
	popd
fi

if [ ! -e /etc/udev/rules.d/usbstick.rules ]
then
	sudo cp -f ${ROOT_HOME}/upgrade_data/usb_mount/usbstick.rules /etc/udev/rules.d
fi

if [ ! -e /lib/systemd/system/usbstick-handler@.service ]
then
	sudo cp -f ${ROOT_HOME}/upgrade_data/usb_mount/usbstick-handler@.service /lib/systemd/system
fi

if [ ! -e /usr/local/bin/cpmount ]
then
	sudo cp -f ${ROOT_HOME}/upgrade_data/usb_mount/cpmount /usr/local/bin
fi
#==============================

# Remove the old touch screen calibration scripts
rm -rf ${PI_HOME}/scripts

# Replace lxsession autostart.
cp -f ${ROOT_HOME}/upgrade_data/autostart ${PI_HOME}/.config/lxsession/LXDE-pi

# Add robox device
if [ ! -e /etc/udev/rules.d/robox.rules ]
then
	sudo cp -f ${ROOT_HOME}/upgrade_data/robox.rules /etc/udev/rules.d
fi

# Add CEL boot splash screen.
if [ ! -e /usr/share/plymouth/themes/celrobox/splash.png ]
then
	sudo cp -r ${ROOT_HOME}/upgrade_data/celrobox /usr/share/plymouth/themes
	sudo plymouth-set-default-theme celrobox

	# Get the PARTUUID for the rootfs partition and substitute into the rootoption in cmdline.txt
	# Create a backup of the working cmdline.txt in case it fails.
	sudo cp -f /boot/cmdline.txt /boot/cmdline-backup.txt
	rootfs_dev=`blkid -L rootfs`
	partuuid=`blkid $rootfs_dev -s PARTUUID | sed -e 's/.*=\"\(.*\)\"/\1/'`
	sed -i -e "s/root=PARTUUID=\(.*\) rootfs/root=PARTUUID=${partuuid} rootfs/" ${ROOT_HOME}/upgrade_data/cmdline.txt
	sudo cp -f ${ROOT_HOME}/upgrade_data/cmdline.txt /boot
fi

# Add RoboxPro file if required. Detect this by checking if the display_rotate value is 1
if [ ! -e /boot/RoboxPro ]
then
	dr=`sed -n -e 's/display_rotate=\(.*\)/\1/p' /boot/config.txt`
	if [ $dr = "1" ]
	then
		sudo touch /boot/RoboxPro
	fi
fi

# Enable and start the SSH server if it is not active.
if service ssh status | grep -q inactive; then
	sudo update-rc.d ssh enable
    sudo invoke-rc.d ssh start
fi

# Copy the ssh public key if it is not already there.
mkdir -p /home/pi/.ssh
if [ -e /home/pi/.ssh/authorized_keys ]
then
	# Backup the original keys.
	cp /home/pi/.ssh/authorized_keys /home/pi/.ssh/authorized_keys~
	# Remove any existing key.
	sed -i /automaker-root/d /home/pi/.ssh/authorized_keys
fi
# Append new key.
cat ${ROOT_HOME}/upgrade_data/authorized_keys >> /home/pi/.ssh/authorized_keys
chmod 600 /home/pi/.ssh/authorized_keys

# Remove upgrade data and this file.
rm -rf ${ROOT_HOME}/upgrade_data
rm -f ${ROOT_HOME}/upgrade.sh

# Cross fingers and reboot.
sudo reboot

