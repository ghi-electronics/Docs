# Native Code on TinyCLR
---
![TinyCLR Logo](../images/tinyclr-logo-noborder.jpg)

TinyCLR has a few different ways you can use native code. You may want to do this for performance reasons or to access advance features on your platform.

The most commonly used option will be [native interops](interops.md) combined with [native APIs](apis.md). Interops allow you to call native code from your managed application and interact with managed data from the native side. APIs allow access to other services registered with the system like SPI, GPIO, and I2C. You will commonly want to access an API from your native interop.

You are also able to [port](porting.md) TinyCLR to a new device. Most ports will be based off of an existing target like the STM32F4 and simply change the device periperal mappings. A more advanced use case is to port TinyCLR to an entirely new target that is not currently available, provided that it is based on one of the architectures we support, such as Arm Cortex M4.
