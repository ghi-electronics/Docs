# SPI

SPI uses three, sometimes four, wires for transferring data. The bus on SPI consists of a single master and one or more slaves. The master will send clock to the salves over the SCK pin. It will also send date over MOSI pin, while reading incoming data on the MISO pin. The SCK clock is used to determine how fast the data is moved. If you know electronics, this is simply a shift register.

The master selects which slave it will swap the data with using the SSEL pin, sometimes called CS.

In its simplest terms, the master will swap data between itself and the slave. You cannot write data without reading at the same time. However, a lot of time you need to write data and you do not care about the incoming data. For that, there is a Write method. But keep in mind that the Write method is also reading, and discarding, whatever the slave is sending.

> [!TIP] Some SPI devices (slaves) can have more than one select-pin, like the VS1053 MP3 decoder chip that uses one select pin for data and other for commands. Both share the 3 data transfer pins (SCK,  >MOSI, MISO).

> [!TIP] SPI needs more wires than other similar buses but it can transfer data very fast. A 50Mhz clock is possible on SPI, that is 50 million bits in one second. 

> [!TIP] Note that a board running TinyCLR OS is always a SPI masters, not slaves.

```csharp
using System;
using System.Diagnostics;
using System.Threading;
using GHIElectronics.TinyCLR.Devices.Spi;
using GHIElectronics.TinyCLR.Pins;

class Program
{
    static void Main()
    {
        var settings = new SpiConnectionSettings(0x1C)// the slave's select pin
        {
            Mode = SpiMode.Mode1,
            ClockFrequency = 4* 1000 * 1000,//4Mhz
            DataBitLength = 8,
        };
        var device = SpiDevice.FromId(FEZ.SpiBus.Spi1, settings);

        device.Write(new byte[] { 1, 2 });// write something
        device.TransferSequential(...)// this is good for reading registers
        device.TransferFullDuplex(...)// this is the only one that trully represents how SPI works
    }

}   
```