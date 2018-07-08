# FEZ Raptor
---
![FEZ Raptor](images/fez-raptor.jpg)

FEZ Raptor is a .NET Gadgeteer product that utilizes .NET Micro Frameworks (NETMF). The core of FEZ Raptor is the G400S System on Module (SoM).

## Resources
* [Schematic](http://files.ghielectronics.com/downloads/Schematics/FEZ/FEZ%20Raptor%20Schematic.pdf)

## Using the Gadgeteer software
We discourage the use of NETMF and Gadgeteer software technologies on our products in favor for TinyCLR OS. [Read more](intro.md) about the use of NETMF, Gadgeteer and TinyCLR OS.

## Using TinyCLR OS
If haven't yet, read about using .NET Gadgeteer devices [with TinyCLR OS](intro.md#with-tinyclr-os)

### Loading GHI Bootloader v2
Follow the exact same steps found on the [G400](../scm/g400s.md) page.

### Loading the Firmware

> [!Tip]
> First make sure you have bootloader v2 loaded. This needs to be done only once.

To activate bootloader v2, press and hold the LDR0 button while resetting the board.

Download the [G400 firmware](../../software/tinyclr/downloads.md#g400) and follow [Loading the Firmware](../../software/tinyclr/loaders/ghi-bootloader.md#loading-the-firmware) steps.

