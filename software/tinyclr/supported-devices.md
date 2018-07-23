# Supported Devices

![Boards](images/boards.png)

TinyCLR OS can be [ported](porting/intro.md) to almost any device running an ARM processor, but it is also already ported to many devices. Available options fall under three different tiers: official reference, commercially supported, and community supported.

## Official Reference
The port for [FEZ](../../hardware/fez/intro.md) is the official reference port for TinyCLR OS. We recommend using it as a starting point to learn how to build and modify TinyCLR OS. Grab one of the ultra-low-cost FEZ boards and start [porting](porting/intro.md) today.

> [!Tip]
> [BrainPad](https://www.brainpad.com/) uses the same port as FEZ.

The reference port includes these libraries:

|                   |           |        |
|-------------------|-----------|--------|
| Memory Management | Threading | Events |
| [Digital Input](tutorials/gpio.md) | [Digital Output](tutorials/gpio.md) | [Interrupts](tutorials/gpio.md) |
| [PWM](tutorials/pwm.md) | [ADC](tutorials/adc.md) | [DAC](tutorials/dac.md) |
| [UART](tutorials/uart.md) | [SPI](tutorials/spi.md) | [I2C](tutorials/i2c.md) |
| [GPIO Change Writer](tutorials/gpio-change-writer.md) | [GPIO Change Reader](tutorials/gpio-change-reader.md) | [GPIO Pulse Reader Writer](tutorials/gpio-pulse-reader-writer.md) |

Keep in mind that while the above features are available not every device will support every feature because the processor itself may not support it or resources are not available.

## Commercially Supported
We also provide a pre-compiled firmware for our Cortex-M [SCM](../../hardware/scm/intro.md) and [UCM](../../hardware/ucm/intro.md) modules. This is a commercially supported TinyCLR OS firmware that includes additional features suited for commercial designs -- features only found in the pre-compiled firmware you receive from us.

We understand that commercial customers want things to just work and so we handle all testing and validation of the provided firmware. It is possible to extend this firmware with additional native functionality using [native interops](porting/native-interops.md) loaded at runtime.

The firmware for these devices include all features found in the official reference port, plus the following additional commercial features:

|             | UC5550 | UC2550 | G120 | G400 | G80 | G30 |
|-------------|--------|--------|------|------|-----|-----|
| File System | Y | Y | Y | Y | Y | D |
| Graphics    | Y | Y | Y | Y | N | N |
| USB Client  | F | F | F | F | F | N |
| USB Host    | F | F | F | F | F | N |
| IFU         | F | F | F | F | F | N |

* Y = Supported
* N = Not Supported
* D = In Development
* F = Future Plan

The above list is subject to change and is not a guarantee.

## Community Supported
The community supported ports are the joint effort of the community and GHI Electronics to bring TinyCLR OS to many popular products. While these ports may be incomplete or broken, we encourage you to try them and contribute. These ports also include some of the discontinued GHI Electronics products, like the Cerb family and the FEZ Hydra.

Take a look at the devices on our [GitHub](https://github.com/ghi-electronics/TinyCLR-Ports/tree/master/Devices) to see what's available!