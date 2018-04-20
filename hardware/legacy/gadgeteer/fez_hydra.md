# FEZ Hydra
---
![FEZ Hydra](images/fez_hydra.jpg)

FEZ Hydra is a .NET Gadgeteer product that utilizes .NET Micro Frameworks (NETMF).

# Resources
* [Schematic](http://files.ghielectronics.com/downloads/Schematics/FEZ/FEZ%20Hydra%20Schematic.pdf)

# Using the Gadgeteer software
We discourage the use of NETMF and Gadgeteer software technologies on our products in favor for TinyCLR OS. [Read more](intro.md) about the use of NETMF, Gadgeteer and TinyCLR OS.

# Using TinyCLR OS
TinyCLR is our own operating system and provides a means of programming embedded devices using .NET and Visual Studio.  Visual Studio is widely regarded as one of the best (if not the best) integrated development environments available.  The free Community version of Visual Studio can be downloaded here:  [Visual Studio Downloads](https://www.visualstudio.com/downloads/).  For information on setting up TinyCLR to work in Visual Studio please click here:  [TinyCLR Introduction](../../../software/tinyclr/intro.md)

## Loading Bootloader v2
1. Download the [bootloader file](../../../software/tinyclr/loaders/ghi_bootloader.md#fez-hydra).
2. Enter SAM-BA mode by connecting SPI1_MISO pin to ground and reset the board. Wait three seconds and remove the connection between SPI1_MISO and ground. SPI1_MISO is pin 8 on socket 3, and ground is pin 10. On later revisions of the board, you can hold down the small button labelled `S1` near the processor instead.  
3. Open up the Device Manager, look under Ports, and find a COM port similar to "Bossa Program Port" or "GPS Detect".
4. Follow the steps for the [SAM-BA bootloader](../../../software/tinyclr/loaders/intro.md#sam-ba-bootloader), connecting to the COM port in the previous step. The FEZ Hydra is based on the AT91SAM9RL64-EK. You may get a warning saying that external RAM access is required to run applets. Click yes that you do want to continue anyway.

**Gadgeteer Socket:**

![Gadgeteer Socket](images/socket.png)


## Loading the Firmware

> [!Tip]
> First make sure you have bootloader v2 loaded. This needs to be done only once.

To activate bootloader v2, hold the LDR0 (socket 3, pin 3) signal low while resetting the board.

Download the [FEZHydra firmware](../../../software/tinyclr/downloads.md#fez-hydra) and follow [Loading the Firmware](../../../software/tinyclr/loaders/ghi_bootloader.md#loading-the-firmware) steps.