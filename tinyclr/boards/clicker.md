# clicker

Mikro Elekronika's [STM32 M4 clicker](https://shop.mikroe.com/clicker-stm32f4) board includes a single [mikroBUS](https://www.mikroe.com/mikrobus/) socket, for quickly adding one of many available [click modules](https://shop.mikroe.com/click).

The board comes pre-flashed with a [bootloader](https://learn.mikroe.com/bootloaders/) for an easy and quick way to load your firmware, TinyCLR OS in our case. Simply open the bootloader tool and load the TinyCLR OS firmware file.

> [!Tip]
> The loader will wait for a few seconds on every power up before it runs TinyCLR OS. If this delay is not desirable, use an ST-Link programmer to flash the firmware onto the board directly, overwriting the bootloader.

> [!Warning]
> clicker and clicker 2 boards use different processors and different system clock. Each board has its own TinyCLR OS firmware.

## MINI-M4 for STM32
The [MINI-M4 for STM32](https://shop.mikroe.com/mini-stm32f4) uses the same processor and system clock as the clicker board. It even includes the same bootloader. This allows for the same TinyCLR OS firmware to also on the MINI-M4 for STM32.
