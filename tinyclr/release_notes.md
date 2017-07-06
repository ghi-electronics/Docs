# Alpha Release Notes

## [0.5.0 on 2017-07-07](http://ghielectronics.com/downloads/TinyCLR/TinyCLR.0.5.0.zip)

### Notes
This release focuses on the public porting library and API -- though there are a few minor fixes and changes in other areas. As part of the new porting experience, we are also releasing a very early build of TinyCLR for the Netduino 3 and Quail mainboard!

You can now port TinyCLR OS to run on your own system using the header file and library we provide -- as long as your architecture is supported. Currently, only Cortex M4 is available. Keep in mind the available API is still alpha and may change, especially USB client. See [here](porting/intro.md) for details. You can also create your own managed functions that can call into native code that you provide. These will be automatically wired into the system for a seemless experience. See [here](porting/native_interops.md) for details.

To support this, we added a few more classes under `System.Runtime.InteropServices`. Most important is the `Interop` class. It allwos you to add and remove interops from the system by providing it with the address in memory of the interop definition table. It expects you to load it into memory yourself using the `Marshal` class. You can use `FindAll` to get back a list of all interops registered in the system and `RaiseEvent` to trigger an event on the specified native event dispatcher.

The `NativeEventDispatcher` class allows you to get an instance of the class to receive events that the specified dispatcher name receives (either from native code or `Interop.RaiseEvent`). It has a single event that gets triggered whenever an event is received. There is only one instance per dispatcher name, so calls to `GetDispatcher` with the same name will return the same instance.

Similar to `Interop`, `Api` can be used to add and remove native APIs from the system. It expects you to load the API into memory yourself and pass it the address of the API definition. You can query all registered APIs, find a specific API by name and type, and parse and creator selectors. Selectors are a string that represents an API name and index into its implementations of the form "name\index". A default selector is set so that a specific API type can be returned without knowing the exact name, like the default GPIO controller on a system.

The `Api` class is used internally by the devices library to talk to the native implementation via the implementation `IntPtr` provided for the given API name and index. In some cases you can use the `GetDefault` method on a given device provider to return the default registered API. If there is no default, like for PWM and others, you can pass the `Id` property in the specific pins class to the desired device provider.

We added `Marshal.GetDelegateForFunctionPointer` to enable you to create a quick native interop for a specific address in memory that takes a single `ref IntPtr` parameter and returns nothing. `DeviceInformation` was also added to return the device name, manufacturer, and version set on the native side.

After flashing the firmware for the first time on any device, Windows may still use the old NETMF USB IDs preventing the device from being seen by TinyCLR. Uninstall the device from the Device Manager and reinstall it to fix it. To update the firmware on pre-Windows 10 machines, you will need the bootloader drivers provided by our existing [2016 R1 NETMF SDK](https://www.ghielectronics.com/support/netmf/sdk/41/ghi-electronics-netmf-sdk-2016-r1).

### Libraries

#### Changes
- Added running device detection.
- Added listing, adding, and removing system interops.
- Added listing, adding, and removing system APIs.
- Added `Marshal.GetDelegateForFunctionPointer`.
- Added `NativeEventDispatcher`.
- Added provider IDs to pins.
- Added FEZ pinout.
- Added `Expansion` to BrainPad.
- Updated devices library to use the provider and native API model via a `Provider` class for each device type.
- Core assembly was renamed to `mscorlib`.
- `GetDeviceSelector` and `DeviceInformation.FindAll` now throw an exception on use.
- Opening a non-existent UART now throws on construction.
- Changed `DateTime.Ticks` to use the same epoch as the desktop.
- Gpio write now fires `ValueChanged`.
- BrainPad accelerometer now uses the proper axes and scaling.
- BrainPad `Image` was renamed to `Picture`.
- BrainPad `WriteOnComputer` was renamed to `WriteToComputer`.
- BrainPad Servo `SetMaxPulseWidth` now has correct range in the exception message.
- Increased the duration and frequency of the BrainPad buzzer beep.
- Original BrainPad display now works.
- Replaced `AutoShow` flag on BrainPad with `DrawTextAndShowOnScreen` methods.
- Reworked BrainPad `Servo` API.
- Removed BrainPad `Board` class.

#### Known Issues
- Software I2C can lock up the board if a slave device isn't connected or responds improperly.
- Formatting numbers that cross an assembly boundary can throw an exception.
- Support for the embedded Visual Basic runtime is incomplete and some uses may throw cryptic compile errors.
- Device sharing modes are not respected.
- Partially transparent ellipses have weird artifacts.

### Firmware

#### Changes
- Initial FEZ Cerberus, FEZ, Netduino 3, and Quail firmware release.
- All peripherals are now properly reset on startup.
- Gpio write values are stored when not in output model.
- Fixed PWM jittering.
- All frequencies now round down.
- Fixed gpio interrupts being slow and something getting missed.

#### Known Issues
- Rapidly pressing the buttons on the BrainPad may corrupt the display.
- GpioChangeWriter generates an incorrect signal for periods above 50ms on G400.
- An 0xA2000000 error is sent over the debug transport when there is no deployment present.
- Many UART properties and events are not implemented.
- There is no firmware for G120 and G400 in this release.

### Extension

#### Changes
- Removed stray semicolon in BrainPad Visual Basic template.
- Changed BrainPad templates to have a `BrainPad` static class in them.
- Reduced the number of retries for connecting to device.
- Added namespace to C# BrainPad template.

#### Known Issues
- The device may not load drivers on Windows 7 preventing Visual Studio from seeing it.
- Some uses of pattern matching may crash the C# compiler.
- Visual Basic resources page generates an incompatible resource file.
- Visual Basic resource files are wrapped in a second namespace.
- When adding an image or font to a resx file a reference to the drawing assembly is not automatically added.

### Porting

#### Changes
- Initial release of porting library and API.

#### Known Issues
- Marshalling strings does not work.
- Marshalling `DateTime` and `TimeSpan` does not work.
- Creating and replacing managed objects does not work.
- CAN and USB host are missing.
- The USB client API is still very rough and will change.

## [0.4.0 on 2017-05-10](http://ghielectronics.com/downloads/TinyCLR/TinyCLR.0.4.0.zip)

### Notes
This release primarily fixes several bugs; implements more of the serial API; adds `DataReader`, `DataWriter`, and `Marshal` classes; and reworks a lot of the BrainPad API. A new Storage library was added that moves some large members (like `DataReader`) out of Devices that you may not always needed. There is more to be added to this library down the road. `SignalGenerator`, `SignalCapture`, and `PulseFeedback` were renamed to match the Windows 10 counterparts. Their API will be updated to match as well in a future release.

The `Marshal` class under `System.Runtime.InteropServices` can be used like the old `Register` and `AddressSpace` classes to read and write memory. It also adds allocating and releasing unmanaged memory from the managed side that can be manipulated from the other members. 

You can see a quick example on using the new serial API [here](https://gist.github.com/anonymous/f26c82e463c397cd716c6fb807111913). You must use either the `DataReader` and `DataWriter` classes or use the `WindowsRuntimeBufferExtensions` to manipulate a `Buffer` since the internal array is no longer publicly accessible to match the UWP API. Pay attention to the `Load` and `Store` members. You can't read before calling `Load` and writes do not get flushed until you call `Store`.

There has been no change to the G120 and G400 bootloaders in this release so you do not need to update them if you already have them on your device from the 0.3.0 release.

After flashing the firmware for the first time on any device, Windows may still use the old NETMF USB IDs preventing the device from being seen by TinyCLR. Uninstall the device from the Device Manager and reinstall it to fix it. To update the firmware on pre-Windows 10 machines, you will need the bootloader drivers provided by our existing [2016 R1 NETMF SDK](https://www.ghielectronics.com/support/netmf/sdk/41/ghi-electronics-netmf-sdk-2016-r1).

### Libraries

#### Changes
- Fixed `GpioPin.ValueChanged` sender parameter type to be GpioPin.
- Fixed many of the `Debug` and `Trace` members not functioning properly.
- Fixed `LowLevelDevicesController.DefaultProvider` throwing an exception when null instead of falling back to the built-in providers.
- Fixed `SerialDevice.Read` not respecting the `ReadTimeout` value.
- Fixed `SerialDevice.BytesReceived` and `IBuffer.Length` not getting updated when reading.
- Fixed the exception that was thrown in `BrainPad.Buttons` when buttons are pressed.
- Fixed the exception that was thrown when using `BrainPad.ServoMotor`.
- Fixed PWM glicthing other pins on the same controller when changing one pin.
- Fixed `Thread.Sleep` not always sleeping for the proper amount of time.
- Fixed `SerialDevice.ErrorReceived` not being raised.
- Added `EventArgs`.
- Added `WindowsRuntimeBufferExtensions`.
- Added `DataReader` and `DataWriter`.
- Added various `From` methods to `TimeSpan`.
- Added `InteropServices.Marshal`.
- Added `EditorBrowsable` attribute to several members inherited from `object` to the BrainPad members.
- Added `GHIElectronics.TinyCLR.Storage` with `WindowsRuntimeBufferExtensions`, `DataReader`, and `DataWriter` in it.
- Updated the underlying value of the `SerialError` enum.
- Updated the BrainPad to be based around instance properties rather than static classes.
- Updated `SerialDevice.Read` to only support `InputStreamOptions.Partial` and `InputStreamOptions.None`.
- Moved `InputStreamOptions`, `IInputStream`, `IOutputStream`, `IBuffer`, and `Buffer` to the `GHIElectronics.TinyCLR.Core` assembly.
- Moved the BrainPad expansion pins to the pins library.
- Improved support for the original BrainPad in the driver.
- Improved many of the BrainPad APIs.
- Removed the members of `Buffer` that don't conform to the UWP API.
- Renamed `SignalGenerator` to `GpioChangeWriter`, `SignalCapture` to `GpioChangeReader`, and `PulseFeedback` to `GpioPulseReaderWriter`.

#### Known Issues
- The original BrainPad display does not currently work with the `GHIElectronics.TinyCLR.BrainPad` library.
- Software I2C can lock up the board if a slave device isn't connected or responds improperly.
- `ServoMotors.SetMaxPulseWidth` has an invalid range in the exception message.
- Formatting numbers that cross an assembly boundary can throw an exception.
- Opening a non-existent UART will only throw when it is used.
- Support for the embedded Visual Basic runtime is incomplete and some uses may throw cryptic compile errors.

### Firmware

#### Changes
- Fixed the G30 sometimes getting stuck during deployment.
- Added another sector to the G30 deployment region.

#### Known Issues
- Rapidly pressing the buttons on the BrainPad may corrupt the display.
- Gpio interrupts may be slow when Visual Studio is connected.
- Some frequencies may round up instead of down if the requested frequency cannot be met.
- An 0xA2000000 error is sent over the debug transport when there is no deployment present.
- `GpioChangeWriter` does not generate proper signals for periods above 50ms on G400.

### Extension

#### Changes
- Added a flag on the TinyCLR OS property page to control stub generation style.
- Added the `DebuggerNonUserCode` attribute to the startup code in BrainPad templates.
- Removed the `public` modifier from the C# application template.

#### Known Issues
- The Visual Basic BrainPad template has a semicolon in the startup file.
- The device may not load drivers on Windows 7 preventing Visual Studio from seeing it.
- Some uses of pattern matching may crash the C# compiler.
- Visual Basic resources page generates an incompatible resource file.
- Visual Basic resource files are wrapped in a second namespace.
- When adding an image or font to a resx file a reference to the drawing assembly is not automatically added.

## [0.3.0 on 2017-04-06](http://ghielectronics.com/downloads/TinyCLR/TinyCLR.0.3.0.zip)

### Notes
This release has several API additions. Some were added as features themselves (software SPI, SignalGenerator, etc) while others were added to support certain features (the VB runtime, string.Format, MemoryStream and IntPtr for Drawing, etc). We're working to align ourselves with the various [.NET Reference Sources](https://github.com/Microsoft/referencesource) available. You'll also see many new icons throughout, application templates for the BrainPad, and common item templates. The NuGet packages that have dependencies (such as on Core), now require the major and minor versions to match. For example, the 0.3.0 Devices library depends on Core [0.3.0,0.4.0). This is to further our use of SemVer so that the native interop checksum only changes in major and minor versions. See the [NuGet docs](https://docs.microsoft.com/en-us/nuget/create-packages/dependency-versions) for more information.

The biggest addition is the drawing library. It was designed to mirror System.Drawing from the desktop. The basic API is there but there is still more work to be done. To support this, a DisplayController was added to the devices library to configure the display. Since there is no config yet you need to configure the display every time your program starts. A notable change from NETMF is calling flush on a drawing surface the size of the display will no longer draw to the display. Only drawing surfaces created from the FromHdc method passing in the Hdc value from the DisplayController will flush to the display. At this time, only bmp images are supported. Make sure you add a reference to GHIElectronics.TinyCLR.Drawing if using bitmap or font resources. Since it's in NuGet now it isn't automatically added.

Support for Visual Basic has also been reenabled. One important thing to keep in mind is that there is no longer a Microsoft.VisualBasic assembly. We are using the embedded runtime option provided by Roslyn. It relies on several APIs being present in the core library. We added several of the key APIs needed to enable common usage scenarios. If you find you're getting cryptic compile errors from locations not in your code, let us know so we can evaluate what additional APIs are required.

Since the UWP API only supports a controller wide frequency, we had to rework PWM a little bit. There is no longer one controller like there is for GPIO, instead one controller exists for each frequency source. On devices like the G30 and G80, this is a timer. On devices like the G400, there are independent registers for each channel (so unfortunately there will be one controller per channel). The pins library has been updated to organize PwmPin around controllers. SignalGenerator, SignalCapture, and PulseFeedback have also been added, but their APIs will change in a future release to match the UWP style. You can also now change what gets returned by GetDefault calls on the various controllers by updating LowLevelDevicesController.DefaultProvider.

The Diagnostics namespace now matches the desktop version more closely. WriteLineIf and Assert were added to Debug and Trace was added as well. All methods on Debug and Trace are marked with the Conditional attribute as expected using the DEBUG and TRACE constants respectively. There's also now a Listeners property on each. This is a collection that you can add to so you can receive whatever is written to Trace or Debug by registering a class derived from TraceListener. As on the desktop, both Trace and Debug share the same listener collection. By default, the collection is populated with a listener that prints to the debug transport which is now at Debugger.Log. Collect and GetTotalMemory were added to GC. Note that GetTotalMemory returns the amount of memory used, not free, to match the desktop. We're investigating APIs to return the amount free.

The last notable change is that we implemented IntPtr and UIntPtr. For now, they're only used as the type of the Hdc property in drawing. We expect them to be used in more places going forward. Since these two types map to native int and native unsigned int in the CLR and the managed compilers emit those types when they encounter IntPtr or UIntPtr, we have also added initial support for those types in the interpreter and runtime as well. Let us know if you encounter any weird or hard to explain runtime issues.

This release also includes the firmware for the G400. It requires an updated bootloader from the one provided on the [G400 bootloader installation page](https://www.ghielectronics.com/docs/336/g400-bootloader-installation). Simply download the bootloader installer from the installation page and replace Bootloader.bin with the bootloader provided in the TinyCLR download package (making sure to rename it to Bootloader.bin). This updated bootloader can still be used to install the NETMF G400 firmware. It will eventually replace the one provided on the installation page.

After flashing the firmware for the first time on any device, Windows may still use the old NETMF USB IDs preventing the device from being seen by TinyCLR. Uninstall the device from the Device Manager and reinstall it to fix it. To update the firmware on pre-Windows 10 machines, you will need the bootloader drivers provided by our existing [2016 R1 NETMF SDK](https://www.ghielectronics.com/support/netmf/sdk/41/ghi-electronics-netmf-sdk-2016-r1).

You can see some examples of the new APIs added in this release [here](https://gist.github.com/anonymous/63595fe71b867356ce45f7489d7a85bc).

### Libraries

#### Changes
- PWM now has one controller per frequency source (usually a hardware timer) allowing different frequencies for each controller.
- string.Format should now work in all cases.
- Formatting numbers (ToString("N2"), etc) should now work in all cases.
- I2C read/write partial functions now return the proper result.
- Opening non-existent ports no longer crashes the firmware.
- CultureInfo, NumberFormatInfo, and DateTimeFormatInfo now implement IFormatProvider.
- Primitives (except Boolean), DateTime, TimeSpan, Guid, and Enum now implement IFormattable.
- Added the == and != operators to Guid.
- Added a drawing library and display configuration.
- Added Enum.GetUnderlyingType
- Added LowLevelDevicesController and the provider API model for SPI, I2C, GPIO.
- Added SignalGenerator, SignalCapture, and PulseFeedback.
- Added software providers for I2C and SPI.
- Added CompilerGenerated, SuppressMessage, and In attributes.
- Added class target to Conditional attribute.
- Added FormatException and OverflowException.
- Added InvariantCulture and CurrentCulture to CultureInfo.
- Added FormattableString and FormattableStringFactory.
- Added Collect and GetTotalMemory to GC.
- Added MemoryStream.
- Added parts of the CodeContracts namespace.
- Added implementations to IntPtr and UIntPtr.
- Added Debugger.Log.
- Added Trace.
- Added Assert and WriteLineIf to Debug.
- Added listeners collection to Trace and Debug and a default listener mapped to Debugger.Log.
- Added BrainPad.

#### Known Issues
- The sender parameter in the ValueChanged event on GpioPin is an instance of IGpioPinProvider, not GpioPin.
- Opening a non-existent UART will only throw when it is used.
- SignalGenerator may fail for small durations.
- An exception is thrown in BrainPad.Buttons when buttons are pressed.
- An exception is thrown when using BrainPad.ServoMotor.
- Some frequencies may round up instead of down if the requested frequency cannot be met.
- In the Debug class, only WriteLine(string) functions correctly.

### Firmware

#### Changes
- G30 should no longer get stuck at waiting for device to initialize.
- PWM no longer takes 40 seconds to start on the G30 and G80.
- GPIO interrupts now work on the G120E.
- Added support for native int and native unsigned int in runtime
- Added G400 firmware.

#### Known Issues
- Deploying to the G30 sometimes fails when writing a sector.
- An 0xA2000000 error is sent over the debug transport when there is no deployment present.

### Extension

#### Changes
- Assemblies larger than sector size can now be deployed.
- Added Visual Basic support.
- Added BrainPad Application templates
- Added common item templates.
- Added icons throughout.
- NuGet packages now have a better range dependency for dealing with assembly checksums.

#### Known Issues
- Visual Basic resources page generates an incompatible resource file.
- Visual Basic resource files are wrapped in a second namespace.
- Support for the embedded Visual Basic runtime is incomplete and some uses may throw cryptic compile errors.
- When adding an image or font to a resx file a reference to the drawing assembly is not automatically added.

## [0.2.0 on 2017-03-07](http://ghielectronics.com/downloads/TinyCLR/TinyCLR.0.2.0.zip)

### Notes
You cannot use projects you made for the 0.1.0 version. You must recreate them and re-add your code files because of the changes to the project templates to make them more closely align them with the desktop .NET templates -- you'll notice the only difference is a few properties which prevent inclusion of reference assemblies. The templates also use the .NET Framework 4.5.2 target framework. This is only for NuGet compatibility going forward and does not mean you can use other libraries targeting that framework. This was done in anticipation of broader project system support of the new PackageReference format currently used in .NET Core which fails with unknown target frameworks.

The MSBuild package is no longer provided or required. The metadata processor tool has moved internally to the extension and is invoked during deployment to the device. This means that pe and pdbx files are no longer redistributed with their assemblies -- they appear in a pe folder under the output directory when you deploy. We have also rewritten how dependencies are detected for deployment. If you notice any weird failures around assembly resolution or deployment, let us know and send us the entire project as-is so we can diagnose it.

The information displayed while deploying to the device has also been improved to show more information about what is going on and what stage the deployment is in. We've also reworked incremental deployment so that assemblies are deployed one to a flash sector (if space allows) to enable re-deploying only the assemblies that have changed on a sector by sector basis. This greatly increases deployment speed on devices which a large number of flash sectors allocated to deployment.

This release also includes the firmware for the G120 and G120E. Because the current GHI bootloader on the G120 expects to load TinyBooter, we have provided a second stage bootloader with this preview that you must deploy using the existing GHI bootloader as if you were deploying TinyBooter. Once it is deployed and you restart the device, you'll notice that it starts our newer [GHI bootloader 2.0](https://www.ghielectronics.com/docs/344/ghi-bootloader). You can then use this second bootloader to deploy the TinyCLR OS firmware. Asserting LDR0 will enter the second bootloader while asserting both LDR0 and LDR1 will enter the original bootloader and allow you to return to NETMF.

After flashing the firmware the first time, Windows may still use the old NETMF USB IDs preventing the device from being seen by TinyCLR. Uninstall the device from the Device Manager and reinstall it to fix it. To update the firmware on pre-Windows 10 machines, you will need the bootloader drivers provided by our existing [2016 R1 NETMF SDK](https://www.ghielectronics.com/support/netmf/sdk/41/ghi-electronics-netmf-sdk-2016-r1).

### Libraries

#### Changes
- Formatting numbers works in more cases.
- The built in "en" culture has been removed.
- The dependency on GHIElectronics.TinyCLR.MsBuild has been removed.
- The pe and pdbx files are no longer included with the package.
- The package now targets the NET452 TFM.
- The duty cycle and polarity can now be set when the PWM pin is stopped.
- The frequency for the PWM controller can now be set at any time.
- PwmController.SetDesiredFrequency and PwmController.ActualFrequency now return the actual frequency the device was able to meet.
- The min and max frequency for PWM is now returned correctly.
- Removed analog input and output precision.
- Added G120, G120E, and FEZ Cobra III.
- CAN bus definitions now return a friendly name instead of an integer.
- Renamed Gpio to GpioPin, AnalogInput to AdcChannel, AnalogOutput to DacChannel, and PwmOutput to PwmPin.
- The pe and pdbx files are no longer included with the package.
- The package now targets the NET452 TFM.

#### Known Issues
- Formatting numbers sometimes returns incorrect values.
- string.Format fails for non-trivial cases.
- There is only one PWM controller currently and since the Windows API has a controller-wide frequency, all PWM channels use the same frequency.
- Some frequencies may round up instead of down if the requested frequency cannot be met.

### Firmware

#### Changes
- Added G120/G120E firmware.
- Flushing over USB is quicker.
- GPIO interrupts are now raised reliably.
- The maximum allocation is now 51,539,607,484 bytes.

#### Known Issues
- PWM frequencies beyond 45MHz on G80 and 21MHz on G30 can fail.
- PWM may take up to a minute to start on G30 and G80.

### Extension

#### Changes
- Breakpoints and the commands dependent on them now function properly.
- References no longer need a solution reload to deploy.
- The GHIElectronics.TinyCLR.MsBuild package has been removed.
- PDBX and PE files are now generated at deploy time.
- The deployment progress log shows more information.
- Incremental deployment is now better about deploying only what has changed.
- Debugging stops quicker after all threads in the application exit.
- The project templates now mirror the desktop templates much more closely.
- The Visual Studio projects now target .NET Framework v4.5.2.

#### Known Issues
- Deploying an assembly larger than the flash sector size fails.
- An 0xA2000000 error will get sent over the debug transport whenever there is no app present.

## [0.1.0 on 2016-12-16](http://ghielectronics.com/downloads/TinyCLR/TinyCLR.0.1.0.zip)

### Known Issues
- After flashing the firmware the first time, Windows may still use the old NETMF USB IDs preventing the device from being seen by TinyCLR. Uninstall the device from the Device Manager and reinstall it to fix it.
- To update the firmware on pre-Windows 10 machines, you will need the bootloader drivers provided by our existing [2016 R1 NETMF SDK](https://www.ghielectronics.com/support/netmf/sdk/41/ghi-electronics-netmf-sdk-2016-r1).
- Breakpoints and the commands dependent on them (run to cursor, others) do not work. As a work around, add a class library project called mscorlib to your solution and add a project reference to it or insert calls to System.Diagnostics.Debugger.Break.
- References can fail to deploy unless a solution close and open occurs after adding the reference.
- Re-deploying immediately after stopping debugging can fail. Try again to work around it.
- There is only one PWM controller currently and since the Windows API has a controller-wide frequency, all PWM channels use the same frequency.
- PwmController.SetDesiredFrequency must be called before any call to PwmController.OpenPin.
- PwmPin.SetActiveDutyCyclePercentage must be called after Start.
- GPIO interrupts do not always trigger.
- PWM may take up to a minute to start.
- Formatting numbers yields incorrect results in some cases.
- string.Format fails for non-trivial cases.
- Only Core, Devices, and Pins libraries are available.
- Only G30 and G80 are available.
- Packages are not uploaded to the NuGet public gallery.

### Additions
- TimeSpan.Total*
- {int/long/double/...}.TryParse(string source, out value)
- string.Format(string format, param object[] args)
- System.Diagnostics.WriteLine(string message)