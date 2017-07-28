# DAC

An analog output sets the voltage on its pin anywhere between 0 and the supplied voltage (maximum voltage) which is typically 3.3 volts. The output voltage is only a signal, not meant to drive any loads. An op-amp or similar circuits can be added to drive loads, such as a speaker.
The analog out on a micro has  "precision:" the precision of a particular processor is in its manual or datasheet; consequentially, actual output values on the pin are an approximation. For example, a micro with an 8-bit (256 steps) analog out has a step precision of 3.3V/256.

This example will generate a triangular waveform.

```
using System;
using System.Diagnostics;
using System.Threading;
using GHIElectronics.TinyCLR.Devices.Dac;
using GHIElectronics.TinyCLR.Pins;

class Program {
    static void Main() {
        DacController DAC = DacController.GetDefault();
        DacChannel analog = DAC.OpenChannel(G120.DacChannel.P0_26);
        double d = 0.5;
        double dd = 0.01;
        while (true) {
            analog.WriteValue(d);
            d += dd;
            if (d <= 0 || d >= 1)
                dd *= -1;// inverse
            Thread.Sleep(10);
        }
    }
}
```
> [!Tip]
> Do not use analog outputs to control the power of an LED or a motor. Use [PWM](pwm.md) for that.