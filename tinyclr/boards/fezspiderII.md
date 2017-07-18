# FEZ Spider II

FEZ Spider II is a legacy .NET Gadgeteer product. The core of the FEZ Spider II is the G120E System on Module (SoM), which is [supported by TinyCLR]( http://docs.ghielectronics.com/tinyclr/boards/fez.html).

 

# Updating the Bootloader and the Firmware

To run TinyCLR OS on the  FEZ Spider II:

1. Set the board’s configuration switches in boot mode. That is by switching #1 and #2 to the on position.

2. Connect the FEZ Spider II to a power module (red module) and then to a PC.
3. The PC will now detect a virtual serial (COM) device. If you need drivers, download then here (link).
4. Open any terminal software, we recommend tera term.
5. Select serial and pick the COM port associated with your board.
6. Enter E (uppercase) and you will see back “Erase all memory! Are you sure?” now enter Y (uppercase).
7. Enter X (uppercase) and you will see CCCC…. Showing on the terminal.
8. Now go to File->Transfer->XMODEM->Send… and then checkbox the 1K options.
9. Select the “G120 Bootloader v203.ghi” file. You can find available downloads here(link)
10. You will see “File Transfer Finished Successfully”.
11. Change the configuration switches back to the off position and reset the board.
12. Congratulations, you are now running the new  [GHI Electronics Bootloader](http://docs.ghielectronics.com/hardware/bootloader.html).
13. Close tera term and reopen it.
14. Press V and then enter. You will see back the boot loader version umber (v2.0.3)
15. Press U and then enter, then Y and then anter. You will now see CCCC… like before.
16. Now you can transfer the firmware file, just like you transferred the bootloader before. Go to File->Transfer->XMODEM->Send… and then checkbox the 1K options.
17. Select the “G120 Frimware.xxx.glb” file. When done, reset the board.
18. You are now running TinyCLR OS.

 

# Blinking the onboard LED

>Tip
If you have never used TinyCLR OS before, [start here]( http://docs.ghielectronics.com/tinyclr/tutorials/intro.html)

```
using System.Threading;
using GHIElectronics.TinyCLR.Devices.Gpio;
using GHIElectronics.TinyCLR.Pins;


namespace FEZ_Spider_II {

    class Program {

        static void Main() {

           var LED = GpioController.GetDefault().OpenPin(G120E.GpioPin.P1_31);

            LED.SetDriveMode(GpioPinDriveMode.Output);

            while(true) {

                LED.Write(GpioPinValue.High);

                Thread.Sleep(200);

                LED.Write(GpioPinValue.Low);

                Thread.Sleep(200);

            }

        }

    }

}
```

# Using the Gadgeteer modules

In this example, we have a button connected to socket 14. The button is connected to pin 3.

(we need the pin class to complete this)