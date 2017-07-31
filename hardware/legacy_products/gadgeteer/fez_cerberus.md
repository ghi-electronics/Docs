# FEZ Cerberus

![FEZ Cerberus](images/fez_cerberus.jpg)

FEZ Cerberus is a .NET Gadgeteer product, that utilizes .NET Micro Frameworks (NETMF). The core of FEZ Cerberus is the G30 System on Chip (SoC).

FEZ Cerberus is the mother of [the Cerb Family]().

# Resources
* [FEZ Cerberus Schematics (add it)]()

# Using the Gadgeteer software
We discourage the use of NETMF and Gadgeteer software technologies on our products in favor for TinyCLR OS. [Read more](intro.md) about the use of NETMF, Gadgeteer and TinyCLR OS.

# Using TinyCLR OS
If haven't yet, read about using .NET Gadgeteer devices [with TinyCLR OS](intro.md#with-tinyclr-os)

## Loading Bootloader v2
1. Download the [bootloader file](../../loaders/ghi_bootloader.md#cerb)
2. Press and hold BOOT button down while resetting the board. 
3. If there is no BOOT button, there will be shunt-footprint labeled BOOT or LDR. Short the 2 pads with a wire while resetting the board.
4. The system will now detect an ST DFU device.
5. Read more on [uploading DFU files](/hardware/loaders/stm32_bootloader.md#uploading-dfu-files) on STM32 microcontrollers.

## Loading the Firmware

> [!Tip]
> First make sure you have bootloader v2 loaded. This needs to be done only once.

To activate bootloader v2, set PA15 pin low.

Download the [Cerb firmware](../../../tinyclr/downloads.md#cerb) and follow [Loading the Firmware](../../loaders/ghi_bootloader.md#loading-the-firmware) steps.

# The Cerb Family
The FEZ Cerberus come in different form factor, together called the Cerb family. The entire family run the same software.

## FEZ Cerberus
![FEZ Cerberus](images/fez_cerberus.jpg) 

The mother of the family!

## FEZ Cerbuino Bee
![FEZ Cerbuino Bee](images/fez_cerbuino_bee.jpg) 

An arduino-pinout compatible for accepting shields and also has some Gadgeteer socket option.

## FEZ Cerbuino Net
![FEZ Cerbuino Net](images/fez_cerbuino_net.jpg)

An arduino-pinout compatible for accepting shields and also has some Gadgeteer socket option.

## FEZ Cerb40
![FEZ Cerb40](images/fez_cerb40.jpg)

DIP40 formfactor board. Not really a Gadgeteer board but it is very small!

## FEZ Cerbot
![FEZ Cerbot](images/fez_cerbot.jpg)

A robot with reflective sensors and tons of LEDs. Gadgeteer sockets are used as an easy way to add features.
