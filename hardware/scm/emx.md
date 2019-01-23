# EMX System on Module
---
![EMX SoM](images/emx-som.jpg)

EMX is a [NETMF](../../software/netmf/intro.md) (.NET Micro Framework) System on Module.

To use with NETMF, follow the [setup instructions](../../software/netmf/getting-started.md).

## Resources
* [User Manual](http://files.ghielectronics.com/downloads/Documents/Manuals/EMX%20User%20Manual.pdf)

## Using TinyCLR OS
An [unsupported port](https://github.com/ghi-electronics/TinyCLR-Ports) is provided as a starting point for experimenting with TinyCLR OS.

Once a firmware is built, the following instructions describe how to set up EMX to work with TinyCLR OS. To learn more about TinyCLR OS check out the [TinyCLR Introduction](../../software/tinyclr/intro.md) page.

### Loading Bootloader v2
> [!Tip]
> Bootloader v1 doesn't always work with Windows 7 and newer (Error code 10). You can use the serial option to update the loader.
> This is a one-time procedure. You should have no issues after the bootloader v2 is loaded.

EMX comes with Bootloader v1 pre-installed. To install v2 of the bootloader, follow the instructions on the [Upgrading GHI Bootloader v1 to v2](../../software/loaders/upgrading-v1-to-v2.md) page. To put EMX in boot mode, make pins 3, 7 and 53 low and reset the board (Pin3=P0.4 | Pin7=P2.30 | Pin53=P2.11).

### Loading the Firmware

To activate bootloader v2, set Pin3 low and then reset your board.


Now you can follow [Loading the Firmware](../../software/loaders/ghi-bootloader.md) steps.

## EMX Dev Sys
![EMX Dev Sys](images/emx-dev-sys.jpg)

The development system used for evaluating the EMX SoM.

* [Schematic](http://files.ghielectronics.com/downloads/Schematics/Systems/EMX%20DevSys%20Schematic.pdf)



