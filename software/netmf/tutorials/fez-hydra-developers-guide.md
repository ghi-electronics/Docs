# FEZ Hydra Developers' Guide

FEZ Hydra is a 100% open source hardware (OSHW). This means, hardware design files are made public and the software running the board is made public as well. Even better, FEZ Hydra hardware is designed with EAGLE, one of the most popular design tools and the software is developed on the free, open source GCC compiler.

## Licensing
The design files are available to everyone to use, even commercially. The software is licensed using [Apache2](http://www.apache.org/licenses/LICENSE-2.0). This license allowing for changes, for commercial use and for even close sourcing the derived designs. The hardware is licensed using [Creative Commons Share Alike 3.0](http://creativecommons.org/licenses/by-sa/3.0/). This license allows for commercial use and for derived work but doesn't allow close sourcing the derived work. [Please contact GHI](http://www.ghielectronics.com/contact/) if you need to close source your derived work.

Note that the FEZ nor the FEZ Hydra name are licensed for use. GHI is licensing the designs as outlined above, even for commercial use, but is not giving any rights to use the any GHI Electronics's trademarks. Check the link above for full details on the license. If you are making your own commercial product, you should have a completely different and distinctive name. Using derived names or similar names will only confuse your own customers and GHI's customers.

GHI is interested in learning about what you are doing with FEZ Hydra design files. We can help you even further; so, please consider contacting GHI directly with info about your project.

To properly attribute this work, your board should say

```
Based on GHI's OSH FEZ Hydra
```

and your website and all documentation should say

```
Based on GHI Electronics' Open-Source-Hardware FEZ Hydra design files. 
Visit this page for more details http://www.ghielectronics.com/docs/39/fez-hydra-developer
```

## The open-source Files
FEZ Hydra EAGLE design files are [found here](http://www.ghielectronics.com/downloads/Gadgeteer/Mainboard/Hydra/FEZ%20Hydra%201.2%20EAGLE.zip).

The files are provided AS-IS.

FEZ Hydra software components are available at https://bitbucket.org/ghi_elect/netmf-open-firmware

To build the software, you need RVDS or GCC compilers.

This page covers more details on using GCC on building your own firmware [FEZ Hydra Firmware](https://www.ghielectronics.com/docs/328/fez-hydra-firmware).

## Real Time Clock
For the Real Time Clock to function, VBAT must be supplied with 1.2 volts.

## RLP
RLP on the FEZ Hydra is a bit different than our other offerings. We do not support parsing ELF files. You must compile your native code into a raw binary image and load it using our AddressSpace class to the RLP address of 0xA0000000. You must find the address of your desired function in the map file that the compiler produces and construct a NativeFunction object manually using that address. Invocation and parameter passing function identically, except that RLP extensions (the RLP.h file) are not supported.
The FEZ Hydra folder in the samples archive linked on the RLP page contains a Keil uVision project. It is already configured and references the NativeCode.c file. Just open the project in uVision and build it after you have made your changes to NativeCode.c.
For advanced users creating their own project, you want to compile from the Atmel AT91SAM9RL64 processor with an R/O base of 0xA0000000 and R/W base of 0xA0080000. Make sure that you convert any generated ELF file into a raw binary file.

## Feature Set
As FEZ Hydra has been released as open source, some of the features found in other GHI Electronics' products are not available. The following are not supported:
* SPI display configuration
* Non-blocking Signal Generator
* CAN
* Play PCM audio
* Bitmap convert to file
* Watchdog
* RLP ELF file parsing
* RTC Alarm
* Hibernate
* InField Update
* Startup Logo
* SD card detection
* BuiltInEthernet
* WiFi RS9110
* PPP
* SQLite
* USB host
* USB client
* Passing bitmaps to RLP
* Bitmap get and set internal buffer
* SSL
* UART handshaking
* Configuration read and write
* Pulse capture

## Known Issues
Sockets 3 and 4 should be labeled SX and SUX respectively. Type K on socket 6 is also not available.

## Loader Update
To update the loader, you must erase the device and then deploy the new loader. To begin, disconnect all modules, connect pin eight on socket three or four to ground, power the board, wait five seconds, then unconnect the pin. If your FEZ Hydra has a small button just above socket 9, you can hold that down while powering the board instead of grounding pin 8.
After you do that, the device will show up as a COM port in the Devices and Printers menu in Windows. Make note of the COM port number.
Navigate to: C:\Program Files (x86)\GHI Electronics\GHI NETMF v4.3 SDK\Firmwares\FEZ Hydra\Loader.
Right click on Update.bat, click Run As Administrator, and follow the instructions.
"Updating" should be displayed on the screen for several minutes. Once "Done" is displayed, reset the device, and deploy the firmware using FEZ Config as detailed on the [Firmware Update page](https://www.ghielectronics.com/docs/127/firmware-update).
 
> [!Tip]
> If "Updating" is only displayed for a few seconds before done is display, the update did not complete. The Log.txt file created in the same directory can help diagnose the problem.