# .NET Gadgeteer Intro

![Gadgeteer](images/gadgeteer.jpg)

.NET Gadgeteer that was initiated by Microsoft Research and taken to production by GHI Electronics in the year 2011. .NET Gadgeteer had a great few year run, where it was loved for its plug-and-play mainboard and modules.

<iframe width="560" height="315" src="https://www.youtube.com/embed/wQlTLNOCl90" frameborder="0" allowfullscreen></iframe>

> [!Tip]
> We will refer to .NET Gadgeteer as Gadgeteer throughout all of our documentaion.

The core of .NET Gadgeteer is .NET Micro Framework (NETMF). Similar to Gadgeteer, NETMF is no longer evolved by Microsoft and left for the community. [Learn more about NETMF](../netmf/intro.md)

Sadly, and after 5 years of building modules and mainboards, GHI Electronics had to [announce](https://forums.ghielectronics.com/t/the-future-of-gadgeteer/197) the EOL for Gadgeteer; however, the Gaadgeteer hardware can still be used [with TinyCLR OS](#with-tinyclr-os).

External resources:
* Microsoft's .NET Gadgeteer website (down) http://www.gadgeteer.com/
* Microsoft's NETMF website (outdated) http://www.netmf.com/

Most of the Gadgeteer ecosystem is open source:
*	Microsoft's [.NET Gadgeteer Core](http://gadgeteer.codeplex.com/)
*	GHI Electronics' [Software sources and Hardware design files]( https://github.com/ghi-electronics/NETMF-Gadgeteer)
*	The Gadgeteer graphical designer was never made available by Microsoft.

# Socket Map
The magic of Gadgteer is in its socket map
(copy the map from here https://www.ghielectronics.com/docs/305/gadgeteer-sockets-quick-reference)


# Using .NET Gadgeteer
To use the .NET Gadgeteer legcy software, install:
1. [Visual Studio 20013](https://www.visualstudio.com/vs/older-downloads/) (community edition is also supported)
2. Unzip and install netmfvs2013.vsix and MicroFramewrokSDK.msi from [here](http://netmf.codeplex.com/downloads/get/1423115) 
3. Microsoft's [Gadgeteer Core](http://gadgeteer.codeplex.com/downloads/get/1519812)
4. GHI Electronics' [NETMF SDK](/hardware/legacy_products/netmf/intro.md#available-sdks). The latest is recommended.

The [Gadgeteer for Beginners](http://files.ghielectronics.com/downloads/Gadgeteer/NET_Gadgeteer_for_beginners.pdf) guide is a good starting point.

> [!Tip]
> You can only use Visual Studio 2013, not a newer edition, unless you are using your Gadgeteer hardware [with TinyCLR OS](#with-tinyclr-os).

# With TinyCLR OS
All .NET Gadgeteer devices are still useable today, and with the latest technologies, thanks to efforts by GHI Electronics and the community. 

It all started in this video!

<iframe width="560" height="315" src="https://www.youtube.com/embed/5n6-FzcgJJM" frameborder="0" allowfullscreen></iframe>

This means you can still use all your beloved .NET Gadgeteer gear with [TinyCLR OS](../../../tinyclr/intro.md).

To use TinyCLR OS, you need to load a new bootloader and the TinyCLR OS firmware.

# Loading the Bootloader
Before loading the TinyCLR OS firmware, we need load the GHI Electronics' [Bootloader Version 2](../../loaders/bootloader.md) onto the mainboard.

Each mainboard has specific instructions on loading the bootloader. Those instructions, and the firmware file, are found on the individial mainboard's pages.

# Loading the Firmware

## Using TinyCLR Config
(coming soon)

## Manual Loading the Firmware
TinyCLR Config tool should be used to update the firmware. As a backup, use the instructions on the [bootloader page](../../loaders/bootloader.md) for manual update.

# Blinking the LED

> [!Tip]
> If you have never used TinyCLR OS before, [start here]( ../../../tinyclr/tutorials/intro.md)

This example will blink the debug LED. You only need to add a power module to your mainboard.

```
using System.Threading;
using GHIElectronics.TinyCLR.Devices.Gpio;
using GHIElectronics.TinyCLR.Pins;

class Program {
    static void Main() {
        var led = GpioController.GetDefault().OpenPin(FezSpider.GpioPin.DebugLed);
        led.SetDriveMode(GpioPinDriveMode.Output);

        while(true) {
            led.Write(GpioPinValue.High);
            Thread.Sleep(200);
            led.Write(GpioPinValue.Low);
            Thread.Sleep(200);
        }
    }
}
```

> [!Tip]
> The complete pin mapping is made available through `GHIElectronics.TinyCLR.Pins`. You should not need to use any schematics.
> Replace `FezSpider` with your mainboard's name.

# Adding Gadgeteer Modules
You are now ready to start adding [modules](modules.md).
