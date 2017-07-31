# FEZ Raptor

![FEZ Raptor](images/fez_raptor.jpg)

FEZ Raptor is a .NET Gadgeteer product, that utilizes .NET Micro Frameworks (NETMF). The core of FEZ Spider is the G400S System on Module (SoM).

# Resources
* [Schematics (add it)]()

# Using the Gadgeteer software
We discourage the use of NETMF and Gadgeteer software technologies on our products in favor for TinyCLR OS. [Read more](intro.md) about the use of NETMF, Gadgeteer and TinyCLR OS.

# Using TinyCLR OS
If haven't yet, read about using .NET Gadgeteer devices [with TinyCLR OS](intro.md#with-tinyclr-os)

## Loading GHI Bootloader v2
Follow the exact same steps found on the [G400](../../products/g400.md) page.

## Loading the Firmware

> [!Tip]
> First make sure you have bootloader v2 loaded. This needs to be done only once.

To activate bootloader v2, press and hold the LDR0 button while resetting the board.

Download the [G400 firmware](../../../tinyclr/downloads.md#g400) and follow [Loading the Firmware](../../loaders/ghi_bootloader.md#loading-the-firmware) steps.

