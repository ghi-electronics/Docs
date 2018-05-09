# FEZ Cerb Family Developers' Guide
---

The powerful firmware on a single chip design of the Cerb Family makes this core ideal for many uses. GHI offers the following Cerb Family products that all share the exact same processor (STM32F405RGT6) and firmware:

* [FEZ Cerberus](https://www.ghielectronics.com/catalog/product/349)
* [FEZ Cerbuino Bee](https://www.ghielectronics.com/catalog/product/351)
* [FEZ Cerbuino Net](https://www.ghielectronics.com/catalog/product/473)
* [FEZ Cerb40 II](https://www.ghielectronics.com/catalog/product/450)

## Memory Constraints
Due to the limited amount of memory on the Cerb Family, the following features are not supported:

* Wi-Fi RS9110
* PPP
* SQLite
* USB Host Webcam and Hub
* USB Client
* Extended Weak References
* InField Update
* Serial debugging
* SSL
* Cryptography

## Real Time Clock
To enable the Real Time Clock, you must connect a crystal with frequency 32.768KHz and load capacitance of 6pF between PC14 and PC15. VT200F-6PF20PPM from DigiKey will work. You must also supply the VBAT pin with 3V.
The FEZ Cerb40 II already does this. The FEZ Cerbuino Net and Bee expose PC14 and PC15 on pins D3 and D4 respectively on their headers. For the FEZ Cerberus, since PC14 and PC15 are not exposed, you must connect the crystal between C10 and C11 on the board on the side closest to the processor.

## Loader Update
The loader on the Cerb Family is updated using ST Microelectronics's STDFU Tester program. This program is installed by default with our SDK.
Under STMicroelectronics in the start menu, run the STDFU Tester program.
The board must be put in a special mode for the STDFU tool to recognize it. To do so, hold the LDR button on your board, power it, then release LDR.
If your board lacks an LDR button, short the two pads labeled either LDR or BOOT (depending on your board) together and then power your board.
If you have a FEZ Cerb40 II, hold the LODR pin high and then power the board.
Next, you will see "STM Device in DFU Mode" appear under Device in the STDFU tool. Click the Protocol tab.
Click the Create from Map button, select the Erase radio button, and then click Go. The program will take a few moments to erase the board.
**Once it has finished, select the download option on the left before downloading the loader file:**
Click the Load DFU File button and select the C:\Program Files (x86)\GHI Electronics\NETMF v4.3 SDK\Firmwares\Cerb Family\Loader.dfu file. Click the Download radio button and then click Go. The program will quickly load the new loader onto your board.
Reboot your board after it finishes and proceed to update the firmware using FEZ Config as detailed on the Firmware Update page.
 
> [!Warning]
> Make sure to follow these steps exactly. You could corrupt the loader file or overwrite certain parts of your device if you are not careful.

## PWMs
On the Cerb Family of products, the underlying processor groups PWMs in such a way that a change to the frequency in one PWM affects all PWMs in that group. The below list shows the groups of PWMs:

* PWM_3, PWM_11, PWM_12
* PWM_8, PWM_9, PWM_10, PWM_13
* PWM_4, PWM_5, PWM_6, PWM_7
* PWM_14, PWM_15
* PWM_0, PWM_2
* PWM_1

## FEZ Cerbuino Net Ethernet Initialization
The below code shows how to initialize the onboard Ethernet on the FEZ Cerbuino Net from a plain NETMF project. It requires the GHI.Networking, GHI.Pins, and Microsoft.SPOT.Net libraries. If you are using Gadgeteer, you can find the Ethernet object pre-created on the Mainboard.Ethernet object.

```c#
using GHI.Networking;
using GHI.Pins;
using Microsoft.SPOT;
using Microsoft.SPOT.Hardware;
using Microsoft.SPOT.Net.NetworkInformation;

public class Program
{
	private static EthernetENC28J60 netif;

	public static void Main()
	{
		NetworkChange.NetworkAvailabilityChanged += NetworkChange_NetworkAvailabilityChanged;
		NetworkChange.NetworkAddressChanged += NetworkChange_NetworkAddressChanged;

		netif = new EthernetENC28J60(SPI.SPI_module.SPI1, Generic.GetPin('A', 13), Generic.GetPin('A', 14), Generic.GetPin('B', 10));
		netif.Open();
		netif.EnableDhcp();
		netif.EnableDynamicDns();
	}

	private static void NetworkChange_NetworkAddressChanged(object sender, Microsoft.SPOT.EventArgs e)
	{
		Debug.Print("Network address changed");

		if (netif.IPAddress != "0.0.0.0")
		{
			//The network is now ready to use.
		}
	}

	private static void NetworkChange_NetworkAvailabilityChanged(object sender, NetworkAvailabilityEventArgs e)
	{
		Debug.Print("Network availability: " + e.IsAvailable.ToString());
	}
}
```

## FEZ Cerbuino Bee and FEZ Cerbuino Net SD Card Detect
To detect whether or not an SD card is inserted in the onboard connector, you can sample pin PC2 with the pull-up resistor enabled. You can also use an interrupt to signal when the insertion state changes. Once you detect the presence of a card, you can create and mount the SDCard object.

## Known Issues
Socket 5 and 6 on the FEZ Cerberus are both marked as S and P (among others) and use the same SPI bus. The 3 main SPI pins and the 3 PWM pins both use the physical pins 7, 8, and 9 on a socket. As a result, when you use SPI or PWM on those sockets, neither SPI nor PWM will function on the other socket.

