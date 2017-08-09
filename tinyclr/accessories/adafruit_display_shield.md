# Adafruit Display Shield
![Adafruit 1.8" Color TFT Shield w/microSD and Joystick](images/adafruit-tft-joystick-shield.jpg) 

The [Adafruit 1.8" Color TFT Shield w/microSD and Joystick](https://www.adafruit.com/product/802) plugs right on top of FEZ, or any other Arduino-pinout compatible board.

To use this shield, just plug it on top of your Arduno-pinout compatible board, like the [FEZ](../../hardware/products/fez.md).

The driver is found [here](https://github.com/ghi-electronics/TinyCLR-Accessories).


You are now ready to use the shield

```
Display18.Display n18 = new Display18.Display(FEZ.GpioPin.A0, FEZ.GpioPin.A1, FEZ.SpiBus.Spi1);
int count = 0;
while (true)
{
   count++;
    n18.DrawLargeText(10, 10, "Count " + count, Display18.Color.Green);

    Thread.Sleep(30);
}
```
