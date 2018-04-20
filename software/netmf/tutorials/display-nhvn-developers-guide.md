# Display NHVN Developers' Guide
---

**While the Display NHVN is legacy and will be discontinued, it is available for the time being until a suitable replacement is available for NETMF devices.**

The [Display NHVN](http://old.ghielectronics.com/catalog/product/549) is a display module that allows users to connect select [Newhaven displays](http://www.newhavendisplay.com/) to their mainboard. It includes Gadgeteer sockets for connecting to Gadgeteer mainboards and a 40 pin 0.1" spaced through-hole header for connecting to boards that have a compatible header.

The following displays are supported:
NHD-4.3-480272EF-ATXL#
NHD-4.3-480272EF-ATXL#-CTP
NHD-4.3-480272EF-ATXL#-T
NHD-7.0-800480EF-ATXL#
NHD-7.0-800480EF-ATXL#-CTP
NHD-7.0-800480EF-ATXV#
NHD-7.0-800480EF-ATXV#-CTP

Currently you can connect the Display NHVN to the 40 pin header on the following products:
FEZ Cobra III
G120 TH
G400 TH
OSD3358 TH

**Make sure to provide adequate separation from the back of the display and the through-hole headers after soldering. A piece of thick tape covering the headers should be enough.**

The below video talks about one of the ways you can connect this display to our products.

<iframe width="560" height="315" src="https://www.youtube.com/embed/PTZKz2EGzZE" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

If you are using .NET Gadgeteer, you can tell the Gadgeteer driver for the Display NHVN which screen size and touch controller you are using and it will automatically configure it for you like every other Gadgeteer display.
If you are not using .NET Gadgeteer, example code for setting the display timings for the two supported screen sizes is listed below. You can also set these timings using FEZ Config. The graphics document has more information on configuring the display. There is also a sample capacitive touch controller below. The interrupt pin is pin 36 on the 40 pin header. If you are using resistive touch, see the touch document for more information.

##4.3" Display

```c#
Display.Width = 480;
Display.Height = 272;
Display.OutputEnableIsFixed = false;
Display.OutputEnablePolarity = true;
Display.PixelPolarity = false;
Display.PixelClockRateKHz = 20000;
Display.HorizontalSyncPolarity = false;
Display.HorizontalSyncPulseWidth = 41;
Display.HorizontalBackPorch = 2;
Display.HorizontalFrontPorch = 2;
Display.VerticalSyncPolarity = false;
Display.VerticalSyncPulseWidth = 10;
Display.VerticalBackPorch = 2;
Display.VerticalFrontPorch = 2;
Display.Type = Display.DisplayType.Lcd;
Display.CurrentRotation = Display.Rotation.Normal;

if (Display.Save())
    PowerState.RebootDevice(false);
```

## 7" Display

```c#
Display.Width = 800;
Display.Height = 480;
Display.OutputEnableIsFixed = false;
Display.OutputEnablePolarity = true;
Display.PixelPolarity = false;
Display.PixelClockRateKHz = 20000;
Display.HorizontalSyncPolarity = false;
Display.HorizontalSyncPulseWidth = 48;
Display.HorizontalBackPorch = 88;
Display.HorizontalFrontPorch = 40;
Display.VerticalSyncPolarity = false;
Display.VerticalSyncPulseWidth = 3;
Display.VerticalBackPorch = 32;
Display.VerticalFrontPorch = 13;
Display.Type = Display.DisplayType.Lcd;
Display.CurrentRotation = Display.Rotation.Normal;

if (Display.Save())
    PowerState.RebootDevice(false);
```

## Capacitive Touch Controller Driver

> [!Note] the displays do not seem to raise the TouchUp event in our tests.

```c#
public class FT5306Controller {
    private InterruptPort touchInterrupt;
    private I2CDevice i2cBus;
    private I2CDevice.I2CTransaction[] transactions;
    private byte[] addressBuffer;
    private byte[] touchDataBuffer;
    private byte[] touchCountBuffer;

    public delegate void TouchEventHandler(FT5306Controller sender, TouchEventArgs e);

    public event TouchEventHandler TouchDown;
    public event TouchEventHandler TouchUp;
    public event TouchEventHandler TouchMove;

    public FT5306Controller(Cpu.Pin interruptPin) {
        this.transactions = new I2CDevice.I2CTransaction[2];
        this.addressBuffer = new byte[1];
        this.touchDataBuffer = new byte[4];
        this.touchCountBuffer = new byte[1];
        this.i2cBus = new I2CDevice(new I2CDevice.Configuration(0x38, 400));
        this.touchInterrupt = new InterruptPort(interruptPin, false, Port.ResistorMode.Disabled, Port.InterruptMode.InterruptEdgeBoth);
        this.touchInterrupt.OnInterrupt += (a, b, c) => this.OnTouchEvent();
    }

    private void OnTouchEvent() {
        var points = this.ReadData(2, this.touchCountBuffer)[0];

        for (var i = 0; i < points; i++) {
            var data = this.ReadData(i * 6 + 3, this.touchDataBuffer);
            var flag = (data[0] & 0xC0) >> 6;
            var x = ((data[0] & 0x0F) << 8) | data[1];
            var y = ((data[2] & 0x0F) << 8) | data[3];

            var handler = flag == 0 ? this.TouchDown : flag == 1 ? this.TouchUp : flag == 2 ? this.TouchMove : null;

            if (handler != null)
                handler(this, new TouchEventArgs { X = x, Y = y });
        }
    }

    private byte[] ReadData(int address, byte[] resultBuffer) {
        this.addressBuffer[0] = (byte)address;

        this.transactions[0] = I2CDevice.CreateWriteTransaction(this.addressBuffer);
        this.transactions[1] = I2CDevice.CreateReadTransaction(resultBuffer);

        this.i2cBus.Execute(this.transactions, 500);

        return resultBuffer;
    }

    public class TouchEventArgs : EventArgs {
        public int X { get; internal set; }
        public int Y { get; internal set; }
    }
}
```
