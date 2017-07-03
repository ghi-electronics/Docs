# TinyCLR OS Introduction

TinyCLR OS is our take on the [.NET Micro Framework](http://netmf.com/) to enable managed .NET development using Microsoft's Visual Studio on embedded devices -- including debugging! All you need to get started is Visual Studio, a TinyCLR device, and a USB cable. Keep in mind that it is still an alpha so there is still a lot more to come.

TinyCLR OS is made for .NET developers. Threading, memory management, timers, event handlers, and many more exist in TinyCLR OS just like they do on full .NET. For interacting with hardware, TinyCLR OS has an API similar to the Windows 10 IoT Core Extensions API you may already be familiar with. GPIO, UART, SPI, I2C, ADC, DAC, PWM, and more are all available for you to interact with the embedded world.

Better yet, all libraries are available through NuGet. Because of this, there will be no SDK to install or machines to lock to specific versions. Simply use NuGet to download any needed version of any needed library on a per-project basis.

1. If you don't already have Visual Studio 2017, download and install the freely available [Visual Studio Community 2017](https://www.visualstudio.com/downloads/).
2. Download and install the [TinyCLR OS Visual Studio extension](https://www.ghielectronics.com/downloads/TinyCLR/v0.5.0/TinyCLR.0.5.0.vsix).
3. Connect your device to your PC using a USB cable. Don't have a TinyCLR OS device yet? Take a look at the [FEZ](../hardware/FEZ.md): the board made for TinyCLR OS.
4. Start Visual Studio and create a new `TinyCLR Application` under `C# > TinyCLR`. New to Visual Studio or C#? Take a look at the [getting started guide from Microsoft](https://docs.microsoft.com/en-us/dotnet/csharp/getting-started/with-visual-studio).
5. Add some code and press `F5` to deploy and begin debugging your application!
6. Since TinyCLR OS is still so new, we haven't yet uploaded any packages to NuGet, so make sure to download the [available libraries](https://www.ghielectronics.com/downloads/TinyCLR/v0.5.0/TinyCLR_Libraries.0.5.0.zip), extract the archive, and place them in a [local NuGet feed](https://docs.nuget.org/ndocs/hosting-packages/local-feeds).
7. If you need to update the firmware on your device, download the [firmware](https://www.ghielectronics.com/downloads/TinyCLR/v0.5.0/TinyCLR_Firmware.0.5.0.zip) and follow the [instructions](firmware_update.md) to update your device.

If you're an existing user of NETMF and still want to use it in addition to TinyCLR OS, don't worry. TinyCLR OS is completely independent of NETMF and works side-by-side with no issues or changes required.

TinyCLR OS is still very new and there is a lot more we have planned for it so some libraries and functionality may be missing. Take a look at the [release notes](release_notes.md) to see what's new and [roadmap](roadmap.md) to see what we have planned.

Interested in running TinyCLR OS on your own device? Take a look at the [porting guide](porting/intro.md) for information on how to get started.