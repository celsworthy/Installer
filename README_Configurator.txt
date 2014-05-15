CEL Configurator Readme

version 0.10.02
Fixed post processor - force fill nozzle on first layer
Fixed post processor - subsequent layer temperature
Modified installation - Slic3r installs to Common directory

version 0.10.01
First Beta version

version 0.02.03
Updates to pre-processor. Default is that nozzle close is triggered by retracts in input gcode only.

version 0.02.02
Updates to pre-processor. Now in testable state.

version 0.02.01
Major update:
Slic3r v1.1.0 included as-is
Post-processor added to alter Slic3r output to work with Robox

version 0.01.57
Improved printer error checking.
Included all known errors from printer.
Fixed door open visibility
Altered open/close and select nozzles on status page to be momentary action
buttons.

version 0.01.56
Modified shutdown sequence to improve hung java executable issue.

version 0.01.55
Compatibility with v577 firmware.
Many other changes...

version 0.01.44
Model load directory now starts at project directory on each run. The directory is remembered from load to load.
Initial Metro UI build.
Last layout tab is now remembered for forward/backward transitions.
Heater on/off indication fixed.
Send GCode button on advanced status page fixed.

version 0.01.43
Updated for Windows 8.1 with latest version of Slic3r.
TEST VERSION ONLY!!

version 0.01.42
Updated Head programming field.
Added colour and status to printer status list.

version 0.01.41
Fixed serial port plug/replug issue on Windows 8.1.

version 0.01.40
Upgrade install now works on windows without uninstall first.

version 0.01.39
Mavenised project.
Added signed driver and installer for windows.

version 0.01.38
Improved firmware upgrade logic.
Added heater control buttons.

version 0.01.37
Updated to work with v508 firmware.
SD card detection is now integrated into the regular status report.

version 0.01.36
Major update:
Filament and PrintProfile now read from configuration files both local and application level.
Separated core functionality from the application to allow multiple sub-applications to be developed.
Fixed input boxes for filament diameter and extrusion multiplier to allow decimal point entry
Changed reel temperature fields to display integers
Fixed issue where rejection of firmware upgrade caused an endless loop
Changed windows version to use My Documents for profiles, filaments and projects

version 0.01.35
Modified restricted text fields.
Fixed visibility of advanced print controls...

version 0.01.34
Fixed issue where .config data for arrays was not being shown in the UI.

version 0.01.33
Restricted textfields fixed to allow copy/paste/overwrite correctly
GCode transcript now supports copy
Abort/Print/Resume macros now output to the GCode transcript
Abort print button now only available when print is paused
Advanced print controls (jog etc) only visible if printer is idle or paused
Fixed error in resume code that made print appear to cancel on resume
KNOWN ERROR: array elements do not load from config files (e.g. nozzle_finish...)

version 0.01.32
Target temperature box update fixed on startup with connected printer.
Nozzle switching in custom settings fixed.

version 0.01.30
Target temperatures shown as arrows.
Pause and resume print implemented.

version 0.01.27
Compatibility with v492 firmware.
Temperature graph fixed. Target temperatures shown as diamonds.

version 0.01.27
Compatibility with v478 firmware

version 0.01.25
Modified the settings page to include cooling data, extrusion width and filament diameter.
Filament settings are now not overriden when changing quality settings.

version 0.01.24
Removed XYZE elements from the status page.
Repositioned print control buttons.
Altered default configuration files for new start and end gcode.
Fixed issue with restricted text entry boxes.

version 0.01.23
Increased comms timeout to 1 second.

version 0.01.22
Compatibility with firmware v469 (mandatory for this release)

version 0.01.14
Minor installer tweaks.
Icons added for taskbar on Windows and Mac.

version 0.01.13
Enabled autoupdate

version 0.01.12
Harmonised nozzle names with AutoMaker.
Issue fan off before head EEPROM write then fan on to 127 if fan was on before write.
Basic temperature graph available.
GCode Entry changed to Robox console.
Robox console forces entered text to upper case.
Temperature control tab added.

version 0.01.11
Added GCode file sender. This sends a GCode file line by line and doesn't use the SD Card.
Fixed an issue relating to suppression of firmware checks.

version 0.01.10
Reorganised installation directory

version 0.01.09
Initial release
