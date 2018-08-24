# Signal Generator
---
SignalGenerator is a digital waveform generator. SignalGenerator works by comparing an internal counter to an array of time values, one by one. When the value of the argument matches the counter, the output pin is changed. The time values are in microseconds.

SignalGenerator can also be used to generate PWM. Unlike the PWM class, SignalGenerator can be used to generate PWM on any available output pin. It does use processor time -- the higher the frequency the more processor time it uses.

At this time, SignalGenerator only operates in blocking mode. While SingnalGenerator is running it will not yield any processor time to other code.

The following sample code will blink LED1 on the FEZ.

```csharp
using GHIElectronics.TinyCLR.Pins;
using GHIElectronics.TinyCLR.Devices.Gpio;
using GHIElectronics.TinyCLR.Devices.Signals;

class Program {
    private static void Main() {
        var timing = new long[] { 500 * 1000, 500 * 1000 };
        var led = new SignalGenerator(FEZ.GpioPin.Led1, GpioPinValue.Low);
        led.Write(timing, 0, timing.Length);
    }
}

```