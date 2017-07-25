# FEZ Spider

FEZ Spider is a .NET Gadgeteer product, that utlizes .NET Micro Frameworks (NETMF). 
(image)

> [!Tip]
> The use of the original NETMF and Gadgeteer software is discouraged.[Read more](intro.html).

# Using TinyCLR OS

As an alternative, TinyCLR OS can be used. First, we need to load a secondary bootloader and the TinyCLR OS firmware.

## Updating the Bootloader

First, we need GHI Electronics' [bootloader](../../loaders/bootloader.html) version 2.

> [!Tip]
> The core of the FEZ Spider is the EMX System on Module (SoM)

> [!Tip]
> The old EMX bootloader doesn't always work with Windows 7 and newer (Error code 10). You can use the serial option to update the loader.
> You should have no issues once the new bootloader V2 is loaded.

**To update using USB**
1. Set the board's configuration switches in boot mode. That is by setting switches #1, #2 and #3 to the on position.
2. Connect the FEZ Spider II to a power module (red module) and then to a PC.
3. The PC will now detect a virtual serial (COM) device. If you need drivers, they are in the [NETMF](../netmf/intro.html) SDK.
4. Open any terminal software, we recommend [Tera Term](http://ttssh2.osdn.jp/).
5. Select serial and pick the COM port associated with your board.
6. Enter `E` and you will see back "Erase all memory! Are you sure?" now enter `Y`. (The bootloader is case sensitive)
7. Enter `X` and you will see `CCCC`... showing on the terminal.
8. Now go to `File` -> `Transfer` -> `XMODEM` -> `Send` and then check the `1K` option.
9. Select the `EMX Bootloader v203.ghi` file. You can find available downloads here
10. You will see `File Transfer Finished Successfully`.
11. Change the configuration switches back to the off position and reset the board.
12. You are now running GHI Electronics bootloader version 2!

**To update using Serial**
1. Connect the USB-serial module to socket 11.
2. Follow the exact same steps above except you need to also switch #4 to on (switch to serial)
3. The drivers for the USB-serial module should load automatically. If not, get them from http://www.ftdichip.com/

## Loading the TinyCLR OS firmware

1. Close Tera Term (if it is still open) and reopen it.
2. Press `V` and then enter. You will see back the boot loader version number (v2.0.3)
3. Press `U` and then enter, then `Y` and then enter. You will now see `CCCC`...
4. Now you can transfer the firmware file, just like you transferred the bootloader before. Go to `File` -> `Transfer` -> `XMODEM` -> `Send` and then check the `1K` option.
5. Select the `EMX Firmware.xxx.glb` firmware file. (from where?)
6. When the transfer is complete, reset your board. You are now ready to use TinyCLR OS.

> [!Tip]
> You no longer need to update the bootloader. Next time you need to update the firmware, set switch ??? to on and then folow the same steps to update the firmware only.

 # Blinking the LED

> [!Tip]
> If you have never used TinyCLR OS before, [start here]( http://docs.ghielectronics.com/tinyclr/tutorials/intro.html)

This example will blink the debug LED. You only need to add a power module to your mainboard.

```
using System.Threading;
using GHIElectronics.TinyCLR.Devices.Gpio;
using GHIElectronics.TinyCLR.Pins;

class Program {
    static void Main() {
        var led = GpioController.GetDefault().OpenPin(FezSpiderII.GpioPin.DebugLed);
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
> The complete pin mapping is made available for TinyCLR OS. You should not need to use any schematics.

# Adding .NET Gadgeteer Modules
You are now ready to start with [Modules](modules.html).
