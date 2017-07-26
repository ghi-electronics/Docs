# FEZ Spider II

FEZ Spider II is a legacy .NET Gadgeteer product. The core of the FEZ Spider II is the G120E System on Module (SoM), which is [supported by TinyCLR](../../products/fez.md).

 # Updating the Bootloader and the Firmware

To run TinyCLR OS on the  FEZ Spider II:

1. Set the board's configuration switches in boot mode. That is by switching #1 and #2 to the on position.
2. Connect the FEZ Spider II to a power module (red module) and then to a PC.
3. The PC will now detect a virtual serial (COM) device. If you need drivers, download then here.
4. Open any terminal software, we recommend Tera Term.
5. Select serial and pick the COM port associated with your board.
6. Enter `E` and you will see back "Erase all memory! Are you sure?" now enter `Y`.
7. Enter `X` and you will see `CCCC`... showing on the terminal.
8. Now go to `File` -> `Transfer` -> `XMODEM` -> `Send` and then check the `1K` option.
9. Select the `G120 Bootloader v203.ghi` (or newer) file. You can find available downloads here
10. You will see `File Transfer Finished Successfully`.
11. Change the configuration switches back to the off position and reset the board.
13. Close Tera Term and reopen it.
14. Press `V` and then enter. You will see back the boot loader version number (v2.0.3)
15. Press `U` and then enter, then `Y` and then enter. You will now see `CCCC`... like before.
16. Now you can transfer the firmware file, just like you transferred the bootloader before. Go to `File` -> `Transfer` -> `XMODEM` -> `Send` and then check the `1K` option.
17. Select the `G120 Frimware.xxx.glb` (or newer) file. When done, reset the board.
17. 
 # Blinking the onboard LED

>Tip
If you have never used TinyCLR OS before, [start here](../../../tinyclr/tutorials/intro.md)

```
using System.Threading;
using GHIElectronics.TinyCLR.Devices.Gpio;
using GHIElectronics.TinyCLR.Pins;

namespace FEZSpiderII {
    class Program {
        static void Main() {
           var led = GpioController.GetDefault().OpenPin(G120E.GpioPin.P1_31);
           led.SetDriveMode(GpioPinDriveMode.Output);

           while(true) {
                led.Write(GpioPinValue.High);
                Thread.Sleep(200);
                led.Write(GpioPinValue.Low);
                Thread.Sleep(200);
            }
        }
    }
}
```

# Using the Gadgeteer modules

In this example, we have a button connected to socket 14. The button is connected to pin 3.
