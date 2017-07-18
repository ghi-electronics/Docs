# FEZ Cerberus

The Cerb family included FEZ Cerberus, FEZ Cerbuino and FEZ Cerb40. All these open source devices worked with NETMF

To use any of the cerb-family boards, follow the setup instructions on the NETMF into page (link).

Resources:
*	Schematic
*	Development board reference schematic

G400D is compatible the GHI Electronics’ [Universal Compute Modules (UCM)](www.ghi.co/products/usm). Please consider one of these modules as a drop-in hardware replacement for G400D 

We recommend TinyCLR OS as a replacement for NETMF. Learn more about TinyCLR at www.tinyclr.com.
To help you evaluate TinyCLR OS, we are providing a preview firmware for G30. Load this firmware using our [boot loader](http://docs.ghielectronics.com/hardware/bootloader.html) and then these devices will run TinyCLR-OS

FEZ Cerb firmware 0.5.0 (link)

The FEZ Cerberus family of boards, FEZ Cerberus, FEZ Cerbuino and the Cerb40 were originally made to run .NET Micro Framework. To 

Like for the FEZ board, we are providing a bootloader to make firmware update easier. This loader needs to be loaded once and then TinyCLR OS firmware update is a lot easier.

Use the ST DFU tool to load the “cerb loader 2345” onto your Cerb board. When done, your PC should detect a virtual COM port. You can now load the “cerb firmware 0.5.0” onto your board. Loadong the firmware is done using terminal software with XMODEM. More info is found on our [bootloader page](http://docs.ghielectronics.com/hardware/bootloader.html)

You are now ready to [start coding](http://docs.ghielectronics.com/tinyclr/tutorials/intro.html)

The region set aside for RLI is 0x2001F000 - 0x2001FFF8.
