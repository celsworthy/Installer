#!/bin/bash
# Root upgrade script.
#
# This script does two things:
# If the resize_fs file exists, then it resizes the root filesystem using raspi-config, deletes the resize_fs file and reboots.
# If there is an upgrade package, it unpacks it and installs it.
#

EXPAND_REQUIRED_FILE=/boot/expand_rfs
ROOT_ARM="ARM-32bit"
ROOT_PARENT="/home/pi"
ROOT_UPGRADE_FILE_BASE="/tmp/RootARM*"
TMP_UPGRADE_DIR="/tmp/root-upgrade"

ROOT_HOME=${ROOT_PARENT}/${ROOT_ARM}

TMP_UPGRADE_HOME=${TMP_UPGRADE_DIR}/${ROOT_ARM}

ROOT_UPGRADE_SCRIPT=${ROOT_HOME}/Root/upgrade.sh

# Expand the root file system if the expand required file exists.
if [ -e ${EXPAND_REQUIRED_FILE} ]
then
	logger Expanding root file system.
	# Delete the file first, so the expansion is done once only.
	sudo rm -f ${EXPAND_REQUIRED_FILE}
	sudo raspi-config --expand-rootfs
	sudo reboot
fi

# Handle pre-run upgrade
for f in ${ROOT_UPGRADE_FILE_BASE}; do
	if [ -e "$f" ]
	then
	
		upgradeFile=$(ls -t ${ROOT_UPGRADE_FILE_BASE} | head -1)
		logger Found $upgradeFile - upgrading Robox Root

		# Stop chromium so it doesn't display "Can't find page".
		pkill chromium

		# Display CEL logoupgrade gif.
		if [ -e /usr/bin/xsetroot ] && [ -e ${ROOT_HOME}/Root/cel.xbm ]
		then
			xsetroot -bitmap ${ROOT_HOME}/Root/cel.xbm
		fi

		# Unpack into temporary directory.
		if [ -e $TMP_UPGRADE_DIR ]
		then
			rm -rf  $TMP_UPGRADE_DIR
		fi
		unzip -o -d $TMP_UPGRADE_DIR $upgradeFile

		# Check that upgrade is valid.
		validUpgrade=0
		if [ -e ${TMP_UPGRADE_HOME}/Root/Root.md5 ]
		then
			pushd ${TMP_UPGRADE_HOME}/Root
			md5sum -c --quiet Root.md5 > /dev/null 2>&1
			if [ $? -eq 0 ]
			then
				validUpgrade=1
			fi
			popd
		fi

		if [ ${validUpgrade} -eq 1 ]
		then
			logger Archive valid - upgrading Robox Root

			# Delete all downloaded zip files
			rm -f ${ROOT_UPGRADE_FILE_BASE}

			# Delete any old Root installation.
			if [ -e ${ROOT_HOME}-1 ]
			then
				rm -rf ${ROOT_HOME}-1
			fi

			# Move the current install out of the way.
			mv $ROOT_HOME ${ROOT_HOME}-1

			# Move the new install from tmp to the correct place.
			mv ${TMP_UPGRADE_HOME} $ROOT_HOME

			# Delete the tmp directory.
			rm -rf  $TMP_UPGRADE_DIR

			# The current directory has moved under our feet, so cd to the root directory.
			cd ${ROOT_HOME}/Root

			# Run the upgrade script if one exists.
			if [ -e ${ROOT_UPGRADE_SCRIPT} ]
			then
				${ROOT_UPGRADE_SCRIPT}
				# Delete the upgrade script so it is not run again.
				rm -f ${ROOT_UPGRADE_SCRIPT}
			fi

			# Clear the Chromium cache
			rm -rf ~/.cache/chromium/Default

			# Exit with status 1, causing a restart.
			exit 1
		else
			logger Archive invalid - not upgrading Robox Root.

			# Delete the invalid zip.
			rm -rf ${ROOT_UPGRADE_FILE_BASE} $TMP_UPGRADE_DIR
			
			# Restart Chrome.
			/home/pi/ARM-32bit/Root/launchBrowser.sh &
		fi
	fi
	break
done

# Exit with status 0, to continue running as normal.
exit 0
