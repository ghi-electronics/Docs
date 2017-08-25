# Display

Displays can be grouped into two distinct interface categories, Parallel TFT Display and Serial SPI/I2C Displays.

# Parallel TFT Displays
These displays connect to special dedicated pins to the processor. Internally, the display controller automatically transfers (refreshes) the display directly from memory, without any processor interaction. When the system needs to update the graphics, it simply writes to memory. The operating system doesn't need to handle any display work. The down side to this is that the system needs to have enough RAM to handle the display. A 800x600 display with 16bpp needs 960,000 bytes! This should be no issues for systems with external memory.

TinyCLR OS built in graphics can be used with these displays. You need to add the `GHIElectronics.TinyCLR.Drawing` NuGet package and also this in your code: `using System.Drawing` and `using GHIElectronics.TinyCLR.Devices.Display`

```
var displayController = DisplayController.GetDefault();
// Enter the proper display configurations
displayController.ApplySettings(new LcdControllerSettings {
    Width = 480,
    Height = 272,
    PixelClockRate = 20000000,
    PixelPolarity = false,
    OutputEnablePolarity = true,
    OutputEnableIsFixed = false,
    HorizontalFrontPorch = 2,
    HorizontalBackPorch = 2,
    HorizontalSyncPulseWidth = 41,
    HorizontalSyncPolarity = false,
    VerticalFrontPorch = 2,
    VerticalBackPorch = 2,
    VerticalSyncPulseWidth = 10,
    VerticalSyncPolarity = false,
});
// Some needed objects
var screen = Graphics.FromHdc(displayController.Hdc);
var GreenPen = new Pen(Color.Green);
// Start Drawing (to memroy)
screen.Clear(Color.Black);
screen.DrawEllipse(GreenPen, 40, 30, 20, 10);
// Flush the memory to the display. This is a very fast operation.
screen.Flush();
```

# Serial SPI/I2C Displays
Serial displays can work on all microcontrollers. They use the very common SPI or I2C busses. These displays have built in memory buffers, freeing resources from the system. However, updating graphics is significantly slower than using Parallel TFT Displays. The system will have to send serial commands to identify the memory region to update and then follow that with the new data. This is why serial display are usually smaller displays.

To the system, the serial display is nothing but a serial device. You are expected to write the code to handle graphics.

A good example is the [Adafruit Display Shield](../accessories/adafruit_display_shield.md) which uses a SPI display.

This video features a very low cost I2C display option

<iframe width="560" height="315" src="https://www.youtube.com/embed/CL-nSqaGVaw" frameborder="0" allowfullscreen></iframe>

