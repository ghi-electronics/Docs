# TinyCLR OS Introduction
---
![TinyCLR Logo](images/tinyclrlogo_noborder.jpg)

TinyCLR OS is our path forward that started with the [.NET Micro Framework](https://netmf.github.io/) to enable managed .NET development using Microsoft's Visual Studio on embedded devices -- including debugging! All you need to get started is Visual Studio (free version available), a TinyCLR device, and a USB cable.

|  |  |
|--|--|
| **Tutorials** </br> Learn TinyCLR embedded programming. [**Learn more...**](tutorials/intro.md) | **Porting** </br> Run TinyCLR on other devices. [**Learn more...**](porting/intro.md) |
| [![Learn More](images/learn.jpg)](tutorials/intro.md) | [![TinyCLR Logo](images/tinyclrlogo.jpg)](porting/intro.md) |
| **TinyCLR Config** </br> Our device configuration program. [**Learn more...**](tinyclr_config.md) | **Downloads** </br> Visual Studio and device downloads. [**Learn more...**](downloads.md) |
| [![TinyCLR Config](images/tinyclr-config_sm.png)](tinyclr_config.md) | [![Download](images/download.jpg)](downloads.md) |
| **Roadmap** </br> The future of TinyCLR. [**Learn more...**](roadmap.md) | **Supported Boards** </br> Some boards that run TinyCLR. [**Learn more...**](boards/intro.md) |
| [![Road](images/road.jpg)](roadmap.md) | [![Boards](images/boards.png)](boards/intro.md) |
| **Bootloaders** </br> [**Learn more...**](loaders/intro.md) |  |
| [![Bootloader](images/bootloader.png)](loaders/intro.md) |  |

> [!Tip]
> TinyCLR OS is still an alpha so there is still a lot more to come!  Take a look at the [**release notes**](release_notes.md) to see what's new and the [**roadmap**](roadmap.md) to see what we have planned.

## Using TinyCLR

TinyCLR OS opens the world of embedded programming to Microsoft .NET developers. Threading, memory management, timers, event handlers, and many more features are available in TinyCLR OS just like full .NET. 

For interacting with hardware, TinyCLR OS has an API similar to the Windows 10 IoT Core Extensions API that you may already be familiar with. GPIO, UART, SPI, I2C, ADC, DAC, PWM, and more are all available for you to create new embedded and IOT devices.

In addition, all libraries are available through NuGet. Because of this, there will be no SDK to install or machines to lock to specific versions. Simply use NuGet to download any needed version of any needed library on a per-project basis.

### TinyCLR Computer Setup
To set up your computer to use TinyCLR OS:
1. If you don't already have Visual Studio 2017, download and install the free version here:  [Visual Studio Community 2017](https://www.visualstudio.com/downloads/).
2. Make sure to select the `.NET desktop development` workload when installing Visual Studio.
3. Download and install the newest [TinyCLR OS Visual Studio extension](downloads.md#visual-studio-project-system).
4. Connect your device to your PC using a USB cable.
5. Start Visual Studio and create a new `TinyCLR Application` under `C# > TinyCLR`. New to Visual Studio or C#? Take a look at the [getting started guide from Microsoft](https://docs.microsoft.com/en-us/dotnet/csharp/getting-started/with-visual-studio).
6. Add some code and press `F5` to deploy and begin debugging your application!
7. Since TinyCLR OS is still so new, we haven't yet uploaded any packages to NuGet, so make sure to download the newest [libraries](downloads.md#libraries), extract the archive, and place them in a [local NuGet feed](https://docs.nuget.org/ndocs/hosting-packages/local-feeds).
8. Do not forget to update the firmware on your board.
9. You are now ready to get started with TinyCLR! Take a look at the [tutorials](tutorials/intro.md) to get going.

> [!Tip]
> If you're an existing user of NETMF and still want to use it in addition to TinyCLR OS, don't worry. TinyCLR OS is completely independent of NETMF and works side-by-side with no issues.

### TinyCLR Device Setup
To use TinyCLR with a device you must first install the latest versions of the GHI bootloader and TinyCLR firmware on the device.  The bootloader is installed first and provides a way to install the firmware and to execute programs which are uploaded to the device.

The TinyCLR firmware includes the Common Language Runtime (CLR) which converts compiled code into machine instructions and manages program execution.  The TinyCLR firmware is also responsible for interacting with Microsoft Visual Studio to load and debug your application programs.

Instructions for installing the bootloader and firmware are provided on the documentation page for the device you are using.  If you want to use your own device, visit our [porting guide](porting/intro.md) for information on how to get started.

## Internet of Things
A modern system is not complete without support for the Internet and the cloud. TinyCLR OS includes everything you need to be online.
(details coming soon)

***

To learn more about TinyCLR embedded programming check out our [**tutorials**](tutorials/intro.md).

You can also visit our main website at [**www.ghielectronics.com**](http://www.ghielectronics.com) and our community forums at [**forums.ghielectronics.com**](https://forums.ghielectronics.com/).

