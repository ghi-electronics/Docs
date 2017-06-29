# Porting TinyCLR

TinyCLR OS can be ported to new systems. We provide the .NET interpreter and runtime that is already compiled for several systems. Currently Cortex M4 with more to come. To get started we'll build the [FEZ](../../hardware/FEZ.md) firmware.

1. Clone the [ports repo](https://github.com/ghi-electronics/TinyCLR-Ports) to your computer.
2. Download and install [GCC](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads). The latest version we have tested is `6-2017-q2-update`.
3. Download and extract CMSIS to root\CMSIS from https://github.com/ARM-software/CMSIS/releases/download/v4.3.0/ARM.CMSIS.4.3.0.pack
4. Download and extract the TinyCLR core files to root\Core from GitHub/releases
5. Run `build.bat FEZ build release`

The build system automatically produces firmware images in hex format (.hex), a raw binary (.bin), a binary meant to be loaded by our [GHI Bootloader](../../hardware/bootloader.md) with its U command (.glb), and, for some devices, a binary meant to be loaded by the same bootloader with the X command (.ghi). For the FEZ, flash the FEZ.glb to your board. When you restart it, it should be running TinyCLR OS and you can deploy to it from Visual Studio.

To create a new firmware for a board that a port already exists for, you just need to create a new folder under Devices to define your board. You can do this easily by copying an existing board like the FEZ and making the changes you need for your board.

To port to a new board, make sure it is one of the architectures that we have made a core library available for. Then like above, you'll need to make a new Devices folder. But you'll also need to create a new Targets folder that implements the needed APIs. The TinyCLR runtime requires you to provide a few APIs for it to function correctly: deployment, interrupt, power, and time. The runtime also makes a few APIs available to you automatically: the API provider itself; a memory allocator; a recurring task creator; and a way to interact with managed objects, arguments, and events. Beyond that, you can provide whatever APIs you need like GPIO and SPI. See [here](native_apis.md) for details on APIs. On top of providing several APIs, you must call all the functions under `TinyCLR_Startup_` to properly initialize the system. The `main.cpp` provided in the repo that our existing ports use is a good starting point.
