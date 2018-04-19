# I2C

I2C (pronounced eye-squared-sea, or eye-two-sea) was originally developed by Phillips as a protocal for synchronous serial communication between integrated circuits. It has a master and one or more slaves sharing the same data bus. Instead of selecting the slaves by using a dedicated chip select signal like SPI, I2C uses an addressing mechanism to communicate with the selected device. This addressing method saves one I/O pin per slave.

Before data is transferred, the master transmits the 7-bit address of the slave device it wants to communicate with. It also sends one bit indicating whether it wants to send data to the slave or receive data from the slave. When a slave sees its address on the bus, it will acknowledge its presence. At this point, the master can send or receive data. The master will start data transfers with a "start condition" before sending an address or data. The master ends the data transfer with a "stop condition."

The two wires for I2C communication are called the SDA and SCL lines. SDA stands for Serial Data, and SCL is Serial Clock.

This is a partial demo showing the use of I2C.

```
using System;
using System.Diagnostics;
using System.Threading;
using GHIElectronics.TinyCLR.Devices.I2c;
using GHIElectronics.TinyCLR.Pins;

class Program {
    static void Main() {
        var settings = new I2cConnectionSettings(0x1C) {    // the slave's address
            BusSpeed = I2cBusSpeed.FastMode
        };
        var device = I2cDevice.FromId(FEZ.I2cBus.I2c1, settings);

        device.Write(new byte[] { 1, 2 });  // write something
        device.WriteRead(...)               // this is good for reading registers
    }
}   
```

# Software I2C

The I2C bus is relatively simple and can be "bit banged" using software. The advantage is that any two GPIO pins can be used. However, software I2C requires more system resources and runs slower.

This example initializes a software I2C driver. Once initialized, it's used the same as hardware I2C.

```
using GHIElectronics.TinyCLR.Devices.I2c;
using GHIElectronics.TinyCLR.Pins;

class Program {
    static void Main() {
        var softwareProvider = new I2cSoftwareProvider(FEZ.GpioPin.PA0, FEZ.GpioPin.PA1);
        var controllers = I2cController.GetControllers(softwareProvider);
        var controller = controllers[0];
        var device = controller.GetDevice(new I2cConnectionSettings(0x22) { BusSpeed = I2cBusSpeed.StandardMode, SharingMode = I2cSharingMode.Exclusive });
    }
}
```