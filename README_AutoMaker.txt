CEL AutoMaker README

version 1.01.00
GUI update
Added Cura
Updated firmware to v698
Incorporates tickets:
SFR-18	M140, M104 not being added to gcode after first layer.
SFR-17	No first layer speeding being passed to Slic3r
SFR-16	Post Processor Adding code to Gcode file that is not required.
SFR-15	Cooling On/Off toggle is not passed to Slic3r from Automaker
SFR-14	Cura is not adding retracts, so post processor is not closing nozzles between moves
SFR-13	Add M83 to "before Print.gcode" so visuliiation is better
SFR-12	Add First Layer print Speed as a new adjustiable variable in Automaker
SFR-11	Hide Variables in Automaker that are not mapped to the chosen slice engine
ROB-401	Old Print profiles Migratioed to old version.
ROB-395	Calibration - Printer error occurs and dialog appears but heating action carries on
ROB-391	AutoMaker should pause if filament error detected during print
ROB-389	AutoMaker doens't reslice if custom profile is altered and saved
ROB-387	Shutting down AutoMaker terminates prints
ROB-381	It should not be possible to cancel a cancel
ROB-369	Purge routine does not print after purge-before print
ROB-359	Robox serial number not set on About screen
ROB-358	Pause / Resume / Cancel button behaviour is incorrect
ROB-351	Auto update of reel data is not working
ROB-350	Make cura integration pass progress back to AutoMaker
ROB-340	Remove stream GCode button from maintenance page
ROB-337	Remove override safeties from preferences page
ROB-336	Temperature graph changes
ROB-334	Disable multi-printer support
ROB-332	Error dialog - user presses cancel during calibration
ROB-331	Pop-up notification to tell user why print is not possible when print button is pressed
ROB-330	Notifications should not use ellipsis - requires word wrap?
ROB-329	Notification font family and size are wrong
ROB-328	Move status page buttons onto bottom tool bar
ROB-327	Implement Chris's calibration changes
ROB-325	Robox show fault on second and all subsequent print after switch on
ROB-318	Open Door Button does not work
ROB-317	Screen Eject button does not work.
ROB-314	Height Calibration will not start without filament installed
ROB-310	During Calibration an error ocour, it is cleared but the printer remains in pause
ROB-309	NPE after firmware upgrade
ROB-307	Nozzle height calibration - height value does not update
ROB-306	Nozzle height calibration - failure does not close wizard
ROB-305	Nozzle opening calibration - temperature bar goes beyond limit if temperature rises beyond target
ROB-304	Attempted head reprogram after updating a blank head and choosing Calibrate
ROB-303	Graphical error when selecting Nozzle Open Calbration
ROB-302	Whizzy spinner should be in centre of specified node
ROB-300	Add Preferences Page
ROB-298	Add speed slider to Status screen
ROB-296	Add default option for Custom profile slicer choice
ROB-295	Prints using Cura on Linux are offset
ROB-292	Make MyMiniFactory loader deal with rar files
ROB-290	Change MyMiniFactory hooks to javascript calls
ROB-289	Integrate MyMiniFactory load page
ROB-285	Add text to icons + i18n
ROB-264	Store MyMiniFactory session cookies
ROB-262	Custom filament profile does not store ambient temperature
ROB-252	Purge temperature does not appear in head EEPROM display until reconnect
ROB-243	Maintenance operations possible while print active
ROB-240	End of nozzle height calibration - push bed to front to allow insertion of PEI surface
ROB-235	Internationlise strings for Reel and Head status tabs
ROB-223	Can drop a file from explorer onto a project when it is at ready to print stage
ROB-175	Change Head Button
ROB-27	Purge needs a pop up sequence
Installer altered to show windows driver wizard
Installer altered to include forced GPU launcher (in AutoMaker install directory)

version 1.00.17
Revision 684.2 firmware
Fixes:
ROB-263 - Filament saves incorrectly for countries using , decimal separator
ROB-216 - Selection box corners sized incorrectly
ROB-238 - Snap to ground does not cause reslice
ROB-228 - Layout view rotates when it shouldn't
ROB-294 - Correct problem with Orange PLA filament definition file
ROB-226 - Model should go red when height is above maximum
ROB-308 - Fix issue with firmware upgrade/downgrade

version 1.00.16 - Affects Mac OS X only
Fixes ROB-299 - Cannot load models due to an incompatibility with Mac OS X 10.7.x

version 1.00.15
Fix to nozzle opening calibration routine

version 1.00.14
Updates to default print profiles and macros.
Fixed issue in post-processor affecting very small extrusions where nozzle did not always close before travel.
Reduced settings screen bed rotation load on CPU.
Temperature graph is now visible during purge.
Minor purge handling modifications.
Version and date is written to post-processed gcode files.
Update to version 684 firmware.

version 1.00.13
Fixed post-processing issue causing under-extrusion and large blobs of material on some models.
Added languages - complete set is:
	English
	Finnish
	German
	Korean
	Russian
	Simplified Chinese
	Swedish
	Traditional Chinese
Fixed ROB-239 - Check for updates does not timeout on Linux if web site down.
Updated to version 683 firmware.

version 1.00.12
Major update to postprocessor to improve print quality - specifically nozzle open/close.
All default profiles updated.
Automatic update of user profiles included.
Numerous minor fixes to UI behaviour (including purge and filament detection).

version 1.00.11
Fixed an issue preventing Slicing when a user's home directory a UNC drive (Windows only)

version 1.00.10
IMPORTANT: The way Projects are saved and loaded has changed. The first time you run this release your current projects will not load correctly and will need to be closed. You will need to recreate your Projects, and also your Custom Material and Print Profiles.
Integrated v679 firmware
Fixed encoding issue for Chinese language
Moved GCode display to bottom of status slideout
Fixed decimal separator issue in post processor. Fixed calibration integration. Fixed post-processor issue where absence of T command in sliced code caused a failure.
Printer Status tabs changed, merged Program into Reel and Head, removed PrinterID, improved Reel for better filament management.
Tidy up Diagnostics panel
Add name/colour/material to reel eeprom
Updated head auto-programming
Add Reset To Default for head offsets
Add Reel tab to AutoMaker
Fixes ROB-220 - don't preheat nozzle
Fixes ROB-26 Current firmware version should be in a label
Fixes ROB-192 ETC saying < 1minute when it is at start of job, before first line number comes back from printer
Fixes ROB-74 disable changing the profile name in the profile name editor
Fixed post processor errors - retract distance being used in autounretract
Fixes ROB-43 Snap to ground, also Multi-select and Ctrl-A select all on Layout page
Remove speed modifiers and hold down Ctrl/Command key to activate translate bed on Layout page
Modifications to post processor - added open over volume and multi-stage close
Check for collided models after auto layout
Fixes ROB-203 ETC going wrong, thinks it has finished when it hasn't
Fixes ROB-80 Open multiple files & ROB-199 D&D for upper case files & ROB-206 spaces in project names
Fixed post processor issues with single-segment line and close with travels between extrudes in one segment
Make filament loading more robust by trimming lines read in from file.
Fixes ROB-184 - increase the resolution of the nozzle calibration increments to 0.05

version 1.00.09
Hard reset for heads

version 1.00.08
Included version 1.1.5 Slic3r
Update to nozzle offset calibration - now includes ability to nudge height offsets manually.
Fixes ROB-85 - brim control on settings page.
Fixes ROB-179 - AutoMaker can hang under certain conditions with a popup progress dialog being displayed
Fixes ROB-173 - Degree symbol incorrect in graph axis label and target field labels
Fixes ROB-182 - Can't type unicode characters into text boxes
Fixes ROB-189 - Change wording of calibration routine to request door open
Fixes ROB-186 - Heater target temperatures do not update unless return is pressed
Fixes ROB-188 - Add close button to calibration dialogs
ROB-189 - Change wording of calibration routine to request door open
Fixes ROB-190 - Check for 3D support after autoupdate
Fixes ROB-35 - ETA on print time
Fixes ROB-126 - print progress goes beyond 100%
Added z switch error handling
Included Simplified Chinese language.

version 1.00.07
Hotfix for material temperature entry issue (material profile page).

version 1.00.06
Fixes ROB-10 - Change to version 1.1.2 of Slic3r
Fixes ROB-22 - Deleting custom profiles deletes the file but leaves it in the selection box.
Fixes ROB-127 - Save As Profile - needs to select after saving.
Fixes ROB-129 - Print Profiles - Auto remember and select profile last used on project, even if custom
Fixes ROB-145 - Print quality control text is too large
Fixes ROB-146 - Incorrect font on print quality control (Linux/Mac)
Fixes ROB-148 - Text alignment on Profile->Nozzles
Fixes ROB-150 - The print is always at the centre of the bed
Fixes ROB-152 - First tab top on status pullout is different size when deselected
Fixes ROB-159 - Create print profile keeps reappearing
Fixes ROB-162 - Save profile behaviour
Fixes ROB-167 - Temperature display/entry incorrect for locales using . as a separator
Fixes ROB-172 - Copy draft profile using save as command creates bug in gcode
Fixes windows driver failure to install on some non-english windows versions.
Fixes error in text of nozzle calibration screen.
Added head reset to defaults control.

version 1.00.05
Fixes windows driver failure to install on some non-english windows version.
Fixes error in text of nozzle calibration screen.

version 1.00.04
Added automatic update of erroneous/out of date head and reel data (ROB-144)
Print button visibility when filament is loaded and no manual selection has been made (ROB-147)
Single homing button (ROB-109)
Ambient LED colour selection and printer name issues (ROB-140)
Resign windows driver for Windows 8.1

version 1.00.03
Added prompt for purge if required when a macro is started (ROB-139)
Added prompt to clear bed after purge (ROB-137)
Fixed Slic3r failure on Mac (ROB-135)
Fixed Slic3r failure when non latin-1 characters are in the user data directory path (ROB-135)
Removed dependency on .NET runtime and included all necessary redistributable files (Windows)

version 1.00.02
Suppress purge errors and send restart when out-of-sync purge request occurs

version 1.00.01
Fixed popup of material create dialog on startup when user Filaments directory is empty

version 1.00.00
Initial Beta release
