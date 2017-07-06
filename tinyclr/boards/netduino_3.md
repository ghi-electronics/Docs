# Netduino 3

Originally a .NET Micro Framework product, netdunio 3 is available in three flavors:
- netduino 3 http://www.netduino.com/netduino3/specs.htm
- netduino 3 Ethernet http://www.netduino.com/netduino3ethernet/specs.htm
- netduino 3 WiFi: http://www.netduino.com/netduino3wifi/specs.htm

Use the ST DFU tool to load the “netduino3 firmware 0.5.0” onto your netduino 3. Currently the firmware is the same for all three devices and doesn’t include any networking support. When done, your PC should detect a TinyCLR device. You are now ready to start coding http://docs.ghielectronics.com/tinyclr/tutorials/intro.html

The region set aside for RLI is 0x2002F000 - 0x2002FFF8.