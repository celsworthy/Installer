CEL AutoMaker README

version 0.10.10
Delete macro print jobs after transfer to printer.
Fixes issue ROB-95 - Macros need to be pausable, resumeable and cancellable.
Fixes issue ROB-90 - Switch head LED on after heating and off after calibration.
Fixes issue ROB-91 - Test on nozzle calibration page pushes buttons off bottom
Fixes issue ROB-70 - Reprint is allowed when an amendment has been made to the custom profile
Fixes issue ROB-92 - 1st text on nozzle height is wrong... nozzle offset calibration
Fixes issue ROB-30 - When Custom Profile is selected open the advanced slider
Enhanced settings slideout so that the material/profile tabs are selected when a material is selected or the print quality is changed.
Fixes ROB-70 - Reprint is allowed when an amendment has been made to a custom profile
Fixed error in purge task - since the firmware raises an error when a macro command is issued (if a purge is required) - it is necessary to set the new head eeprom values first.
Fixes issue ROB-7 - Save last file location for all explorer prompts.
Update URL for software support page
Change printer detection on linux
Fixes ROB-19 - Delete key should delete selected part from plate.
Handle machine type not recognised Handle 3D support not available
Added javadoc for modified code.
Fixes Task ROB-87 Print button should not be available if head is not attached.
Minor updates to improve debugging + increase size of translation drag plane to improve 3d manipulation.
Allow ' and <space> in printer ID entry box

version 0.10.9
Fixes the following issues:
ROB-78 Choose printer - saving name doesn't work, colour order ?
ROB-66 Macros or callibration sequances shouldn't be execuitable during print job or pause
ROB-65 Macro transfer Didn't close dialog box.
ROB-64 Hardware Pause during print Job transfer doesn't show on Screen.
ROB-8  There is no warning that closing the Automaker before transfer is complete will mean mean an unfinished model

version 0.10.8
Fixes the following issues:
ROB-1 Projects do not load after quit
ROB-4 Pressing Pause then Abort during a print job cause print job hang
ROB-14 Print can be started without filament loaded.
ROB-18 Print profiles that use only T0 nozzle dont post process correctly.
ROB-82 Auto-purge reruns and doesn't write temperature to head
ROB-83 Extruder jog buttons should send G1 F100 and not G0

version 0.10.02
Fixed post processor - force fill nozzle on first layer
Fixed post processor - subsequent layer temperature
Modified installation - Slic3r installs to Common directory

version 0.10.01
First Beta version.
