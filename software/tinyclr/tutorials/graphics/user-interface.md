# User Interface
You can use the `GHIElectronics.TinyCLR.UI` library to create user interfaces for your application. It is inspired by WPF on the desktop.

## Application Management
There is no special requirements when simply [drawing](drawing.md). However, the user interface has internal management requirements, that is handled by the application class. Your starting point will look like the following code. Do not forget to add the `GHIElectronics.TinyCLR.UI` NuGet package.

```cs
using GHIElectronics.TinyCLR.UI;
using GHIElectronics.TinyCLR.Devices.Display;

namespace UserInterfaceExample {
    class Program : Application {
        public Program(DisplayController d) : base(d) {
        }
        static void Main() {
            var disp = DisplayController.GetDefault();

            disp.SetConfiguration(new ParallelDisplayControllerSettings {
                //Your display configuration
            });

            disp.Enable();

            var app = new Program(disp);
            app.Run(Program.CreateWindow(disp));
        }
        private static Window CreateWindow(DisplayController disp) {
            var window = ...
            return window;
        }
    }
}
```

## Windows

You can have multiple windows in your application but you will at least need one. Here is a complete example that shows a window with a gradient brush background. The code is for UCM Dev board with 4.3 display and UC5550 UCM.

```cs
using GHIElectronics.TinyCLR.UI;
using GHIElectronics.TinyCLR.Devices.Display;
using GHIElectronics.TinyCLR.Devices.Gpio;
using GHIElectronics.TinyCLR.Pins;
using GHIElectronics.TinyCLR.UI.Media;

namespace UserInterfaceExample {
    class Program : Application {
        public Program(DisplayController d) : base(d) {
        }
        static void Main() {
            var disp = DisplayController.GetDefault();

            disp.SetConfiguration(new ParallelDisplayControllerSettings {
                //Your display configuration
                Width = 480,
                Height = 272,
                DataFormat = DisplayDataFormat.Rgb565,
                HorizontalBackPorch = 46,
                HorizontalFrontPorch = 16,
                HorizontalSyncPolarity = false,
                HorizontalSyncPulseWidth = 1,
                DataEnableIsFixed = false,
                DataEnablePolarity = false,
                PixelClockRate = 12_000_000,
                PixelPolarity = false,
                VerticalBackPorch = 23,
                VerticalFrontPorch = 7,
                VerticalSyncPolarity = false,
                VerticalSyncPulseWidth = 1
            });

            disp.Enable();

            UCMStandard.SetModel(UCMModel.UC5550);
            var gpioController = GpioController.GetDefault();
            var backlight = gpioController.OpenPin(UCMStandard.GpioPin.A);
            backlight.SetDriveMode(GpioPinDriveMode.Output);
            backlight.Write(GpioPinValue.High);

            var app = new Program(disp);
            app.Run(Program.CreateWindow(disp));
        }
        private static Window CreateWindow(DisplayController disp) {
            var window = new Window {
                Height = (int)disp.ActiveConfiguration.Height,
                Width = (int)disp.ActiveConfiguration.Width
            };
            window.Background = new LinearGradientBrush(Colors.Blue, Colors.Teal, 0, 0,
               window.Width, window.Height);
            window.Visibility = Visibility.Visible;
            return window;
        }
    }
}
```
## Elements
A window is not very useful without some elements (controls). There are several built in elements and you can also custom make your own. All elements descend from the `UIElement` class. Explore the `GHIElectronics.TinyCLR.UI.Controls` namespace for available options. The simplest element is a `TextBox`. Modify the previous example to add a `TextBox`. Note how the `Window` now has a `Child`, which is now the `TextBox`.


```cs
var txt = new TextBox {
    Font = font,
    Text = "Hello World!",
    HorizontalAlignment = HorizontalAlignment.Center,
    VerticalAlignment = VerticalAlignment.Center
};
window.Child = txt;
```

## Panels





The sample below shows how to use a few of the available elements. Make sure to provide your display configuration and the font you want to use. You can also feed in touch and button events from any source you want to use.

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

            disp.SetConfiguration(new ParallelDisplayControllerSettings {
                //Your display configuration
            });

            disp.Enable();

            var app = new Program(disp);

            //Use the below two functions to pass input to the UI system
            //app.InputProvider.RaiseTouch(x, y, touchState, DateTime.UtcNow);
            //app.InputProvider.RaiseButton(btn, btnState, DateTime.UtcNow);

            app.Run(Program.CreateWindow(disp));
        }

        private static Window CreateWindow(DisplayController disp) {
            //Setup
            var window = new Window {
                Height = (int)disp.ActiveConfiguration.Height,
                Width = (int)disp.ActiveConfiguration.Width
            };

            window.Background = new LinearGradientBrush(Colors.Red, Colors.Blue, 0, 0,
                window.Width, window.Height);

            //In next line replace "YourFont" with name of font you added to Resources file.
            var font = Resource1.GetFont(Resource1.FontResources.YourFont);
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

## User Input
A user can feed in input to the graphical interface through touch or button input.

```cs
app.InputProvider.RaiseTouch(x, y, touchState, DateTime.UtcNow);
app.InputProvider.RaiseButton(btn, btnState, DateTime.UtcNow);
```

The [touch](touch.md) tutorial has further details.
