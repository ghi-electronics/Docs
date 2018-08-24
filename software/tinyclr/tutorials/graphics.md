# Graphics

You can use the `GHIElectronics.TinyCLR.UI` library to create user interfaces for your application. It is inspired by WPF on the desktop. The sample below shows how to use a few of the available elements. Make sure to provide your display configuration and the font you want to use. You can also feed in touch and button events from any source you want to use.

```csharp
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
