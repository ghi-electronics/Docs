# NETMF Intro
---
![NETMF Logo](../images/netmf_logo_noborder.png)

.NET Micro Framework (NETMF) is a subset of the full .NET. Initiated by Microsoft for SPOT watches and then later open sourced. The latest working version Visual Studio working with our NETMF products is VS2013.

> [!Tip]
> We discourage the use of NETMF on our products in favor of [TinyCLR OS](../../tinyclr/intro.md). Learn more about using NETMF devices [with TinyCLR OS]().

To use NETMF, install:
1. [Visual Studio 2013](https://www.visualstudio.com/vs/older-downloads/) (community edition is also supported)
2. Unzip and install netmfvs2013.vsix and MicroFrameworkSDK.msi from [here](http://files.ghielectronics.com/downloads/NETMF/SDKs/MS%20NETMF%20QFE2.zip) 
3. One of the [available NETMF SDKs](#available-netmf-sdks). The latest is recommended.

The [NETMF for Beginners](http://files.ghielectronics.com/downloads/NETMF/NETMF_for_Beginners.pdf) guide is a good starting point.

## Available NETMF SDKs
Release notes are found within the SDKs.

Date | NETMF Core Rev | SDK
--- | --- | ---
Jun 27, 2016 | 4.3 QFE2 | [GHI Electronics NETMF SDK 2016 R1](http://files.ghielectronics.com/downloads/NETMF/SDKs/GHI%20Electronics%20NETMF%20SDK%202016%20R1.exe)
Aug 31, 2015 | 4.3 QFE2 | [GHI Electronics NETMF SDK 2015 R1](http://files.ghielectronics.com/downloads/NETMF/SDKs/GHI%20Electronics%20NETMF%20SDK%202015%20R1.exe)
Oct 29, 2014 | 4.3 QFE1 | [NETMF and Gadgeteer Package 2014 R5](http://files.ghielectronics.com/downloads/NETMF/SDKs/NETMF%20and%20Gadgeteer%20Package%202014%20R5.exe)
Oct 8, 2014 | 4.3 QFE1 | [NETMF and Gadgeteer Package 2014 R4](http://files.ghielectronics.com/downloads/NETMF/SDKs/NETMF%20and%20Gadgeteer%20Package%202014%20R4.exe)
Sep 15, 2014 | 4.3 QFE1 | [NETMF and Gadgeteer Package 2014 R3](http://files.ghielectronics.com/downloads/NETMF/SDKs/NETMF%20and%20Gadgeteer%20Package%202014%20R3.exe)
Jul 31, 2014 | 4.3 QFE1 | [NETMF and Gadgeteer Package 2014 R2](http://files.ghielectronics.com/downloads/NETMF/SDKs/NETMF%20and%20Gadgeteer%20Package%202014%20R2.exe)
Jan 29, 2014 | 4.3 RTM | [NETMF and Gadgeteer Package 2014 R1](http://files.ghielectronics.com/downloads/NETMF/SDKs/NETMF%20and%20Gadgeteer%20Package%202014%20R1.zip)
Oct 23, 2013 | 4.3 RTM | [NETMF and Gadgeteer Package 2013 R3](http://files.ghielectronics.com/downloads/NETMF/SDKs/NETMF%20and%20Gadgeteer%20Package%202013%20R3.zip)
Aug 27, 2013 | 4.3 RTM | [NETMF and Gadgeteer Package 2013 R2](http://files.ghielectronics.com/downloads/NETMF/SDKs/NETMF%20and%20Gadgeteer%20Package%202013%20R2.zip)
Apr 30, 2013 | 4.3 RTM | [NETMF and Gadgeteer Package 2013 R1 Update 1](http://files.ghielectronics.com/downloads/NETMF/SDKs/NETMF%20and%20Gadgeteer%20Package%202013%20R1%20Update1.zip)
Feb 14, 2013 | 4.2 QFE2 | [NETMF and Gadgeteer Package 2013 R1](http://files.ghielectronics.com/downloads/NETMF/SDKs/NETMF%20and%20Gadgeteer%20Package%202013%20R1.zip)
Feb 17, 2012 | 4.1 RTM | [NETMF 4.1 SDK, for Embedded Master, USBizi and ChipworkX](https://ghistorage.blob.core.windows.net/downloads/NETMF/SDKs/NETMF%204.1%20SDK.zip) (Includes IoT book for FEZ Panda)

## With TinyCLR OS
Most NETMF devices are still useable today with the latest technology. To use TinyCLR OS, you need to load a new bootloader and the TinyCLR OS firmware.

### Loading the Bootloader v2
Before loading the TinyCLR OS firmware, we need load the GHI Electronics' [Bootloader Version 2](../../tinyclr/loaders/ghi_bootloader.md).

Each board has specific instructions on loading the bootloader. The instructions are found on the individual board's pages.

### Running TinyCLR OS
Individual product pages detail how to put the device into loader mode to load the firmware. Once running TinyCLR OS, start with the TinyCLR OS [intro tutorial]( ../../tinyclr/tutorials/intro.md).


