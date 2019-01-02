# Networking
---
It wasn't that long ago that computer networking was expensive, complicated, and used almost solely within organizations. With the widespread adoption of Wi-Fi, Ethernet, and the Internet, networking is now inexpensive, easy, and ubiquitous.

As developers and manufacturers of embedded products, the Internet of Things revolution is of great interest. While the projected growth of the IoT market varies wildly depending on whose research you're looking at, everyone agrees that IoT is growing exponentially and that growth will continue for the forseeable future. There are now more IoT devices than PCs, laptops, smartphones, and tablets. Some feel that within the next two years the average connected home will have fifty IoT devices. Others claim that this is the start of the next industrial revolution.

TinyCLR provides socket and HTTP APIs that should be familiar to any .NET developer. Take a look at the [.NET docs](https://docs.microsoft.com/en-us/dotnet/api/system.net.sockets.socket) for some samples. Our implementation can be found in the `GHIElectronics.TinyCLR.Networking` and `GHIElectronics.TinyCLR.Networking.Http` libraries.

Currently we have a built in driver for the [SPWF04Sx](spwf04sx.md), but more will be added over time.