# Porting TinyCLR

TinyCLR OS can be ported to new devices. We provide the precompiled .NET interpreter and runtime for several architectures. Currently only Cortex M4 is supported, but more will be supported in the future. To get started we'll build the [FEZ](../../hardware/products/FEZ.md) firmware.

1. Clone the [ports repo](https://github.com/ghi-electronics/TinyCLR-Ports) to your computer.
2. Download and install [GCC](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads). The latest version we have tested is `6-2017-q2-update`.
3. Download and extract the contents of [CMSIS](https://github.com/ARM-software/CMSIS/releases/download/v4.3.0/ARM.CMSIS.4.3.0.pack) into the CMSIS folder of the cloned repo. While the file extension is `*.pack`, it's actually a zip that you can extract once you rename it to `*.zip`.
4. Download and extract the latest [TinyCLR OS Core Library](https://github.com/ghi-electronics/TinyCLR-Ports/releases) into the Core folder of the cloned repo.
5. Open a command prompt, change the directory to the cloned repo, and then execute `build.bat FEZ`.

The compiled firmware can then be found in the repo directory under `build\release\FEZ`. The build system automatically produces firmware images in hex format (.hex), a raw binary (.bin), a binary meant to be loaded by our [GHI Bootloader](../../hardware/loaders/ghi_bootloader.md) with its U command (.glb), and, for some devices, a binary meant to be loaded by the same bootloader with the X command (.ghi). For the FEZ firmware we built, flash the `FEZ Firmware.glb` to your board following the instructions on the [bootloader](../../hardware/loaders/ghi_bootloader.md) page. When you restart it, it should be running TinyCLR OS and you can deploy to it from Visual Studio.

## Creating your own Devices
To create a new firmware for a board that a `Target` already exists for, you just need to create a new folder under Devices to define your board. You can do this easily by copying an existing board, like the FEZ, and making the changes you need for your board. Make sure you update the scatterfile to place the final firmware image in memory where it needs to be. For example, the FEZ scatterfile expects the GHI Bootloader to be present but you need to place your firmware's image at the start of flash.

## Creating a new Target
To port to a new board with a new `Target`, make sure it is one of the architectures that we have made a core library available for. Then, like above, you'll need to make a new folder for your device under the Devices folder. You'll also need to create a new folder under Targets that implements the needed APIs. 

The TinyCLR runtime requires you to provide a few APIs for it to function correctly: deployment, interrupt, power, and time. The runtime also makes a few APIs available to you automatically: the API provider itself; a memory allocator; a recurring task creator; and a way to interact with managed objects, arguments, and events. Beyond that, you can provide whatever APIs you need like GPIO and SPI. See the [native API document](native_apis.md) for details on APIs. On top of providing several APIs, you must call all the functions under `TinyCLR_Startup_*` to properly initialize the system. The `main.cpp` provided in the repo that our existing ports use and the build system includes is a good starting point.
