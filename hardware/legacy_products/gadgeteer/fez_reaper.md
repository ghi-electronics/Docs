# FEZ Raptor

![FEZ Reaper](images/fez_reaper.jpg)

FEZ Reaper is a .NET Gadgeteer product, that utilizes .NET Micro Frameworks (NETMF). The core of FEZ Reaper is the G80 System on Chip (SoC).

# Resources
* [Schematics (add it)]()

# Using the Gadgeteer software
We discourage the use of NETMF and Gadgeteer software technologies on our products in favor for TinyCLR OS, [Read more](intro.html).

# Using TinyCLR OS
If haven't yet, read about using .NET Gadgeteer devices [with TinyCLR OS](intro.html#with-tinyclr-os)

## Loading Bootloader Version 2
The G80 SoC ships with the Bootloader loaded and locked. No further steps are necessary.

## Loading the Firmware

To activate bootloader version 2, press and hold both LDR0 and LDR1 buttons down while resetting the board.

Download the [firmware](http://files.ghielectronics.com/downloads/TinyCLR/Firmware/G80/G80%20Firmware.0.6.0.ghi) and folow [Loading the Firmware](intro.html#loading-the-firmware) steps.
