# NETMF Intro

.NET Micro Framework (NETMF) is a subset of the full .NET. Initiated by Microsoft for SPOT watches and then later open sourced. The latest working version Visual Studio working with our NETMF products is VS2013.

> [!Tip]
> We discourage the use of NETMF on our products in favor of [TinyCLR OS](../../tinyclr/intro.html). Learn more about using NETMF devices [with TinyCLR OS](with-tinyclr-os).

To use NETMF, install:
1. [Visual Studio 20013](https://www.visualstudio.com/vs/older-downloads/) (community edition is also supported)
2. Unzip and install netmfvs2013.vsix and MicroFramewrokSDK.msi from [here](http://netmf.codeplex.com/downloads/get/1423115) 
3. One of the [available NETMF SDKs](#available-netmf-sdks). The latest is recommended.

The [NETMF for Beginners](http://files.ghielectronics.com/downloads/NETMF/NETMF_for_Beginners.pdf) guide is a good starting point.

# Available NETMF SDKs
Release notes are found withing the SDKs.

Date | NETMF Core Rev | SDK
--- | --- | ---
Jun 27, 2016 | 4.3 QFE2 | [GHI Electronics NETMF SDK 2016 R1](https://www.ghielectronics.com/download/sdk/41/ghi-electronics-netmf-sdk-2016-r1)
Aug 31, 2015 | 4.3 QFE2 | [GHI Electronics NETMF SDK 2015 R1]()
Oct 29, 2014 | 4.3 QFE1 | [NETMF and Gadgeteer Package 2014 R5]()
Oct 8, 2014 | 4.3 QFE1 | [NETMF and Gadgeteer Package 2014 R4]()
Sep 15, 2014 | 4.3 QFE1 | [NETMF and Gadgeteer Package 2014 R3]()
Jul 31, 2014 | 4.3 QFE1 | [NETMF and Gadgeteer Package 2014 R2]()
Jan 29, 2014 | 4.3 RTM | [NETMF and Gadgeteer Package 2014 R1]()
Oct 23, 2013 | 4.3 RTM | [NETMF and Gadgeteer Package 2013 R3]()
Aug 27, 2013 | 4.3 RTM | [NETMF and Gadgeteer Package 2013 R2]()
Apr 30, 2013 | 4.3 RTM | [NETMF and Gadgeteer Package 2013 R1 Update 1]()
Feb 14, 2013 | 4.2 QFE2 | [NETMF and Gadgeteer Package 2013 R1]()
Feb 17, 2012 | 4.1 RTM | [NETMF 4.1 SDK, for Embedded Master, USBizi and ChipworkX](https://www.ghielectronics.com/download/sdk/5/netmf-sdk-2012-r0)(Includes the old IoT book for FEZ Panda)

# With TinyCLR OS
Most NETMF devices are still useable today, and with the latest technologies. To use TinyCLR OS, you need to load a new bootloader and the TinyCLR OS firmware.

# Loading the Bootloader
Before loading the TinyCLR OS firmware, we need load the GHI Electronics' [Bootloader Version 2](../../loaders/bootloader.html) onto the mainboard.

Each mainboard has specific instructions on loading the bootloader. Those instructions, and the firmware file, are found on the individial mainboard's pages.

# Loading the Firmware

## Using TinyCLR Config
(coming soon)

## Manual Loading the Firmware
TinyCLR Config tool should be used to update the firmware. As a backup, use the instructions on the [bootloader page](../../loaders/bootloader.html) for manual update.

> [!Tip]
> If you have never used TinyCLR OS before, [start here]( ../../../tinyclr/tutorials/intro.html)
