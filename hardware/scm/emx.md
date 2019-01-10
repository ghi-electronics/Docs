# EMX System on Module
---
![EMX SoM](images/emx-som.jpg)

EMX is a NETMF System on Module.

## Resources
* [User Manual](http://files.ghielectronics.com/downloads/Documents/Manuals/EMX%20User%20Manual.pdf)

## Using NETMF software
We discourage the use of NETMF software on our products in favor of TinyCLR OS, but the choice is up to you. To find out more about NETMF, go to our [NETMF Introduction Page](../../software/netmf/intro.md)

## Using TinyCLR OS
The following instructions describe how to set up EMX to work with TinyCLR OS. To learn more about TinyCLR check out the [TinyCLR Introduction](../../software/tinyclr/intro.md) page.

### Loading Bootloader v2
> [!Tip]
> The bootloader version 1 doesn't always work with Windows 7 and newer (Error code 10). You can use the serial option to update the loader.
> This is a one-time procedure. You should have no issues after the bootloader V2 is loaded.

EMX comes with Bootloader v1 pre-installed. To install v2 of the bootloader, follow the instructions on the [Upgrading GHI Bootloader v1 to v2](../../software/tinyclr/loaders/upgrading-v1-to-v2.md) page. To put EMX in boot mode, make pins 3, 7, and 53 low and reset the board (Pin3=P0.4 | Pin7=P2.30 | Pin53=P2.11).

### Loading the Firmware

> [!Tip]
> First make sure you have bootloader v2 loaded. This needs to be done only once.

To activate bootloader v2, set Pin7 (P2.30) low and then reset your board.

Download the [EMX firmware](../../software/tinyclr/downloads.md#emx) and follow [Loading the Firmware](../../software/tinyclr/loaders/ghi-bootloader.md#loading-the-firmware) steps.

## EMX Dev Sys
![EMX Dev Sys](images/emx-dev-sys.jpg)

The development system used for evaluating the EMX SoM.

* [Schematic](http://files.ghielectronics.com/downloads/Schematics/Systems/EMX%20DevSys%20Schematic.pdf)



