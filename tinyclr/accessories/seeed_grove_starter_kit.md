# Seeed Grove Starter Kit
![Seeed Grove Starter Kit](images/GroveStarterKitSeeedStudio.jpg) 

Grove is a modular electronic platform for quick prototyping. Every module has one function, such as touch sensing, creating audio effect and so on. Just plug the modules you need to the base shield, then you are ready to test your idea buds. We have picked the [Seeed Grove Starter Kit for Arduino](https://www.seeedstudio.com/Grove-Starter-Kit-for-Arduino-p-1855.html) as  starting base but you can add additional Grove modules as well.

The included Grove modules plug into the included arduino shield. This shield works with any arduio-pinout compatible board, like the [FEZ](../../hardware/products/fez.md).

Plug the shield on top of your board, and get the drivers (coming soon)


This example that makes some noise!

```
Buzzer buzz = new Buzzer(FEZ.GpioPin.D4);
buzz.Beep();
Thread.Sleep(5000);
buzz.TurnOn();
Thread.Sleep(1000);
buzz.TurnOff();
while(true)
{
    buzz.Beep();
    Thread.Sleep(1000);
}

This example will read the temperature
TemperatureSensor temp = new TemperatureSensor(FEZ.AdcChannel.A1);
while(true)
{
    Debug.WriteLine("-> " + temp.ReadTemperature());
    Thread.Sleep(1000);
}
```

This example will show some text on the character display

```csharp
LcdRgbBacklight lcd = new LcdRgbBacklight();
lcd.Clear();
lcd.SetBacklightRGB(100, 100, 0);
lcd.BlinkBacklight(true);
lcd.BlinkBacklight(false);
lcd.Write("*** TinyCLR ***");
Thread.Sleep(1000);
lcd.SetCursor(0, 1);
lcd.Write("Count:");
int count = 0;
while (true)
{
    lcd.SetCursor(7, 1);
    lcd.Write(count.ToString());
    count++;
    lcd.SetBacklightRGB(100, 100, (byte)count);
    Thread.Sleep(100);
}
```

> [!Warning]
> Pay attention to the 3.3V-5V switch on the shield. The rotary and temperature sensors only work with 3.3V but the RGB character display only works with 5V.

Since the character display connects to I2C and only works with 5V. We have modified one of the I2C sockets to be always 5V. This allows us to keep the switch at 3.3V, leaving all other sockets at 3.3V.

> [!Warning]
> These steps require some experience and will void your warranty!

Start by cutting the power trace going to the last socket.

(image)

Now, add a wire from the socket directly to 5V.

(image)
