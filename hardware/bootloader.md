# Bootloader

The GHI Bootloader is used to update the firmware on our devices. It is the first program to run and unless the device specific LDR pins are set (see device documentation for details), it will execute the firmware on the device if present. The bootloader communicates over a USB virtual serial port or a regular serial port. The interface used is usually controlled by a MODE pin. See your device specifications for details on interface configuration and selection and for which version of the bootloader it runs.

## Version 2.0+
All commands and results are terminated with CR and LF (\r\n). "OK." will be sent after each successful command.

On startup, a banner is sent that is terminated by "OK.". Once the banner is received, you are free to enter any of the case-insensitive single-character commands described below.

Most commands require confirmation. Send Y or y followed by a new-line to proceed or anything else to cancel.

- V: returns the current version.
- N: returns the current device type.
- E: erases all user sectors of the device.
- R: runs the firmware if present.
- B: increases the baud rate in serial mode to 921,600.
- X: upload a file to the device using 1K XMODEM. Only send *.ghi files meant for your device.
- U: upload a file to the device using 1K XMODEM. Only send *.glb files meant for your device.

## Version 1.0+
Currently the EMX, G120, and G120E use this version of the bootloader. All results are terminated with LF (\n). Commands are executed as soon as they entered without waiting for a new-line. "BL" or "Done." will be sent after each command.

On startup, a banner is sent that is terminated by "BL". Once the banner is received, you are free to enter any of the case-sensitive single-character commands described below.

- V: returns the current version.
- E: erases all user sectors of the device (* is sent while erasing).
- R: runs the firmware if present.
- B: increases the baud rate in serial mode to 921,600.
- X: upload a file to the device using 1K XMODEM. Only send *.ghi files meant for your device. The firmware is automatically run after a successful upload.