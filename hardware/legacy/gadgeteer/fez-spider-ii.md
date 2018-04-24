# FEZ Spider II
---
![FEZ Spider II](images/fez-spider-ii.jpg)

FEZ Spider II is a .NET Gadgeteer product that utilizes .NET Micro Frameworks (NETMF). The core of FEZ Spider II is the G120E System on Module (SoM).

# Resources
* [Schematic](http://files.ghielectronics.com/downloads/Schematics/FEZ/FEZ%20Spider%20II%20Schematic.pdf)

# Using the Gadgeteer software
We discourage the use of NETMF and Gadgeteer software technologies on our products in favor for TinyCLR OS. [Read more](intro.md) about the use of NETMF, Gadgeteer and TinyCLR OS.

# Using TinyCLR OS
If haven't yet, read about using .NET Gadgeteer devices [with TinyCLR OS](intro.md#with-tinyclr-os)

## Loading Bootloader v2

1. Download the [bootloader file](../../../software/tinyclr/loaders/ghi-bootloader.md#g120)
2. Set the board's configuration switches in boot mode. That is by setting switches #1 and #2 to the on position.
3. Connect the FEZ Spider to a power module (red module) and then to a PC.
4. The PC will now detect a virtual serial (COM) device. If you need drivers, they are in the [NETMF](../../../software/netmf/intro.md) SDK.
5. Open any terminal software, we recommend [Tera Term](http://ttssh2.osdn.jp/).
6. Select serial and pick the COM port associated with your board.
7. Enter `E` and you will see back "Erase all memory! Are you sure?" now enter `Y`. (The bootloader is case sensitive)
8. Enter `X` and you will see `CCCC`... showing on the terminal.
9. Now go to `File` -> `Transfer` -> `XMODEM` -> `Send` and then check the `1K` option.
10. Select the bootloader file you have downloaded above.
11. You will see `File Transfer Finished Successfully`.
12. Change the configuration switches back to the off position and reset the board.
13. You are now running GHI Electronics bootloader v2!

## Loading the Firmware

> [!Tip]
> First make sure you have bootloader v2 loaded. This needs to be done only once.

To activate bootloader v2, set the configuration switch #1 to the on position and then reset your board. Make sure to set back to off after loading the firmware.

Download the [G120 firmware](../../../software/tinyclr/downloads.md#g120) and follow [Loading the Firmware](../../../software/tinyclr/loaders/ghi-bootloader.md#loading-the-firmware) steps.

