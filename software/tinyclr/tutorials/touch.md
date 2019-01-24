# Touch
---

# Introduction
Displays may optionally include a touch sensitive screen to detect user touch input. Touch Screens can be resistive or capacitive.

![UD435](images/ucm-touch-display.jpg)

# Resistive Touch

A resistive touch screen measures the resistance across X and Y to determine the touch position. While it is possible to use GPIO and ADC, it is better to use dedicated chips. The only advantage of resistive touch over capacitive is that they work through pressure, meaning you can use it while wearing gloves. Resistive touch is not very accurate and requires calibration.

Unless you have specific reason to use resistive touch, capacitive touch should be used.

# Capacitive Touch

Capacitive touch screens are used on most modern devices, including phones. They are very accurate and capable of detecting multiple simultaneous touches.

A special capacitive controller chip must be used to control the touch panel. This chip is usually mounted right on the flat cable going to the touch panel. These chips are usually I2C or SPI, with I2C being more common.

The capacitive displays used in our development options use a controller from FocalTech.

We provide the `GHIElectronics.TinyCLR.Drivers.FocalTech.FT5xx6` NuGet package to interact with the touch screens. The constructor simply needs to know which I2C bus and reset pin are being used. The event fires with exact position matching the display resolution, no need for any scaling or calibration.

This basics example will draw a dot on touch move

```cs
using GHIElectronics.TinyCLR.Drivers.FocalTech.FT5xx6;

var touch = new FT5xx6Controller(i2cController.GetDevice(FT5xx6Controller.GetConnectionSettings()), gpioController.OpenPin(UCMStandard.GpioPin.B));

touch.TouchMove += (_, e) => {
    screen.FillEllipse(brush, e.X, e.Y, 5, 5);
    screen.Flush();
};
```
