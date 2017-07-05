# General Purpose Input Output (GPIO)

Microcontrollers include pins that can be controlled through software. They can be inputs or outputs, hence the name general purpose input output, or GPIO for short.

> [!Tip] GPIO is handled by using GHIElectronics.TinyCLR.Devices.Gpio through the Devices NuGet package.

## Digital Outputs
A digital output pin can be set to either high or low. There are different ways of describing these two states. High can also be called "true" or "one;" low can be called "false" or "zero".
If the processor is powered from 3.3V, then the state high means that there is 3.3V on the output pin. It is not going to be exactly 3.3V but very close. When the pin is set to low then it is voltage is very close to zero volts.

> [!Warning] Never connect two output pins together. If they are connected and one is high and the other is low, the entire processor can be damaged.

> [!Warning] Digital pins on microcontrollers are weak. They can only be used to control small LEDs or transistors. Those transistors can in turn control devices with high power needs, like a motor.

This example will blink an LED on FEZ.

```csharp
using System.Threading;

using GHIElectronics.TinyCLR.Devices.Gpio;

class Program
{
    static void Main()
    {
        GpioPin led = GpioController.GetDefault().OpenPin(
            GHIElectronics.TinyCLR.Pins.FEZ.GpioPin.Led1);
        led.SetDriveMode(GpioPinDriveMode.Output);

        while (true)
        {
            led.Write(GpioPinValue.High);
            Thread.Sleep(100);
            led.Write(GpioPinValue.Low);
            Thread.Sleep(100);
        }
    }
}
```

The previous example use the FEZ pin class that includes enumerate all pins available on FEZ. To blink an LED on a different hardware that does not have pins class, you can calculate the pin number easily. This example can work on any STM32 chip. As every port has 16 pins, we can calculate the pin as shown.

```csharp
using System;
using System.Threading;
using GHIElectronics.TinyCLR.Devices.Gpio;

class Program
{
    static int PinNumber(char port, byte pin)
    {
        if (port < 'A' || port > 'E')
            throw new ArgumentException();

        return ((port - 'A')*16) + pin;
    }
    static void Main()
    {
        GpioPin led = GpioController.GetDefault().OpenPin(
            //PinNumber('B', 2));// Cerbuino
            //PinNumber('A', 10));//netduino 3
            //PinNumber('D', 5));//411 red Discovery
            PinNumber('D', 15));//411 blue Discovery
        led.SetDriveMode(GpioPinDriveMode.Output);

        while(true)
        {
            led.Write(GpioPinValue.High);
            Thread.Sleep(100);
            led.Write(GpioPinValue.Low);
            Thread.Sleep(100);
        }
    }
}
```

## Digital Inputs
Digital inputs sense if the state of its pin is high or low based on the voltage. Every pin has a maximum & minimum supported voltage. For example, the typical minimum voltage on most pins is 0 volts; a negative voltage may damage the pin or the processor. Also, the maximum that can be supplied to most pins must be less than the processor power source voltage. Since most processors run on 3.3V, the highest voltage a pin should see is 3.3V; however, some processors that are powered by 3.3V are 5V tolerant; that is, they can accept up to 5V on their inputs. FEZ is 5V tolerant.

> [!Warning] 5V-tolerant doesn't mean the processor can be powered by 5V. Only the input pins can tolerate 5V.

Unconnected input pins are called "floating" as they are open for any surrounding noise, which can make the pin high or low. A resistor can be added to pull the pin high or low. Modern processors include internal pull-down or pull-up resistors, that are controlled by software. Note that the pull-up resistor doesn't make a pin high but it pulls it high. If nothing is connected then the pin is high by default.

In this example, a button is connected between ground and the input pin. We will also enable the pull-up resistor, making that pin high when the button is not pressed, and low when the button is pressed. We will read the status of the button and pass its state to the LED. 

> [!Tip] Never use an infinite loop without giving the system time to think, use events or simply add a small sleep.

```csharp
using System;
using System.Threading;
using GHIElectronics.TinyCLR.Devices.Gpio;
using GHIElectronics.TinyCLR.Pins;

class Program
{
   
    static void Main()
    {
        GpioController GPIO = GpioController.GetDefault();

        GpioPin led = GPIO.OpenPin(FEZ.GpioPin.Led1);
        led.SetDriveMode(GpioPinDriveMode.Output);

        GpioPin button = GPIO.OpenPin(FEZ.GpioPin.Btn1);
        button.SetDriveMode(GpioPinDriveMode.InputPullUp);
        
        while(true)
        {
            if(button.Read() == GpioPinValue.Low)
            {
                // button is pressed
                led.Write(GpioPinValue.High);
            }
            else
            {
                led.Write(GpioPinValue.Low);
            }
            Thread.Sleep(10);//always give the system time to think!
        }
    }
}
```

> [!Tip] if you are not using FEZ, see the Output Port example above to see how to determine the pin number.

## Digital Input Events

In the previous example, the program just looped, and looped, and looped; each time checking the status of the pin attached to the button. The pin is checked maybe a million times before the button is pressed!  

Events solves this by invoking (calling) a method when an even occur. In this case the event is raised when the value on an input pin is changed. Meaning a button is pressed or released.

A RisingEdge happen when the state of a pin changes from low to high, it "rises".

This is the same button controlling LED example, but using events.

```csharp
using System;
using System.Threading;
using GHIElectronics.TinyCLR.Devices.Gpio;
using GHIElectronics.TinyCLR.Pins;

class Program
{
   static GpioPin led;
    static void Main()
    {
        GpioController GPIO = GpioController.GetDefault();

        led = GPIO.OpenPin(FEZ.GpioPin.Led1);
        led.SetDriveMode(GpioPinDriveMode.Output);

        GpioPin button = GPIO.OpenPin(FEZ.GpioPin.Btn1);
        button.SetDriveMode(GpioPinDriveMode.InputPullUp);
        button.ValueChanged += Button_ValueChanged;

        Thread.Sleep(-1);// sleep for low power, or do other tasks here!
    }

    private static void Button_ValueChanged(GpioPin sender, GpioPinValueChangedEventArgs e)
    {
        if (e.Edge == GpioPinEdge.FallingEdge)
            led.Write(GpioPinValue.Low);
        else
            led.Write(GpioPinValue.High);
    }
}
```

> [!Warning] Once you type += after the event, hit the tab key twice. Visual Studio will automatically create the event for you.
