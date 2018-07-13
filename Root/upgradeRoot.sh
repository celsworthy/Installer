#!/bin/bash

ROOT_PARENT="/home/pi"
ROOT_DIR="ARM-32bit"
ROOT_HOME=${ROOT_PARENT}/${ROOT_DIR}
TMP_UPGRADE_DIR="/tmp/root-upgrade"
ROOT_UPGRADE_FILE_BASE="/tmp/RootARM*"

logger Checking for Robox Root upgrade files
#Handle pre-run upgrade
for f in ${ROOT_UPGRADE_FILE_BASE}; do
        if [ -e "$f" ]
        then
                upgradeFile=$(ls -t ${ROOT_UPGRADE_FILE_BASE} | head -1)
                logger Found $upgradeFile - upgrading Robox Root

                # Unpack into temporary directory.
                if [ -e $TMP_UPGRADE_DIR ]
                then
                        rm -rf  $TMP_UPGRADE_DIR
                fi
                unzip -o -d $TMP_UPGRADE_DIR $upgradeFile

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
                mv ${TMP_UPGRADE_DIR}/${ROOT_DIR} $ROOT_HOME

		# Delete the tmp directory.
		rm -rf  $TMP_UPGRADE_DIR

                # The current directory has moved under our feet, so cd to the root directory.
		cd ${ROOT_HOME}/Root

                # Run the upgrade script if one exists.
                if [ -e ${ROOT_HOME}/upgrade.sh ]
                then
                        ${ROOT_HOME}/upgrade.sh
			# Rename the upgrade script so it is not run again.
                        mv ${ROOT_HOME}/upgrade.sh ${ROOT_HOME}/upgrade_done.sh
                fi

                # Clear the Chromium cache
                rm -rf ~/.cache/chromium/Default

                # Exit with status 1, causing a restart.
                exit 1
        fi
        break
done

# Exit with status 0, to continue running as normal.
exit 0
