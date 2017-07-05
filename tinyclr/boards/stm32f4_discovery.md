# STM32F4 Discovery Boards

## STM32F411 Discovery

The STM32F411 Discovery board http://www.st.com/en/evaluation-tools/32f411ediscovery.html is a low-cost board with a built in native debugging support, called ST-Link. This is a good, especially for users wanting to port TinyCLR OS and in need for debugging TinyCLR OS native port.

Use the ST DFU tool to load the “FEZ firmware 0.5.0” onto your discovery board. When done, your PC should detect a TinyCLR device. You are now ready to start coding http://docs.ghielectronics.com/tinyclr/tutorials/intro.html

Note that we are using the same FEZ firmware. Peripherals are mapped exactly to how they are on the FEZ board http://docs.ghielectronics.com/hardware/fez.html

## STM32F407 Discovery

The STM32F407 discovery board is very close to the STM32411. http://www.st.com/en/evaluation-tools/stm32f4discovery.html

To run TinyCLR OS, follow the same instructions as the STM32F411 discovery board
http://docs.ghielectronics.com/tinyclr/boards/stm32f411_discovery.html
