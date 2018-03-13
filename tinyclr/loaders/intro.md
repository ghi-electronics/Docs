# Bootloaders Introduction
---
![Bootloader](images/bootloader_noborder.png)

A bootloader is a small software that boots up the system and runs the firmware. It is also used to update the firmware.

This section covers different bootloader features and usage details.

## GHI Bootloader
The [**GHI Bootloader**](ghi_bootloader.md) page can be found [**here**](ghi_bootloader.md).

## STM32 Bootloader
The [**STM32 Bootloader**](stm32_bootloader.md) page can be found [**here**](stm32_bootloader.md).

## SAMBA Bootloader
The SAMBA Bootloader lives on many Atmel chips. It is necessary to load files (loaders and/or firmware) onto the chip. Several TinyCLR OS supported boards will use this loader to load the software.

### Uploading bin Files
To set the chip in SAMBA mode, hold down the dedicated button on your board when the system powers up. If there is no such button, make sure SPI1_MISO is low instead. The device manager will show a COM port similar to "Bossa Program Port" or "GPS Detect".

1. If it is not already installed, download and install the SAM-BA tool from [Microchip](http://www.microchip.com/developmenttools/productdetails.aspx?partno=atmel%20sam-ba%20in-system%20programmer). The latest version we have tested is 2.18 for Windows.
2. Open the SAM-BA program then select the COM port for your device in the connection box and your board type below it, then click connect.
3. In the bottom half of the Window, go to the `DataFlash AT45DB/DCB` tab.
4. Under `Scripts`, select `Enable Dataflash (SPI0 CS0)` then click execute.
5. Under `Scripts`, select `Erase All` then click execute. This will take some time to complete and the program may appear to freeze during it.
6. Under `Scripts`, select `Send Boot File`, click execute, then browse to and select the bootloader for the device.
7. Once the transfer finishes, go to `File` > `Quit` and then reset the board. Make sure to properly quit the program or connection errors may result on subsequent uses.
8. Congratulations, your board is now running the loaded program!

## Mikro Bootloader
MikroElektronika's bootloader is found on several products offered by them. Some of the TinyCLR OS supported boards are made by MikroElectronika and include this loader by default.

This page covers it in full details https://learn.mikroe.com/bootloaders/

