CEL Configurator README

version 1.00.09
Change head soft reset to hard reset - pressing the head reset button will now format a head if necessary.

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
Re-sign windows driver for Windows 8.1

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
