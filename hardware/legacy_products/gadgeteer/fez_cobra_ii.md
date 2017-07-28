# FEZ Cobra II

![FEZ Cobra II](images/fez_cobra_ii.jpg)

FEZ Cobra II is a .NET Gadgeteer product, that utilizes .NET Micro Frameworks (NETMF). The core of FEZ Cobra II is the G120 System on Module (SoM).

# Resources
* [Schematics (add it)]()

# Using the Gadgeteer software
We discourage the use of NETMF and Gadgeteer software technologies on our products in favor for TinyCLR OS, [Read more](intro.html).

# Using TinyCLR OS
If haven't yet, read about using .NET Gadgeteer devices [with TinyCLR OS](intro.html#with-tinyclr-os)

## Loading Bootloader Version 2
1. Download the [bootloader file](http://files.ghielectronics.com/downloads/Bootloaders/G120%20Bootloader.2.0.3.ghi)
2. Press and keep holding the LDR0 and LDR1 buttons while reseting the board. Then release the buttons.
4. The PC will now detect a virtual serial (COM) device. If you need drivers, they are in the [NETMF](../netmf/intro.html) SDK.
5. Open any terminal software, we recommend [Tera Term](http://ttssh2.osdn.jp/).
6. Select serial and pick the COM port associated with your board.
7. Enter `E` and you will see back "Erase all memory! Are you sure?" now enter `Y`. (The bootloader is case sensitive)
8. Enter `X` and you will see `CCCC`... showing on the terminal.
9. Now go to `File` -> `Transfer` -> `XMODEM` -> `Send` and then check the `1K` option.
10. Select the bootloader file you have downloaded above.
11. You will see `File Transfer Finished Successfully`.
13. Reset your board, you are now running GHI Electronics bootloader version 2!

## Loading the Firmware

> [!Tip]
> First make sure you have bootloader Version 2 loaded. This needs to be done only once.

To activate bootloader version 2, press and hold the LDR0 button while resetting the board.

Download the [firmware](http://files.ghielectronics.com/downloads/TinyCLR/Firmware/EMX/EMX%20Firmware.0.6.0.glb) and folow [Loading the Firmware](intro.html#loading-the-firmware) steps.
