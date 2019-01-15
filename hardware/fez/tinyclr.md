# TinyCLR OS
---
![TinyCLR Logo](../../software/tinyclr/images/tinyclr-logo-noborder.jpg)

TinyCLR is our own operating system and allows you to program the FEZ in C# or Visual Basic using Microsoft's Visual Studio development environment.

To start using TinyCLR with the FEZ you must first:
* Set up your computer:  Install Visual Studio, the TinyCLR OS extensions and NuGet packages.
* Set up your FEZ:  Install the GHI bootloader (if not installed already) and latest TinyCLR firmware.

## Setting Up Your Computer
Instructions for setting up your computer are found [here](../../software/tinyclr/getting-started.md#tinyclr-computer-setup) on the [Getting Started]under the TinyCLR section of our documentation.

## Setting Up the FEZ
The following instructions explain how to install the bootloader and TinyCLR firmware on the FEZ.  The bootloader should be installed on the FEZ already.  It does not need to be reinstalled unless it becomes deleted or corrupted.

The firmware may come pre-installed on the FEZ, but it might not be the latest version.  If you are having problems or just want to make sure your FEZ is up to date with the latest release, use the [TinyCLR Config](../../software/tinyclr/tinyclr-config.md) tool to install the latest firmware.  We have also included instructions for manually installing the firmware if that's what you prefer.

### Loading the GHI Bootloader v2
The bootloader comes pre-installed on the FEZ and should not need to be reinstalled unless it is erased or becomes corrupted. Also, some advanced programming techniques require you to erase the bootloader (for example Mbed).

If you do need to reinstall the bootloader instructions are found on the [STM32 Bootloader](../../software/loaders/stm32-bootloader.md) page under [Loading the GHI Bootloader v2](../../software/loaders/stm32-bootloader.md#loading-the-ghi-bootloader-v2). When you are asked to put the FEZ in DFU mode, hold down the BOOT0 button, press and release the RESET button, and then release the BOOT0 button.

### Loading the Firmware
> [!Tip]
> First make sure you have bootloader v2 loaded. This needs to be done only once.

#### Using TinyCLR Config
Our [TinyCLR Config](../../software/tinyclr/tinyclr-config.md) tool includes multiple features useful for working with TinyCLR-OS-enabled devices. It simplifies the firmware update and it includes options for accessing the TinyCLR firmware at runtime.

Using this tool is the recommended path; however, the instructions for manually loading the firmware are included below. Read more on the [TinyCLR Config](../../software/tinyclr/tinyclr-config.md) page.

#### Manually Loading the Firmware
We recommend using the TinyCLR Config tool to update the firmware. As a backup, use these instructions:

1. Download and save the latest [FEZCLR firmware](../../software/tinyclr/downloads.md#fezclr)
2. Put the FEZ in bootloader mode: Hold down BTN1, press and release the RESET button, wait a second or two, and then release BTN1.
3. Open any terminal software, for example [Tera Term](http://ttssh2.osdn.jp/),
4. Select serial and pick the COM port associated with your board. (If unsure, check Device Manager)
5. Press `V` and then enter. The FEZ will respond with the installed boot loader version number (v2.x.x)
6. Press `U` and then enter to start the upload firmware procedure.
7. Press `Y` to confirm then enter. The FEZ will respond with `CCCC`...
8. Go to `File` -> `Transfer` -> `XMODEM` -> `Send` and then check the `1K` option.
9. Select the firmware file you downloaded in step 1.
10. When the transfer is complete, press the RESET button on the FEZ.

## Using Native Code with TinyCLR
TinyCLR OS also lets you use native code that that works alongside your managed application. Native code can be used to provide improved performance or access to advanced features not exposed through TinyCLR. For more information check out [Native Code on TinyCLR](../../software/tinyclr/native/intro.md).

TinyCLR cannot relocate native code, so you will have specify its location in the scatterfile. For the FEZ, the interop region starts at address 0x20016000, and its length is 0x3F8.


***
Check out our [**TinyCLR Tutorials**](../../software/tinyclr/tutorials/intro.md)!

Visit our main website at [**www.ghielectronics.com**](http://www.ghielectronics.com) and our community forums at [**forums.ghielectronics.com**](https://forums.ghielectronics.com/).