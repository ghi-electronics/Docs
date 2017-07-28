# Quail
![Quail](images/quail-board.png)

Originally a .NET Micro Framework product, Quail board brings the option of using hundreds of plug-and-play sensors and control modules, thanks to Mikro's [click modules](../accessories/mikroelectronika_click.html). 

Learn more about Quail at:  
https://www.mikrobusnet.org/ and https://shop.mikroe.com/quail  

The netduino firmware is located [here](http://files.ghielectronics.com/downloads/TinyCLR/Firmware/Netduino/Netduino3%20Firmware.0.5.0.hex). Follow the instructions at the [STM32 bootloader](http://docs.ghielectronics.com/hardware/stm32_bootloader.html) page to generate and load a DFU firmware file.

When done, your PC should detect a TinyCLR device. You are now ready to [start coding](http://docs.ghielectronics.com/tinyclr/tutorials/intro.html)

> [!Tip]
>The region set aside for RLI is 0x2002F000 - 0x2002FFF8.