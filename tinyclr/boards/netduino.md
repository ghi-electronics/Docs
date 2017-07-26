# netduino

## netduino 3

Originally a .NET Micro Framework product, netdunio 3 is available in three flavors:

- [netduino 3](http://www.netduino.com/netduino3/specs.htm)
- [netduino 3 Ethernet](http://www.netduino.com/netduino3ethernet/specs.htm)
- [netduino 3 WiFi](http://www.netduino.com/netduino3wifi/specs.htm)



Follow the instructions at the [STM32 bootloader](../../hardware/loaders/stm32_bootloader.md) page to generate a DFU file and load on your board.

When done, your PC should detect a TinyCLR device. You are now ready to [start coding](../tutorials/intro.md)

> [!Tip]
> Currently the firmware is the same for all three devices and doesn't include any networking support.

> [!Tip]
>The region set aside for RLI is 0x2002F000 - 0x2002FFF8.