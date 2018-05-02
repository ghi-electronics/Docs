# Bootloaders Introduction
---
![Bootloader](images/bootloader-noborder.png)

A bootloader is a small software that boots up the system and runs the firmware. It is also used to update the firmware.

This section covers different bootloader features and usage details.

## GHI Bootloader
The [GHI Bootloader](ghi-bootloader.md) page can be found [here](ghi-bootloader.md). This page describes the bootloader commands, using the bootloader to load firmware onto a device, and has a [**downloads**](ghi-bootloader.md#downloads) section where you can find the bootloaders for our products.

## STM32 Bootloader
The [STM32 Bootloader](stm32-bootloader.md) page can be found [here](stm32-bootloader.md). This page covers loading .hex, .bin, and .dfu files onto our STM32 based devices.

## SAM-BA Bootloader
The SAM-BA Bootloader lives on many Atmel chips. It is necessary to load files (loaders and/or firmware) onto the chip. Several TinyCLR OS supported boards will use this loader to load the software. The [SAM-BA Bootloader](sam-ba-bootloader.md) page can be found [here](sam-ba-bootloader.md).

## Upgrading Bootloader v1 to Bootloader v2
Some of our earlier devices based on the NXP LPC family of microcontrollers come shipped with our Bootloader v1 installed. These include the Embedded Master, EMX, G120, G120E, and USBizi devices. To upgrade this bootloader to v2, go to the [GHI v1 to v2 bootloader page](upgrading-v1-to-v2.md)

## Mikro Bootloader
MikroElektronika's bootloader is found on several products offered by them. Some of the TinyCLR OS supported boards are made by MikroElectronika and include this loader by default.

This page covers it in full details https://learn.mikroe.com/bootloaders/

