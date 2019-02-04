# Bootloaders Introduction
---
![Bootloader](images/bootloader-noborder.png)

A bootloader is a small software that boots up the system and runs the firmware. It is also used to update the firmware.

This section covers different bootloader features and usage details.

## GHI Bootloader
The [GHI Bootloader](ghi-bootloader.md) page describes the bootloader commands, using the bootloader to load firmware onto a device.

## STM32 Bootloader
The [STM32 Bootloader](stm32-bootloader.md) page covers loading .hex, .bin, and .dfu files onto our STM32 based devices.

## SAM-BA Bootloader
The [SAM-BA Bootloader](sam-ba-bootloader.md) lives on many Atmel chips. It is necessary to load files (loaders and/or firmware) onto the chip. Several TinyCLR OS supported boards will use this loader to load the software.
