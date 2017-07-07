# Adafruit Display Shield

The [Adafruit 1.8" Color TFT Shield w/microSD and Joystick](https://www.adafruit.com/product/802) plugs right on top of FEZ, or any other Arduino-pinout compatible board.

To use this shield, just plug it on top of your board

The driver is found at (link). 

Import this NuGet Package, as explained [here](http://docs.ghielectronics.com/tinyclr/tutorials/intro.html). 


You are now ready to use the shield

```csharp
Display18.Display n18 = new Display18.Display(FEZ.GpioPin.A0, FEZ.GpioPin.A1, FEZ.SpiBus.Spi1);
int count = 0;
while (true)
{
   count++;
    n18.DrawLargeText(10, 10, "Count " + count, Display18.Color.Green);

    Thread.Sleep(30);
}
```
