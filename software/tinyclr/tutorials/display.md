# Display
---
Displays can be grouped into two distinct interface categories, parallel TFT displays and serial SPI/I2C displays.

## Parallel TFT Displays
These displays connect to special dedicated pins on the processor. Internally the display controller automatically transfers (refreshes) the display directly from memory without any processor interaction. When the system needs to update the display, it simply writes to memory. Neither the operating system nor the application program are burdened with display processing. The down side to this is that the system needs to have enough RAM to handle the display. An 800x600 display with 16bpp needs 960,000 bytes! For systems with external memory this should not be an issue.

TinyCLR OS has built in graphics methods for these displays. You will need to add the `GHIElectronics.TinyCLR.Drawing` NuGet package to your program and `using System.Drawing` and `using GHIElectronics.TinyCLR.Devices.Display` to your code.

```
using System.Drawing
using GHIElectronics.TinyCLR.Devices.Display

var displayController = DisplayController.GetDefault();
// Enter the proper display configurations
displayController.ApplySettings(new ParallelDisplayControllerSettings {
    Width = 480,
    Height = 272,
    DataFormat = DisplayDataFormat.Rgb565,
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

## Serial SPI/I2C Displays
Serial displays can work with all microcontrollers. They use common SPI or I2C busses. These displays have built in memory buffers, freeing resources from the system. However, updating graphics is significantly slower than using Parallel TFT Displays. The system will have to send serial commands to identify the memory region to update and then follow that with the new data. This is why serial interfaces are usually used with smaller displays.

To the system, a serial display is nothing but a serial device. You are expected to write your own code to handle graphics.

A good example is the Adafruit Display Shield which uses a SPI display.

This video features a very low cost I2C display option

<iframe width="560" height="315" src="https://www.youtube.com/embed/CL-nSqaGVaw" frameborder="0" allowfullscreen></iframe>

## UI

You can use the `GHIElectronics.TinyCLR.UI` library to create user interfaces for your application. It is inspired by WPF on the desktop. The below sample shows how to use a few of the available elements. Make sure to provide your display configuration and the font you want to use. You can also feed touch and button events in from whatever source you may want to use.

```cs
using GHIElectronics.TinyCLR.Devices.Display;
using GHIElectronics.TinyCLR.UI;
using GHIElectronics.TinyCLR.UI.Controls;
using GHIElectronics.TinyCLR.UI.Media;

namespace UI {
    public class Program : Application {
        public Program(DisplayController d) : base(d) {

        }

        public static void Main() {
            var disp = DisplayController.GetDefault();

            disp.ApplySettings(new ParallelDisplayControllerSettings {
                //Your display configuration
            });

            var app = new Program(disp);

            //Use the below two functions to pass input to the UI system
            //app.InputProvider.RaiseTouch(x, y, touchState, DateTime.UtcNow);
            //app.InputProvider.RaiseButton(btn, btnState, DateTime.UtcNow);

            app.Run(Program.CreateWindow(disp));
        }

        private static Window CreateWindow(DisplayController disp) {
            //Setup
            var window = new Window {
                Height = (int)disp.ActiveSettings.Height,
                Width = (int)disp.ActiveSettings.Width
            };

            window.Background = new LinearGradientBrush(Colors.Red, Colors.Blue, 0, 0, window.Width, window.Height);

            var font = Resources.GetFont(/*your font*/);

            OnScreenKeyboard.Font = font;


            //List
            var listBox = new ListBox();

            listBox.Child.Width = window.Width;


            //Text
            for (var i = 0; i < 3; i++) {
                var text = new Text(font, $"Text item {i}");

                text.SetMargin(5);

                listBox.Items.Add(text);
            }

            //Button
            var j = 0;
            var val = new Text(font, "Tap Me");
            var btn = new Button {
                Child = val,
                Width = 100
            };

            btn.SetMargin(5);
            btn.Click += (s, e) => val.TextContent = "Tap Me " + (j++).ToString();

            listBox.Items.Add(btn);

            //Textbox
            var txt = new TextBox {
                Font = font,
                Text = "Text Sample"
            };

            txt.SetMargin(5);
            listBox.Items.Add(txt);

            //Setup
            window.Child = listBox;
            window.Visibility = Visibility.Visible;

            return window;
        }
    }
}
```
