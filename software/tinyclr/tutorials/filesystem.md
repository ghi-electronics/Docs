# Filesystem
---
The filesystem library can be used to read and write files from an SD card. The below example requires the `GHIElectronics.TinyCLR.IO` library and a device with an SD card.

```
using GHIElectronics.TinyCLR.Devices.SdCard;
using GHIElectronics.TinyCLR.IO;
using System;
using System.IO;
using System.Text;

namespace Filesystem {
    public class Program {
        public static void Main() {
            var sd = SdCardController.GetDefault();
            var drive = FileSystem.Mount(sd);

            var file = new FileStream($@"{drive.Name}Test.txt", FileMode.OpenOrCreate);
            var bytes = Encoding.UTF8.GetBytes(DateTime.UtcNow.ToString() + Environment.NewLine);

            file.Write(bytes, 0, bytes.Length);

            file.Flush();

            FileSystem.Flush(sd);
        }
    }
}

```
