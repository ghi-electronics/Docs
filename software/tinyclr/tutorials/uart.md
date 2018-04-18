# UART 

Serial data ports, called UARTs, transfer data between devices using two pins: TXD (transmit data) and RXD (receive data). UART stands for Universal Asynchronous Receiver Transmitter. Asynchronous means there is no clock signal to synchronize the two devices. The devices agree on a data rate, called the baud rate, and send a start bit the beginning of each transmitted character to keep the devices synchronized. 

> [!Tip]
> the TXD on one end (output) goes to the RXD on the other side (input) and vice versa.

The easiest way to test a UART is by wiring a device's TXD to its RXD so any transmitted data is received by the same device. This is called a "loopback" test. This demo will transmit and receive a number every half second.

> [!Tip]
> UART serial communication uses Storage Streams to handle the data. Don't forget to add the Storage NuGet package.

```csharp
using System;
using System.Diagnostics;
using System.Threading;
using GHIElectronics.TinyCLR.Storage.Streams;
using GHIElectronics.TinyCLR.Devices.SerialCommunication;
using GHIElectronics.TinyCLR.Pins;

class Program {
    static DataReader serReader;
    static DataWriter serWriter;

    static void Sender() {
        byte b = 0;
        while(true) {
            serWriter.WriteByte(b++);
            serWriter.Store();
            Debug.WriteLine("Sent: " + b);

            Thread.Sleep(500);
        }
    }

    static void Main() {
        SerialDevice ser = SerialDevice.FromId(FEZ.UartPort.Usart1);
        ser.BaudRate = 115200;
        ser.ReadTimeout = TimeSpan.Zero;
        serReader = new DataReader(ser.InputStream);
        serWriter = new DataWriter(ser.OutputStream);

        Thread SenderT = new Thread(Sender);
        SenderT.Start();

        while (true) {
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
UART uses the processor's voltage levels (logic levels) for transferring data. On the FEZ this is 0 to 3.3 volts. In the early days of computers UARTs used -12 to 12 volts to communicate reliably over longer distances. This is known as the RS232 standard.

Some PCs still include serial ports, but those are RS232 serial ports. A voltage level shifter is needed to properly connect a logic level UART to an RS232 device.

> [!Warning]
> Connecting your device to an RS232 port without a proper voltage level shifter can damage your device.
