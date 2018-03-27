# FEZ Spider

![FEZ Spider](images/fez_spider.jpg)

FEZ Spider is a .NET Gadgeteer product that utilizes .NET Micro Frameworks (NETMF). The core of FEZ Spider is the EMX System on Module (SoM).

# Resources
* [Schematic](http://files.ghielectronics.com/downloads/Schematics/FEZ/FEZ%20Spider%20Schematic.pdf)

# Using the Gadgeteer software
We discourage the use of NETMF and Gadgeteer software technologies on our products in favor for TinyCLR OS. [Read more](intro.md) about the use of NETMF, Gadgeteer and TinyCLR OS.

# Using TinyCLR OS
If haven't yet, read about using .NET Gadgeteer devices [with TinyCLR OS](intro.md#with-tinyclr-os)

## Loading Bootloader v2
> [!Tip]
> The EMX bootloader version 1 doesn't always work with Windows 7 and newer (Error code 10). You can use the serial option to update the loader.
> This is a one-time procedure. You should have no issues after the bootloader V2 is loaded.

**To update using USB**
1. Download the [EMX bootloader file](../../../software/tinyclr/loaders/ghi_bootloader.md#emx)
2. Set the board's configuration switches in boot mode. That is by setting switches #1, #2 and #3 to the `ON` position.
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

**To update using Serial**
1. Connect a USB-serial module to socket 11.
2. Follow the exact same steps above except you need to also switch #4 to `ON` (serial mode) and you need to set the baud rate to 115200 on the terminal software.
3. The drivers for the USB-serial module should load automatically. If not, get them from http://www.ftdichip.com/

## Loading the Firmware

> [!Tip]
> First make sure you have bootloader v2 loaded. This needs to be done only once.

To activate bootloader v2, set the configuration switch #1 to the on position and then reset your board. Make sure to set back to off after loading the firmware.

Download the [EMX firmware](../../../software/tinyclr/downloads.md#emx) and follow [Loading the Firmware](../../../software/tinyclr/loaders/ghi_bootloader.md#loading-the-firmware) steps.

