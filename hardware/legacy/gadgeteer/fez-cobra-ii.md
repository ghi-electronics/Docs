# FEZ Cobra II Eco and WiFi
---
![FEZ Cobra II Eco](images/fez-cobra-ii.jpg) ![FEZ Cobra II Wifi](images/fez-cobra-ii-wifi.jpg)

FEZ Cobra II is a .NET Gadgeteer product that utilizes .NET Micro Frameworks (NETMF). The core of FEZ Cobra II is the G120 System on Module (SoM).

## Resources
* [Schematic](http://files.ghielectronics.com/downloads/Schematics/FEZ/FEZ%20Cobra%20II%20Schematic.pdf)
* Cobra II Extender [schematic](http://files.ghielectronics.com/downloads/Schematics/FEZ/FEZ%20Cobra%20II%20Extender%20Schematic.pdf)

## Using the Gadgeteer software
We discourage the use of NETMF and Gadgeteer software technologies on our products in favor for TinyCLR OS. [Read more](intro.md) about the use of NETMF, Gadgeteer and TinyCLR OS.

## Using TinyCLR OS
If haven't yet, read about using .NET Gadgeteer devices [with TinyCLR OS](intro.md#with-tinyclr-os)

### Loading Bootloader v2
Follow the instructions on the [G120 page](../../../hardware/scm/g120.md)

### Loading the Firmware

> [!Tip]
> First make sure you have bootloader v2 loaded. This needs to be done only once.

To activate bootloader v2, press and hold the LDR0 button while resetting the board.

Download the [G120 firmware](../../../software/tinyclr/downloads.md#g120) and follow [Loading the Firmware](../../../software/tinyclr/loaders/ghi-bootloader.md#loading-the-firmware) steps.

