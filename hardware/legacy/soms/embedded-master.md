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

**To update using USB**
1. Download the [bootloader file](../../../software/tinyclr/loaders/ghi-bootloader.md#embedded-master)
2. Set Embedded Master in boot mode, by making pins up, down, and select (3, 7, and 53 on TFT or 43 on non-TFT) low and resetting the Embedded Master.
3. The PC will now detect a virtual serial (COM) device. If you need drivers, they are in the [NETMF](../../../software/netmf/intro.md) SDK.
4. Open any terminal software, we recommend [Tera Term](http://ttssh2.osdn.jp/).
5. Select serial and pick the COM port associated with your board.
6. Enter `E` and you will see back "Erase all memory! Are you sure?" now enter `Y`. (The bootloader is case sensitive)
7. Enter `X` and you will see `CCCC`... showing on the terminal.
8. Now go to `File` -> `Transfer` -> `XMODEM` -> `Send` and then check the `1K` option.
9. Select the bootloader file you have downloaded above.
10. You will see `File Transfer Finished Successfully`.
11. Change the configuration switches back to the off position and reset the board.
12. You are now running GHI Electronics bootloader v2!

**To update using Serial**
1. Connect a development PC to COM1 on Embedded Master, pins 5 and 6 (through RS232 converter or a USB-Serial TTL cable).
2. Set the down and select pins low.
3. Follow the above steps starting at step 4 to load the firmware.

### Loading the Firmware

> [!Tip]
> First make sure you have bootloader v2 loaded. This needs to be done only once.

To activate bootloader v2, set the up pin low and then reset your board. To enter USB mode, set the select pin.

Download the [EMX firmware](../../../software/tinyclr/downloads.md#emx) and follow [Loading the Firmware](../../../software/tinyclr/loaders/ghi-bootloader.md#loading-the-firmware) steps.
