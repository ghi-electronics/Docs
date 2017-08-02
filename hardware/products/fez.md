# FEZ
![FEZ](images/fez.jpg)

FEZ (fast and easy) is the official board for TinyCLR OS. This low-cost, WiFi IoT-ready, Arduino-pinout compatible, and TinyCLR-OS-ready board is everything a developer needs to evaluate TinyCLR OS and to build modern IoT applications.

We have also handpicked some 3rd-party [accessories](../../tinyclr/accessories/intro.md) to help you get going even faster.

# TinyCLR OS
TinyCLR OS allows tiny systems to run .NET applications with rich debugging capabilities though Visual Studio 2017.

* [TinyCLR OS Website](http://www.tinyclr.com/)
* [TinyCLR on FEZ](../../tinyclr/boards/fez.md)
* [TinyCLR Ports Repo](https://github.com/ghi-electronics/TinyCLR-Ports)

# Other Options
TinyCLR OS is the official supported platform for FEZ; however, these are some other good options. GHI Electronics is not affiliated and does not provide support for any of these 3rd party options.

Interested in a FREE FEZ to test it with one of these options? We want to hear from you [directly](https://www.ghielectronics.com/contact) or on our [community forums](https://forums.ghielectronics.com/).

## Arduino
Arduino is simpified multi-platform IDE/C++ combo, with a community STM32 options.

* [Arduino Wesbite](https://www.arduino.cc/)
* [Arduino STM32 forum](http://www.stm32duino.com/)

## eLua
eLua is an embedded version of Lua, allowing small embedded systems to run and compile Lua programs.
The STM32F4 is already one of available ports, making it easier to run MicroPython on FEZ.

* [eLua Website](http://www.eluaproject.net/)
* [GitHub Repo](https://github.com/elua/elua)

## mbed
mbed is an online compiler platform. There is nothing to install, just log in and start coding!
One of the supported boards is Nucleo-F401RE, which uses the exact same microcontroller found on FEZ. Start with it to build and compile then follow the [STM32 bootloader](../loaders/stm32_bootloader.md) instructions on generating and loading DFU files. 

* [mbed Website](https://developer.mbed.org/)
* [Nucleo-F401RE](https://developer.mbed.org/platforms/ST-Nucleo-F401RE/)

## MicroPython
MicroPython allows tiny systems to run Python 3, with a small subset of the standard library.
The STM32F4 is already one of available ports, making it easier to run MicroPython on FEZ.

* [MicroPyho Website](http://www.micropython.org/)
* [GitHub Repo](https://github.com/micropython/micropython)

## Plain Coding!
Of course you can just start coding everyting from scratch. You can use free open source GNU GCC tools to build your programs, which is what we use to build TinyCLR OS. An easier options is to use Keil comiler/IDE. It is free for 32KB or less program size (MDK-Lite).
If you are not adding a SWD JTAG tool, like ST-Link, follow the [STM32 bootloader](../loaders/stm32_bootloader.md) instructions on generating and loading DFU files. 
 
* [Keil Website](http://www.keil.com/)
* [Keil ARM MDK tools](http://www2.keil.com/mdk5)
