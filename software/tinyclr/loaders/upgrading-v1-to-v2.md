# Upgrading GHI Bootloader v1 to v2
---
Some of our devices come shipped with Bootloader v1 installed. These devices included Embedded Master, EMX, G120, G120E, and USBizi. Use the following instructions to upgrade devices from Bootloader v1 to Bootloader v2.

## To update using USB
1. Download the [bootloader file](ghi-bootloader.md#downloads).
2. Put your device in boot mode (instructions are found on each product's documentation page).
3. The PC will now detect a virtual serial (COM) device. If you need drivers, they are in the [NETMF](../../../software/netmf/intro.md) SDK.
4. Open any terminal software, we recommend [Tera Term](http://ttssh2.osdn.jp/).
5. Select serial and pick the COM port associated with your board.
6. Enter `E` and you will see back "Erase all memory! Are you sure?" now enter `Y`. (The bootloader is case sensitive)
7. Enter `X` and you will see `CCCC`... showing on the terminal.
8. Now go to `File` -> `Transfer` -> `XMODEM` -> `Send` and then check the `1K` option.
9. Select the bootloader file you have downloaded above.
10. You will see `File Transfer Finished Successfully`.
11. Change the configuration switches back to the off position and reset the board.
12. You are now running GHI Electronics bootloader v2!

### To update using serial (for Embedded Master and EMX)
1. Connect your PC to COM1 on the device, pins 5 and 6 (through RS232 converter or a USB-Serial TTL cable).
2. Set the down and select pins low on Embedded Master or the LMODE pin low on EMX.
3. Follow the above steps starting at step 4 to load the firmware.
