# Introduction
---
![FEZ](images/fez-noborder.jpg)

## The Maker Board to Rule Them All!
FEZ (fast and easy) is our magnificent maker board. This low cost board offers Arduino pinout compatibility, optional WiFi for IoT applications, and can be programmed using multiple programming languages and development environments. However, we are focused on TinyCLR OS support to program the board in .NET C# and Visual Basic.

Pricing, purchasing and other information can be found on the [FEZ page](https://www.ghielectronics.com/products/FEZ) on our main website.

| Spec           | Value                           |
|----------------|---------------------------------|
| Processor      | STMicroelectronics ST32F401RET6 |
| Speed          | 84 MHz                          |
| Internal RAM   | 96 KByte                        |
| Internal Flash | 512 KByte                       |
| Dimensions     | 70.6 x 56.0 x 14.5 mm           |


| Peripheral         | Quantity          |
|--------------------|-------------------|
| GPIO (5V tolerant) | 22                |
| IRQ                | 22                |
| UART               | 1                 |
| I2C                | 1                 |
| SPI                | 1                 |
| PWM                | 8                 |
| 12 Bit ADC         | 8                 |
| CAN                | 0                 |
| USB Client         | 1                 |
| WiFi              | Optional          |

\**Note:  Many peripherals share I/O pins.  Not all peripherals will be available to your application.*

![FEZ Pinout](images/fez.gif)

## Resources
* [Schematic](http://files.ghielectronics.com/downloads/Schematics/FEZ/FEZ%20T18%20Rev%20D%20Schematic.pdf)
* [TinyCLR Tutorials](../../software/tinyclr/tutorials/intro.md)
* [Instructions](../components/spwf04sa.md) for updating the WiFi module firmware.

FEZ can be powered through the USB connector and/or the power connector. The barrel jack is pin positive, sleeve negative, 2.1mm. It is capable of anywhere 6V to 9V. 500mA of power should be enough for most needs.

Our TinyCLR operating system lets you program the FEZ (and other devices) in C# or Visual Basic using Microsoft's Visual Studio -- and it's all free!  [**Learn more...**](tinyclr.md).

## Programming Options

|  |  |
|--|--|
| **TinyCLR** </br> Embedded programming using Visual Studio .NET. [**Learn more...**](tinyclr.md) | **Arduino** </br> Very popular open source standard. [**Learn more...**](arduino.md) |
| [![TinyCLR](images/tinyclrlogo.jpg)](tinyclr.md) | [![Arduino](images/arduino-logo.png)](arduino.md) |
| **Mbed** </br> Free online C/C++ compiler. [**Learn more...**](mbed.md) | **MicroPython** </br> A version of Python for microcontrollers. [**Learn more...**](python.md) |
| [![Mbed Logo](images/mbed-logo.png)](mbed.md) | [![G400S](images/micro-python-logo.png)](python.md) |
| **Bare Metal** </br> Use the Cortex-M4 compiler of your choice. [**Learn more...**](bare-metal.md) | **Shields** </br> Selected to help get you started. [**Learn more...**](shields/shields.md)
| [![Sample Code](images/code.png)](bare-metal.md) | [![Accessories](images/projects.png)](shields/shields.md)

***

Visit our main website at [**www.ghielectronics.com**](http://www.ghielectronics.com) and our community forums at [**forums.ghielectronics.com**](https://forums.ghielectronics.com/).
