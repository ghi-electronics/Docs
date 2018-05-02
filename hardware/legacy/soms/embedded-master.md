# Embedded Master
---
![Embedded Master](images/embedded-master.jpg)

Embedded Master is a NETMF System on Module. 

## Resources
* [User Manual](http://files.ghielectronics.com/downloads/Documents/Manuals/Embedded Master User Manual.pdf)

## Using NETMF software
We discourage the use of NETMF software on our products in favor of TinyCLR OS, but the choice is up to you. Embedded Master will only work with the NETMF 4.1 SDK. To find out more about NETMF, go to our [NETMF Introduction Page](../../../software/netmf/intro.md)

## Using TinyCLR OS
The following instructions describe how to set up Embedded Master to work with TinyCLR OS. To learn more about TinyCLR check out the [TinyCLR Introduction](../../../software/tinyclr/intro.md) page.

### Loading Bootloader v2
> [!Tip]
> Bootloader version 1 doesn't always work with Windows version 7 and later (Error code 10). You can use the serial option to update the loader.
> This is a one-time procedure. You should have no issues after bootloader V2 is installed.

Embedded master comes with Bootloader v1 pre-installed. To install v2 of the bootloader, follow the instructions on the [Upgrading GHI Bootloader v1 to v2](../../../software/tinyclr/loaders/upgrading-v1-to-v2.md) page. To put your Embedded Master board into boot mode, set the up, down, and select pins (3, 7, and 53 on TFT or 43 on non-TFT) low and reset the board.

### Loading the Firmware

> [!Tip]
> First make sure you have bootloader v2 loaded. This needs to be done only once.

To activate bootloader v2, set the up pin low and then reset your board. To enter USB mode, set the select pin.

Download the [EMX firmware](../../../software/tinyclr/downloads.md#emx) and follow [Loading the Firmware](../../../software/tinyclr/loaders/ghi-bootloader.md#loading-the-firmware) steps.
