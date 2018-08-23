# Filesystem
---
The filesystem library can be used to read and write files from an SD card. The below example requires the `GHIElectronics.TinyCLR.IO` and `GHIElectronics.TinyCLR.Storage` libraries and a device with an SD card.

```
using GHIElectronics.TinyCLR.Devices.Storage;
using GHIElectronics.TinyCLR.IO;
using System;
using System.IO;
using System.Text;

namespace Filesystem {
    public class Program {
        private static void Main() {
            var sd = StorageController.FromName(@"GHIElectronics.TinyCLR.NativeApis.STM32F4.SdCardStorageController\0");
            var drive = FileSystem.Mount(sd.Hdc);

            var file = new FileStream($@"{drive.Name}Test.txt", FileMode.OpenOrCreate);
            var bytes = Encoding.UTF8.GetBytes(DateTime.UtcNow.ToString() + Environment.NewLine);

            file.Write(bytes, 0, bytes.Length);

            file.Flush();

            FileSystem.Flush(sd.Hdc);
        }
    }
}

```

## Low-level Access
You can access the raw underlying data of the storage provider using the `Provider` property of the controller. Be careful when using this interface, however, as it bypasses any filesystem present and writes directly to the device. This is useful for implementing your own or otherwise not-supported filesystems.

```cs
var controller = StorageController.FromName(@"GHIElectronics.TinyCLR.NativeApis.STM32F4.SdCardStorageController\0");
controller.Provider.Read(address, buffer, 0, buffer.Length, -1);
```