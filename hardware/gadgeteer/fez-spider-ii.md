# FEZ Spider II
---
![FEZ Spider II](images/fez-spider-ii.jpg)

FEZ Spider II is a .NET Gadgeteer product that utilizes .NET Micro Frameworks (NETMF). The core of FEZ Spider II is the G120E System on Module (SoM).

To use with NETMF/Gadgeteer, follow these [setup instructions](../../software/netmf/getting-started.md).

## Resources
* [Schematic](http://files.ghielectronics.com/downloads/Schematics/FEZ/FEZ%20Spider%20II%20Schematic.pdf)

## Using TinyCLR OS
Follow the instructions on the [G120 page](../scm/g120.md) to learn how to use FEZ Spider II TinyCLR OS.

### Loading Bootloader v2

1. Download the [bootloader file](../../software/loaders/ghi-bootloader.md)
2. Set the board's configuration switches in boot mode. That is by setting switches #1 and #2 to the on position.
3. Connect the FEZ Spider to a power module (red module) and then to a PC.
4. The PC will now detect a virtual serial (COM) device. If you need drivers, they are in the [NETMF](../../software/netmf/intro.md) SDK.
5. Open any terminal software, we recommend [Tera Term](http://ttssh2.osdn.jp/).
6. Select serial and pick the COM port associated with your board.
7. Enter `E` and you will see back "Erase all memory! Are you sure?" now enter `Y`. (The bootloader is case sensitive)
8. Enter `X` and you will see `CCCC`... showing on the terminal.
9. Now go to `File` -> `Transfer` -> `XMODEM` -> `Send` and then check the `1K` option.
10. Select the bootloader file you have downloaded above.
11. You will see `File Transfer Finished Successfully`.
12. Change the configuration switches back to the off position and reset the board.
13. You are now running GHI Electronics bootloader v2!

### Loading the Firmware

To activate bootloader v2, set the configuration switch #1 to the on position and then reset your board. Make sure to set back to off after loading the firmware.  You can now load the firmware as explained on the [GHI Bootloader](../../software/loaders/ghi-bootloader.md) page.
