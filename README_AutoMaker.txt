CEL AutoMaker README

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
