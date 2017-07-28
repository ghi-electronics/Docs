# EMX System on Module
(image)

EMX is a NETMF System on Module.

Resources:
* [Datasheet]()

# Using the NETMF software
We discourage the use of NETMF software on our products in favor for TinyCLR OS, [Read more](intro.md) about the use of NETMF and TinyCLR OS.

# Using TinyCLR OS
If haven't yet, read about using .NET NETMF devices [with TinyCLR OS](intro.md#with-tinyclr-os)

## Loading Bootloader Version 2
> [!Tip]
> The bootloader version 1 doesn't always work with Windows 7 and newer (Error code 10). You can use the serial option to update the loader.
> This is a one-time procedure. You should have no issues after the bootloader V2 is loaded.

**To update using USB**
1. Download the [bootloader file](http://files.ghielectronics.com/downloads/Bootloaders/EMX%20Bootloader.2.0.3.ghi)
2. Set EMX in boot mode, by making pins 3,7 and 53 low and reset EMX. (Pin3=P0.4 | Pin7=P2.5 | Pin53=P2.11)
3. The PC will now detect a virtual serial (COM) device. If you need drivers, they are in the [NETMF](../netmf/intro.md) SDK.
4. Open any terminal software, we recommend [Tera Term](http://ttssh2.osdn.jp/).
5. Select serial and pick the COM port associated with your board.
6. Enter `E` and you will see back "Erase all memory! Are you sure?" now enter `Y`. (The bootloader is case sensitive)
7. Enter `X` and you will see `CCCC`... showing on the terminal.
8. Now go to `File` -> `Transfer` -> `XMODEM` -> `Send` and then check the `1K` option.
9. Select the bootloader file you have downloaded above.
10. You will see `File Transfer Finished Successfully`.
11. Change the configuration switches back to the off position and reset the board.
12. You are now running GHI Electronics bootloader version 2!

**To update using Serial**
1. Connect a development PC to COM1 on EMX, Pin5 and Pin6 (through RS232 converter or a USB-Serial TTL cable).
2. SET LMODE pin low.
3. Follow the steps above to load the firmware.

## Loading the Firmware

> [!Tip]
> First make sure you have bootloader Version 2 loaded. This needs to be done only once.

To activate bootloader version 2, set Pin3 low (double check) and then reset your board.

Download the [firmware](http://files.ghielectronics.com/downloads/TinyCLR/Firmware/EMX/EMX%20Firmware.0.6.0.glb) and folow [Loading the Firmware](intro.md#loading-the-firmware) steps.


# EMX Based products
## EMX Dev Sys
(image)
The development system used for evaluating the EMX SoM.

* [Schematics]()

## FEZ Cobra
(image)
A single board computer

* [Schematics]()

(https://www.ghielectronics.com/downloads/FEZ/Cobra/)
