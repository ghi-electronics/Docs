# UART 

Serial data ports, called UART, transfers data between two pins TXD (transmit) and RXD (receive). There is no clock between the two sides so they both need to agree on the data slow rate, called baudrate. 

> [!Tip]
> the TXD on one end (output) goes to the RXD on the other side (input) and vice versa.

The easiest way to test UART is by wiring TXD to RXD and then any data transmitted is also received. This demo will send a number every half a second and wait for it on the receive end.

> [!Tip]
> Serial uses Storage Streams to handle the data. Add the Storage NuGet package.

```csharp
using System;
using System.Diagnostics;
using System.Threading;
using GHIElectronics.TinyCLR.Storage.Streams;
using GHIElectronics.TinyCLR.Devices.SerialCommunication;
using GHIElectronics.TinyCLR.Pins;

class Program
{
    static DataReader serReader;
    static DataWriter serWriter;

    static void Sender()
    {
        byte b = 0;
        while(true)
        {
            serWriter.WriteByte(b++);
            serWriter.Store();
            Debug.WriteLine("Sent: " + b);

            Thread.Sleep(500);
        }
    }

    static void Main()
    {
        SerialDevice ser = SerialDevice.FromId(FEZ.UartPort.Usart1);
        ser.BaudRate = 115200;
        ser.ReadTimeout = TimeSpan.Zero;
        serReader = new DataReader(ser.InputStream);
        serWriter = new DataWriter(ser.OutputStream);

        Thread SenderT = new Thread(Sender);
        SenderT.Start();

        while (true)
        {
            var i = serReader.Load(1);
            if(i>0)
            {
                byte b = serReader.ReadByte();
                Debug.WriteLine("Recieved: " + b);
            }

            Thread.Sleep(10);// always give the system time to think!
        }
    }

}
```

## RS232
UART uses the processor's voltage levels for transferring data, called TTL voltage levels. Systems from back in the 80s needed a way to transfer data over long distances and so the UART levels changed to be -12V to +12V instead of TTL 0V to 3.3V on FEZ for example. This standard is called RS232.

Some PCs still include serial ports to this day, but those are RS232 serial ports. A level shifter chip is needed to convert the voltages properly.

> [!Warning]
> Connecting your device to an RS232 port without a proper voltage level shifter can damage your device.
