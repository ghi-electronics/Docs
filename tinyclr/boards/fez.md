# FEZ
![FEZ](../../hardware/products/images/FEZ.jpg) 

FEZ is the official TinyCLR OS board and reference design. Its port, called **FEZCLR**, has the latest and greatest software, and should be used as a reference for starting new ports. 

Find Hardware resources and other 3rd party software on the [FEZ hardware page](../../hardware/products/fez.md)

FEZ includes the GHI Electronics bootloader [bootloader](../../hardware/loaders/bootloader.md) for making software update easier. The board comes pre-loaded with the loader. In case you erased the board and want to reload the bootloader, you can download it [here](https://files.ghielectronics.com/downloads/Bootloaders/FEZCLR%20Bootloader.2.0.3.dfu). To load the bootloader file onto FEZ, use the DFU tools as explained [here](../../hardware/loaders/stm32_bootloader.md)

# Loading the Firmware
To activate bootloader, press and hold the ??? button down while resetting the board.

Download the [FEZCLR firmware](../../tinyclr/downloads.md#fezclr) and follow [Loading the Firmware](../../hardware/loaders/bootloader.md#loading-the-firmware) steps.

