# Memory Management
---

## Introduction
TinyCLR OS is a managed operating system. Allocated objects are automatically tracked and freed as needed. It also provides additional features necessary of embedded systems.

## Memory Size
Free and used memory sizes can be measured at runtime. This helps in optimizing systems.

```cs
var freeRam = GHIElectronics.TinyCLR.Native.Memory.FreeBytes;
var usedRam = GHIElectronics.TinyCLR.Native.Memory.UsedBytes;
```

## Direct Access
In some cases, it is necessary to be able to write directly to a specific address in memory. For example, to configure an internal register.

The `Marshal` class found in `System.Runtime.InteropServices` provides several methods to read and write memory directly.

This code assumes we need to set the third bit in a 32 bit register located at 0x12345678.

```cs
var address = new System.IntPtr(0x12345678);
Marshal.WriteInt32(address, Marshal.ReadInt32(address) | (1 << 3));
```

## Native Code
TinyCLR OS allows you to load and execute native compiled code. See [Interops](../native/interops.md).

## Allocating Memory
TinyCLR OS allocates and frees objects automatically on the heap. When the memory gets fragmented, the system will compact the heap. This is the desired behavior but this also creates a problem when sharing resource between TinyCLR OS and native drivers. In advance setup, a user may have a buffer that gets written to from an interrupt routine. Assuming this is implemented in native code, we would need a buffer that always sits at a fixed address. Using `var buffer = new byte[12];` will not work as the garbage collector may move the buffer to compact the heap.

A fixed location buffer can be allocated using `GHIElectronics.TinyCLR.Native.Memory.Allocate()`. Keep in mind that this is not managed memory anymore and you are responsible to free this memory using `GHIElectronics.TinyCLR.Native.Memory.Free()`.
