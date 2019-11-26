#!/bin/bash
# 
# Post upgrade wrapper script - run once after upgrade.
# This wrapper script runs the actual upgrade script,
# redirecting output to a log file, before tidying up and rebooting.
ROOT_HOME=/home/pi/ARM-32bit/Root
UPGRADE_SCRIPT=${ROOT_HOME}/upgrade.sh
UPGRADE_LOG=${ROOT_HOME}/upgrade.log

if [ -e ${GROOT_HOME} ]
then
	rm -f ${UPGRADE_LOG}
fi
${UPGRADE_SCRIPT} >${UPGRADE_LOG} 2>&1

# Remove upgrade scripts and data.
rm -rf ${ROOT_HOME}/upgrade_data
rm -f ${ROOT_HOME}/upgrade.sh
rm -f ${ROOT_HOME}/upgrade_wrapper.sh

sudo reboot
