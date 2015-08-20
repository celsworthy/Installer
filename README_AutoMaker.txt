CEL AutoMaker README
===============
version 1.02.00
===============
   Updated to version 731 firmware

   New features:
       Undo/Redo - all changes to models on the bed can be undone
       Apply lean/twist/turn of an object on the bed
       Scale in X/Y/Z independently
       Display Time and Cost estimates for Draft/Normal/Fine/Custom profiles
       Rafts
	   Print area extent box is shown on the layout page
   
   Improved filament and print profile management
       Filament and print profile management have been moved to the Settings area (click
       on the gear icon in the top right of the application) and made simpler to user.
       Writing to the reel is now located on the Filament Library page (which is accessed
       from Settings).
	   
   Improved consistency of look & feel    
		Modified status page and progress bars
		
   Improved error handling
		Includes warnings if the printer is switched off without 
   
   Improvements to Cura handling of skin/solid layers
   
   Improvements to default print profiles

   Changes to the first layer print process
       The thickness of the first layer on each of the fine, normal and draft profiles has been increased
       to 0.3mm and the first layer speed has been slowed down. This has been done to improve
       the quality, reliability and repeatability of the first layer
	   
   Plus... Lots of minor bug fixes and preparation for the dual-material head release

Lean/Twist/Turn
---------------
It is now possible to set the lean, twist and turn of an object on the bed. Currently this can only be done using 
text fields but a future release will provide a graphical interface:
Turn   - when looking down on the object from above the bed, the turn rotates the object clockwise on the bed.
Lean   - this indicates how many degrees to lean the object away from the vertical. 90 degrees will lay the object
         on its side and 180 degrees will turn it upside down.
Twist  - when looking from the top of the object down its vertical axis, the twist rotates the object clockwise around
         that vertical axis.

The lean is applied first, then the twist and finally the turn.

===============
version 1.01.04
===============
Firmware update to v723
	 Improvements to filament load / eject

New user preference allowing disablement of filament loaded detection
Rotation allows negative numbers
Scaling allows larger numbers
Added automated handling for filament out detection and hyperlinks to web content for filament errors

===============
version 1.01.03
===============
Firmware update to v721
	Robox will re-print last print job whether AutoMaker is attached on not - activate using two short presses of the eject button on the printer
	Change in default steps per unit to improve part accuracy
	Improvement in auto-levelling for long extrusions
	Fixed pause/resume feed rate issue

Print job / firmware transfer speeds significantly increased
Resume failed data transfer added (allows unplug/replug during transfer)
Auto-display scale added for displays less than 800 pixels high.
Fixed an issue when filament slip is detected during purge - options were switched over
STL load optimised
Language files updated for German, Finnish, Swedish, Japanese, Russian, Korean and Traditional Chinese - added Spanish
Added drag and drop for Robox project files
Fixed minor issues on About page - added copy buttons for serial numbers
Allow 1 decimal place for scaling operations
Fixed issue where print status disappears when filament is ejected and reloaded during a print

User Preferences - accessed via the gear icon at the top right of the screen:
-----------------------------------------------------------------------------
Safety features on/off
	Safety features are on by default. This prevents door open when the bed is hot, printing from starting when the door is open and forces cool-down before opening the door at the end of a print.
First use
	Causes a first use print project to be opened automatically - all users are encouraged to print this Robox robot first
Advanced mode - !!IMPORTANT!!
	Some controls have been disabled by default. Switch advanced mode on to access them but you must agree with warranty conditions before enabling this function.
===============

version 1.01.02
Firmware update to v713
Modified PLA temperature settings
Modified Draft, Normal and Fine profiles
Improved nozzle position control handling
Added mini-purge to nozzle opening calibration sequence
Improved Remove Head function
Modified filament load to ensure filament is moved as far into the head as possible
Improved filament eject function
Improved error handling during purge and calibration
Removed colour change button as this can now be achieved using pause/eject/reload/resume

version 1.01.01
Firmware update to v703
Refines multi-point bed levelling and height calibration

version 1.01.00
Major GUI update
	- Look and feel refresh
		- Text labels for buttons
		- Clear indication of why make button is not available
		- Added change head button
		- Status page buttons re-organised
		- User preferences added
			- Default slicer
			- Language
	- Calibration sequences updated
		- X Y alignment added
		- Graphical instructions added
	- Improved error handling
	
Model Handling
	 - Incorporated My Mini Factory model library
	 
Slicing
	- Cura slicing engine now incorporated in addition to Slic3r
	- Print profiles updated
	- Postprocessor improvements

Firmware
	- Updated to v700
	- Improvements in homing, levelling and 

Plus many other bug fixes and minor changes.

Note: Country specific language data will follow in a later release once translations are complete

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
