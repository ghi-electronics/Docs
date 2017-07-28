# FEZ

FEZ is the official TinyCLR OS board and reference design. Its port, called FEZCLR, has the latest and greatest software, and should be used as a reference for starting new ports. 

Read more on its [hardware page](http://docs.ghielectronics.com/hardware/fez.html)

FEZ includes teh GHI Electronics bootloader [bootloader](../../hardware/loaders/bootloader.html) for making software update easier. The board comes pre-loaded with the loader. In case you erased the board and want to reload teh bootloader, you can download it [here](https://ghistorage.blob.core.windows.net/downloads/Bootloaders/FEZCLR%20Bootloader.2.0.3.dfu). To load the bootloader file onto FEZ, use the DFU tools as explained [here](../../hardware/loaders/stm32_bootloader.html)

# Loading the Firmware
The firmware file is found [here](https://ghistorage.blob.core.windows.net/downloads/TinyCLR/Firmware/FEZCLR/FEZCLR%20Firmware.0.5.0.glb)

 ## Using TinyCLR Config
(coming soon)

## Manual Loading the Firmware
TinyCLR Config tool should be used to update the firmware. As a backup, use the instructions on the [bootloader page](../../hardware/loaders/bootloader.html) for manual update.
