# I2C

I2C (pronounced eye-squared-sea, or eye-two-sea) was originally developed by Phillips to allow multiple chipsets to communicate on a 2-wire bus in home consumer devices. It has a master and one or more slaves sharing the same data bus. Instead of selecting the slaves using a digital pin like SPI, which consumes an additional I/O pin, I2C uses an addressing mechanism to communicate to a selected device. Before data is transferred, the master sends out a 7-bit address of the slave device it wants to communicate with. It also sends one bit indicating whether it wants to send data to the slave or receive data from the slave. When a slave sees its address on the bus, it will acknowledge its presence. At this point, the master can send or receive data. The master will start data transfers with a "start condition" before it sends any address or data and then end it with "stop condition".

The two wires used to communicate between the I2C Master and the I2C salves are called SDA and SCL lines; SDA stands for Serial Data, and SCL is Serial Clock.

This is a partial demo showing the use of I2C.

```csharp
using System;
using System.Diagnostics;
using System.Threading;
using GHIElectronics.TinyCLR.Devices.I2c;
using GHIElectronics.TinyCLR.Pins;

class Program
{
    static void Main()
    {
        var settings = new I2cConnectionSettings(0x1C)// the slave's address
        {
            BusSpeed = I2cBusSpeed.FastMode
        };
        var device = I2cDevice.FromId(FEZ.I2cBus.I2c1, settings);

        device.Write(new byte[] { 1, 2 });// write something
        device.WriteRead(...)// this is good for reading registers
        // ...
    }
    
}   
```
