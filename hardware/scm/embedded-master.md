# Embedded Master
---
![Embedded Master](images/embedded-master.jpg)

Embedded Master is a [NETMF](../../software/netmf/intro.md) (.NET Micro Framework) System on Module. 

To use with NETMF, follow these [setup instructions](../../software/netmf/getting-started.md). Requires the NETMF 4.1 SDK.

## Resources
* [User Manual](http://files.ghielectronics.com/downloads/Documents/Manuals/Embedded%20Master%20User%20Manual.pdf)

## Using TinyCLR OS
An [unsupported port](https://github.com/ghi-electronics/TinyCLR-Ports) is provided as a starting point for experimenting with TinyCLR OS. 

Once a firmware is built, the following instructions describe how to set up Embedded Master to work with TinyCLR OS. To learn more about TinyCLR OS check out the [TinyCLR Introduction](../../software/tinyclr/intro.md) page.

### Loading Bootloader v2
> [!Tip]
> Bootloader v1 doesn't always work with Windows version 7 and later (Error code 10). You can use the serial option to update the loader.
> This is a one-time procedure. You should have no issues after bootloader v2 is installed.

Embedded master comes with Bootloader v1 pre-installed. To install v2 of the bootloader, follow the instructions on the [Upgrading GHI Bootloader v1 to v2](../../software/loaders/upgrading-v1-to-v2.md) page. To put your Embedded Master board into boot mode, set the up, down, and select pins (3, 7, and 53 on TFT or 43 on non-TFT) low and reset the board.

### Loading the Firmware

To activate bootloader v2, set the up-pin low and then reset your board. To enter USB mode, set the select-pin.

Now you can follow [Loading the Firmware](../../software/loaders/ghi-bootloader.md) steps.
