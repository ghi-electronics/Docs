# FEZ Introduction
---
![FEZ](images/fez_noborder.jpg)

FEZ (fast and easy) is the ultimate maker board. This low cost board offers Arduino pinout compatibility, optional WiFi for IOT applications, and can be programmed using multiple programming languages and development environments including:

* Visual Basic and C# using our TinyCLR operating system and Microsoft's Visual Studio development environment.
* Arduino multi platform development environment.
* Mbed online development environment using C/C++
* MicroPython
* C/C++ using GCC, Keil, or any compiler supporting the Cortex-M4 architecture (for more advanced users).

|  |  |
|--|--|
| **TinyCLR** </br> Embedded programming using Visual Studio .NET. [**Learn more...**](tinyclr.md) | **Arduino** </br> Very popular open source standard. [**Learn more...**](arduino.md) |
| [![TinyCLR](images/tinyclrlogo.jpg)](tinyclr.md) | [![Arduino](images/arduino_logo.png)](arduino.md) |
| **Mbed** </br> Online free C/C++ compiler. [**Learn more...**](mbed.md) | **MicroPython** </br> A version of Python for microcontrollers. [**Learn more...**](python.md) |
| [![Mbed Logo](images/mbed_logo.png)](mbed.md) | [![G400S](images/micro_python_logo.png)](python.md) |
| **Plain Coding!** </br> Use the Cortex-M4 compiler of your choice. [**Learn more...**](plain_coding.md) | **Accessories** </br> Selected to help get you started. [**Learn more...**](accessories.md)
| [![Sample Code](images/code.png)](plain_coding.md) | [![Accessories](images/accessories.png)](accessories.md)

## Specifications

| Spec           | Value                           |
|----------------|---------------------------------|
| Processor      | STMicroelectronics ST32F401RET6 |
| Speed          | 84 MHz                          |
| Internal RAM   | 96 kB                           |
| Internal Flash | 512 kB                          |
| Dimensions     | 70.6 x 56.0 x 14.5 mm           |

## Peripherals

*Note:  Many peripherals share I/O pins.  Not all peripherals will be available to your application.*

| Peripheral         | Quantity          |
|--------------------|-------------------|
| GPIO (5V tolerant) | 22                |
| IRQ                | 22                |
| UART               | 1                 |
| I2C                | 1                 |
| SPI                | 1                 |
| PWM                | 9                 |
| 12 Bit ADC         | 7                 |
| CAN                | 0                 |
| USB Client         | 1                 |
| WiFi               | Optional          |

## Resources
* [Schematic](http://files.ghielectronics.com/downloads/Schematics/FEZ/FEZ%20T18.pdf)
* [TinyCLR Tutorial](../tinyclr/tutorials/intro.md)

## Using NETMF software
We discourage the use of NETMF software on our products in favor of TinyCLR OS. [Read more](../legacy/netmf/intro.md) about the use of NETMF and TinyCLR OS.

## Using TinyCLR OS
TinyCLR is our own operating system and provides a means of programming embedded devices using .NET and Visual Studio.  Visual Studio is widely regarded as one of the best (if not the best) integrated development environments available.  The free Community version of Visual Studio can be downloaded here:  [Visual Studio Downloads](https://www.visualstudio.com/downloads/).  For information on setting up TinyCLR to work in Visual Studio please click here:  [TinyCLR Introduction](../tinyclr/intro.md)

To use TinyCLR with the FEZ you must first install the latest verions of the GHI bootloader and TinyCLR firmware.

### Loading the GHI Bootloader v2
1. Download and save the latest [FEZCLR bootloader file](../tinyclr/loaders/ghi_bootloader.md#fezclr) (v2.x.x).
2. Download and install the [DfuSe USB device firmware upgrade software](http://www.st.com/en/development-tools/stsw-stm32080.html#getsoftware-scroll) from STMicroelectronics (click on the blue [**Get Software**](http://www.st.com/en/development-tools/stsw-stm32080.html#getsoftware-scroll) button).
3. Run the DfuSeDemo program installed in the previous step.  It should appear in the programs menu under `STMicroelectronics`.
4. On the FEZ, hold down the BOOT0 button, press and release the RESET button, and then release the BOOT0 button.  `STM Device in DFU Mode` should now appear under `Available DFU Devices` at the upper left of the DfuSe Demo program screen.
5. Near the bottom of the DfuSe Demo program window click on the `Choose...` button.  Find the bootloader file you saved in step 1 (FEZCLR Bootloader v2.x.x.dfu), click on it and click on the `Open` button.
6. Now click on the upgrade button.  If a dialog box appears with "Your device was plugged in DFU mode..." click the `Yes` button.
7. You should see a message at the bottom of the DfuSe Demo window saying the upgrade was successful.  Now reset the FEZ or click on the `Leave DFU mode` button.
8. Congratulations!  You have successfully installed the GHI bootloader!

### Loading the Firmware

> [!Tip]
> First make sure you have bootloader v2 loaded. This needs to be done only once.

#### Using TinyCLR Config
Our TinyCLR Config tool includes multiple features useful for working with TinyCLR-OS-enabled devices. It simplifies the firmware update and it includes options for accessing the TinyCLR firmware at runtime.

Using this tool is the recommended path; however, the instructions for manually loading the firmware are included below. Read more on the [TinyCLR Config](../tinyclr/tinyclr_config.md) page.

#### Manually Loading the Firmware
We recommend using the TinyCLR Config tool to update the firmware. As a backup, use these instructions:

1. Download and save the latest [FEZCLR firmware](../tinyclr/downloads.md#fezclr)
2. Put the FEZ in bootloader mode: Hold down BTN1, press and release the RESET button, and then release BTN1.
3. Open any terminal software, for example [Tera Term](http://ttssh2.osdn.jp/),
4. Select serial and pick the COM port associated with your board. (If unsure, check Device Manager)
5. Press `V` and then enter. The FEZ will respond with the installed boot loader version number (v2.x.x)
6. Press `U` and then enter to start the upload firmware procedure.
7. Press `Y` to confirm then enter. The FEZ will respond with `CCCC`...
8. Go to `File` -> `Transfer` -> `XMODEM` -> `Send` and then check the `1K` option.
9. Select the firmware file you downloaded in step 1.
10. When the transfer is complete, use the RESET button to reset the FEZ.

***

Visit our main website at [**www.ghielectronics.com**](http://www.ghielectronics.com) and our community forums at [**forums.ghielectronics.com**](https://forums.ghielectronics.com/).
