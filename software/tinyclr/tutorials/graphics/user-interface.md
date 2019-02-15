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
A window is not very useful without some elements (controls). There are several built in elements and you can also custom make your own. All elements descend from the `UIElement` class. Explore the `GHIElectronics.TinyCLR.UI.Controls` namespace for available options.

For the sake of simplifying the rest of this tutorial, we will add `private static UIElement Elements()` method that creates and returns the elements. This is then assigned to the `Child` of our `Window`. You will need to add `window.Child = Elements(window.Width, window.Height);` right before returning from `CreateWindow`.


> [!Tip]
> This example needs a [font](font.md).

```cs
private static UIElement Elements(int ScreenWidth, int ScreenHeight) {
    var txt = new TextBox {
        Font = font,
        Text = "Hello World!",
        HorizontalAlignment = HorizontalAlignment.Center,
        VerticalAlignment = VerticalAlignment.Center
    };
    return txt;
}
```

## Panels
A `Window` can carry only a single `Child`, that is a single element. This is not a concern because the single element can be a container, like a `Panel`, which holds multiple elements. You can even have panels within panels and each has its own elements. There are two types of panels, `Canvas` and `StackPanel`. The canvas allows elements to be added anywhere on the canvas. Stack panels, on the other had, places elements in order.

This example will set 2 text elements is a horizontal panel. They will "stack" one right after another. To make them show one on the left of the screen and one on the right, we will set the width of the text area to be half the screen. We now have to identical regions stacked next to each other horizontally. We can then align the text as desired.

```cs
private static UIElement Elements(int ScreenWidth, int ScreenHeight) {
    var horiStack = new StackPanel(Orientation.Horizontal);

    var txt1 = new Text(font, "Hello World!") {
        ForeColor = Colors.White,
        TextAlignment = TextAlignment.Left,
        Width = ScreenWidth / 2,
    };
    var txt2 = new Text(font, "TinyCLR is Great!"){
        ForeColor = Colors.White,
        TextAlignment = TextAlignment.Right,
        Width = ScreenWidth / 2 ,

    };
    horiStack.Children.Add(txt1);
    horiStack.Children.Add(txt2);

    return horiStack;
}
```

The beauty of stack panels comes when mixing vertical and horizontal stack panels. This example will introduce shapes found in the `GHIElectronics.TinyCLR.UI.Shapes` namespace. It will also set the margins of the shape.

```cs
private static UIElement Elements(int ScreenWidth, int ScreenHeight) {
    var horiStack = new StackPanel(Orientation.Horizontal);
    var vertStack = new StackPanel(Orientation.Vertical);

    var txt1 = new Text(font, "Hello World!") {
        ForeColor = Colors.White,
        TextAlignment = TextAlignment.Left,
        Width = ScreenWidth / 2,
    };

    var txt2 = new Text(font, "TinyCLR is Great!"){
        ForeColor = Colors.White,
        TextAlignment = TextAlignment.Right,
        Width = ScreenWidth / 2 ,
    };

    var rect = new Rectangle(200, 10) {
        Fill = new SolidColorBrush(Colors.Green),
    };
    rect.SetMargin(0, 20, 0, 0);

    horiStack.Children.Add(txt1);
    horiStack.Children.Add(txt2);
    vertStack.Children.Add(horiStack);
    vertStack.Children.Add(rect);

    return vertStack;
}
```

## The Dispatcher

The User Interface libraries rely on a dispatcher internally to handle system events and updates the invalidated elements. Any changes to any of the elements needs to happen from within the dispatcher. In this example, we will show time on the screen. The time will be in a text box that is updated every second using a `Timer`. Since timers run in their own thread, a dispatcher invoke is needed.

```cs
static void Counter(object o) {
    Application.Current.Dispatcher.Invoke(TimeSpan.FromMilliseconds(1), _ => {
        Text txt = (Text)o;
        txt.TextContent = DateTime.Now.ToString();
        txt.Invalidate();
        return null;
    }, null);
}

private static UIElement Elements(int ScreenWidth, int ScreenHeight) {
    var txt = new Text(font, "Hello World!") {
        ForeColor = Colors.White,
        VerticalAlignment = VerticalAlignment.Center,
        HorizontalAlignment = HorizontalAlignment.Center,
    };

    Timer timer = new Timer(Counter, txt, 2000, 1000);
    return txt;
}
```

## User Input
A user can feed in input to the graphical interface through touch or button input.

```cs
app.InputProvider.RaiseTouch(x, y, touchState, DateTime.UtcNow);
app.InputProvider.RaiseButton(btn, btnState, DateTime.UtcNow);
```

The [touch](touch.md) tutorial has further details.
