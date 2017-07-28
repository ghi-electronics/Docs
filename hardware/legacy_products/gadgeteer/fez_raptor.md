# FEZ Raptor

![FEZ Raptor](images/fez_raptor.jpg)

FEZ Raptor is a .NET Gadgeteer product, that utilizes .NET Micro Frameworks (NETMF). The core of FEZ Spider is the G400S System on Module (SoM).

# Resources
* [Schematics (add it)]()

# Using the Gadgeteer software
We discourage the use of NETMF and Gadgeteer software technologies on our products in favor for TinyCLR OS, [Read more](intro.html).

# Using TinyCLR OS
If haven't yet, read about using .NET Gadgeteer devices [with TinyCLR OS](intro.html#with-tinyclr-os)

## Loading Bootloader Version 2
1. Download the [bootloader file](http://files.ghielectronics.com/downloads/Bootloaders/G400%20Bootloader.2.0.3.ghi)
2. (add instructions here. Needs SAM-BA!)

## Loading the Firmware

> [!Tip]
> First make sure you have bootloader Version 2 loaded. This needs to be done only once.

To activate bootloader version 2, press and hold the LDR0 button while resetting the board.

Download the [firmware](http://files.ghielectronics.com/downloads/TinyCLR/Firmware/EMX/EMX%20Firmware.0.6.0.glb) and folow [Loading the Firmware](intro.html#loading-the-firmware) steps.
