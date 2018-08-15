# Release Notes

## 1.0.0-preview1 on 2018-08-15

### Notes
This release is the first preview of the 1.0 release for TinyCLR. We will have at least one other preview after this one. The biggest change in this release is the rework and simplification of the devices library. It was divided into one library per peripheral to reduce deployment size for apps that don't require all libraries. We did keep the devices package as a metapackage that depends on the other packages so you can easily bring them all into your project if desired.

Many of the devices did keep a familiar API like ADC, DAC, and GPIO. Others like I2C and SPI did keep a similar device API but the controller was reworked. Previously you'd be able to call `FromId` on the device or controller object. Now you must call `FromName` on the controller and then call `GetDevice`. A few others had minor tweaks to names and members. Of particular note are that you must now call `Enable` to turn the display on and mounting with `FileSystem` now requires the `Hdc` property from the `SdCardController` instead of the controller instance itself.

UART saw a lot of changes in this release. The entire storage library was removed and the `SerialCommunication` class was changed into `UartController` to mirror the pattern used with all of the other devices. `DataReader` and `DataWriter` are gone as well, so reading and writing to UART can only be done with a byte array.

We also introduced a new native library that holds many of the things we added to `mscorlib` previously like interops, APIs, system time, `NativeEventDispatcher`, and, new in this release, power.

Given the amount of changes in the HAL layer we do expect a few more bugs in this release, but we are working to iron them all out before 1.0.

`.constrained` continues to throw in this release as we gather more data. It is currently known to be used when accessing overridden members on structs, particularly those from object like `ToString`, `Equals`, and `GetHashCode`. You'll encounter it on `enum` and `TimeSpan`, among others. We will be making a decision soon on whether or not to revert the exception before the final release.

In preparation for the official 1.0 release we are no longer building the firmwares for older unsupported devices. Please see [this doc](http://docs.ghielectronics.com/software/tinyclr/supported-devices.html) for more information. The source code remains available though so we invite you to contribute to it and build your own firmware. We have also uploaded the libraries to our [NuGet account](https://www.nuget.org/profiles/ghielectronics) and the VSIX to the [Visual Studio Marketplace](https://marketplace.visualstudio.com/publishers/ghielectronics). Make sure to enable finding prereleases in the Nuget package manager. We will still make them available on our own hosting as well, but the expected workflow going forward is the usual NuGet/Marketplace search and download process you have for other packages and extensions. You can find all downloads in their respective sections on the [downloads](downloads.md) page. As before you, can update your firmware using TinyCLR Config and now you can update your packages using the NuGet package manager from the online source. There are no new bootloaders in this release.

### Libraries

#### Changes
- Reworked the APIs of many of the peripherals in `GHIElectronics.TinyCLR.Devices` library, particularly UART.
- Split up the `GHIElectronics.TinyCLR.Devices` into one library per peripheral.
- Removed the `GHIElectronics.TinyCLR.Storage` library.
- Added a new `GHIElectronics.TinyCLR.Native` library and moved `SystemTime`, `Interop`, `Api`, and `DeviceInformation` to it.
- Added `Power` to `GHIElectronics.TinyCLR.Native`.
- Added `DrawPixel` to the display controller.
- Added `DrawBuffer` to the display controller.
- Added `Enable` and `Disable` to many controllers.
- Reworked `SystemTime` to have `GetTime` and `SetTime` with `DateTime` overloads.
- Reworked and simplified the entire provider model, removing many classes in the process.
- Renamed `OutputEnable` to `DataEnable` on `DisplayController`.
- Renamed `ApplySettings` to `SetConfiguration` on `DisplayController`.
- Renamed `PwmPin` to `PwmChannel`.
- Fixed `GetDirectories` always throwing [#343](https://github.com/ghi-electronics/TinyCLR-Ports/issues/343).
- Reduced the default brightness of the light bulb on the BrainPad.

#### Known Issues
- SPWF04Sx may sometimes lose writes.
- Support for the embedded Visual Basic runtime is incomplete and some uses may throw cryptic compile errors.
- A number of API names are missing from pins, notably RTC and SD.
- The `Edge` property of GPIO interrupts is not always correct.
- Many properties on `SignalGenerator` and `SignalCapture` do not work.
- `PulseFeedback` does not work.
- `SoftwareI2C` does not work [#365](https://github.com/ghi-electronics/TinyCLR-Ports/issues/365).
- `DisplayController.DrawBuffer` does not work with a non-zero origin or size different than the entire screen [#410](https://github.com/ghi-electronics/TinyCLR-Ports/issues/410).
- `DisplayController.DrawPixel` draws the incorrect color.
- The timestamp is incorrect when creating a new file.

### Firmware

#### Changes
- Fixed I2C sharing conflicts incorrectly throwing `OutOfMemoryException` [#298](https://github.com/ghi-electronics/TinyCLR-Ports/issues/298).
- Fixed `OutputEnablePolarity` being inverted on UC5550 [#315](https://github.com/ghi-electronics/TinyCLR-Ports/issues/315).
- Fixed some SD cards getting corrupt after use on G400 [#319](https://github.com/ghi-electronics/TinyCLR-Ports/issues/319).
- Fixed G120 getting stuck deploying [#331](https://github.com/ghi-electronics/TinyCLR-Ports/issues/331).
- Fixed CAN not working on G400 [#332](https://github.com/ghi-electronics/TinyCLR-Ports/issues/332).
- Fixed the run app pin not working on USBizi [#333](https://github.com/ghi-electronics/TinyCLR-Ports/issues/333).
- Fixed paths requiring an extra `\` after the drive letter [#334](https://github.com/ghi-electronics/TinyCLR-Ports/issues/334).
- Fixed the display on the G400 reserving PC26 [#336](https://github.com/ghi-electronics/TinyCLR-Ports/issues/336).
- Removed the SPI display controller implementation.

#### Known Issues
- PWM may jitter when decreasing the pulse length while enabled.
- UART handshaking may miss data on STM32F4.
- Testing `NaN`s for equality gives unexpected results.
- `SignalGenerator` and `SignalCapture` do not work on UC2550 and UC5550.
- The UD700 will become corrupted after running for a few minutes on the UC5550.
- Using exception filters may crash the system in some uses [#177](https://github.com/ghi-electronics/TinyCLR-Ports/issues/177).
- Software SPI does not work with some devices [#293](https://github.com/ghi-electronics/TinyCLR-Ports/issues/293).
- During multi-pin reservations if a later pin fails to reserve, previously reserved ones are not released [#312](https://github.com/ghi-electronics/TinyCLR-Ports/issues/312).
- Filesystem is not available on G30 [#322](https://github.com/ghi-electronics/TinyCLR-Ports/issues/322).
- The ADC is not accurate on the G400 [#373](https://github.com/ghi-electronics/TinyCLR-Ports/issues/373).
- Many events do not pass a timestamp [#368](https://github.com/ghi-electronics/TinyCLR-Ports/issues/368).
- Many of the non-essential functions of USB client are not implemented [#398](https://github.com/ghi-electronics/TinyCLR-Ports/issues/398).
- Using UART may eventually lockup the UC5550 [#411](https://github.com/ghi-electronics/TinyCLR-Ports/issues/411).

### TinyCLR Config

#### Changes
- Allowed the app to be resized.

#### Known Issues
- None.

### Extension

#### Changes
- None.

#### Known Issues
- When adding an image or font to a resx file a reference to the drawing assembly is not automatically added.

### Porting

#### Changes
- Simplified many of the controller APIs.
- Removed the controller number from the various controllers.
- Renamed many instances of provider to manager or controller.
- Updated to use the latest GCC.
- Removed `Acquire` and `Release` from core-provided APIs.
- Changed to an initialize and uninitialize pattern for required APIs.
- Added `InteropManager` to `TinyCLR_Interop_MethodData`.
- Merged `DeploymentProvider` and `SdCardProvider`.
- Changed specifying the deployment API to a dedicated function call.
- Changed `InteropManager::GetArgument` to start at index 0 for all arguments, regardless of instance or static.

#### Known Issues
- The linker will not error when regions overflow or overlap [#30](https://github.com/ghi-electronics/TinyCLR-Ports/issues/30).

## 0.12.0 on 2018-07-05

### Notes
This release adds support for gif images, a WPF-like UI library used to build graphical user interfaces, and an SD card driver and associated FAT filesystem. There are also a number of other small API additions and changes to Graphics and the BrainPad. 

We're also distributing the interop definition headers for all of our libraries so that you can interact with them from native code you may write. Keep in mind that the fields are often private members to the class, so are regarded as implementation details that may change between release.

One important note for creators of native APIs, the `Implementation` parameter was changed so that it is only ever a pointer to a single instance. It no longer points to an array if `Count` is more than one and, in fact, the `Count` parameter was removed completely since it's only ever one or `nullptr` now. As part of this, we added a controller parameter to many functions such as UART and I2C.

`.constrained` continues to throw in this release as we gather more data. It is currently known to be used when accessing overridden members on structs, particularly those from object like `ToString`, `Equals`, and `GetHashCode`. You'll encounter it on `enum` and `TimeSpan`, among others.

As before, you can find all downloads in their respective sections on the [downloads](downloads.md) page. Just download the new installers and NuGet packages to get going. You don't even need to download the firmwares since you can use the update firmware feature in TinyCLR Config to automatically download them for you. There are no new bootloaders in this release.

### Libraries

#### Changes
- Changed return values of the BrainPad accelerometer to -100 to 100 for -1g to 1g.
- Capped return values in BrainPad accelerometer to 1g.
- Marked `SystemTime.SetTime` as not CLS-compliant.
- Added `EnableFullRange` to BrainPad accelerometer to control returning more than 1g.
- Added `GraphicsUnit` to `Font` and `Graphics`.
- Added `Expansion` to the BrainPad library.
- Added SD and Filesystem to the IO library.
- Added more overloads of `DrawString` and `DrawImage` to `Graphics`.
- Added `Graphics.MeasureString`.
- Added `Font.Height`.
- Added a UI library.

#### Known Issues
- SPWF04Sx may sometimes lose writes.
- Support for the embedded Visual Basic runtime is incomplete and some uses may throw cryptic compile errors.
- Software SPI does not work with some devices [#293](https://github.com/ghi-electronics/TinyCLR-Ports/issues/293).
- I2C sharing conflicts incorrectly throw `OutOfMemoryException` [#298](https://github.com/ghi-electronics/TinyCLR-Ports/issues/298).

### Firmware

#### Changes
- Added gif image format support.
- Fixed interrupts crashing the system after some time on UC2550 and UC5550.
- Fixed the firmware getting erased when using SPI1 on the G120 [#294](https://github.com/ghi-electronics/TinyCLR-Ports/issues/294).
- Fixed opening one CAN reserving all other CAN pins [#296](https://github.com/ghi-electronics/TinyCLR-Ports/issues/296).
- Fixed default debounce time to 20ms [#313](https://github.com/ghi-electronics/TinyCLR-Ports/issues/313).

#### Known Issues
- Many UART properties and events are not implemented.
- PWM may jitter when decreasing the pulse length while enabled.
- UART handshaking may miss data on STM32F4.
- Testing `NaN`s for equality gives unexpected results.
- Filesystem is not available on G30.
- The linker will not error when regions overflow or overlap [#30](https://github.com/ghi-electronics/TinyCLR-Ports/issues/30).
- The run app pin doesn't work on USBizi [#33](https://github.com/ghi-electronics/TinyCLR-Ports/issues/33).
- Using exception filters may crash the system in some uses [#177](https://github.com/ghi-electronics/TinyCLR-Ports/issues/177).
- During multi-pin reservations if a later pin fails to reserve, previously reserved ones are not released [#312](https://github.com/ghi-electronics/TinyCLR-Ports/issues/312).
- `OutputEnablePolarity` is inverted on UC5550 [#315](https://github.com/ghi-electronics/TinyCLR-Ports/issues/315).
- Some SD cards are corrupt after use on G400 [#319](https://github.com/ghi-electronics/TinyCLR-Ports/issues/319).
- G120 can get stuck deploying [#331](https://github.com/ghi-electronics/TinyCLR-Ports/issues/331).
- CAN does not work on G400 [#332](https://github.com/ghi-electronics/TinyCLR-Ports/issues/332).

### TinyCLR Config

#### Changes
- None.

#### Known Issues
- None.

### Extension

#### Changes
- Added `Expansion` to the BrainPad helper template.

#### Known Issues
- When adding an image or font to a resx file a reference to the drawing assembly is not automatically added.

### Porting

#### Changes
- Added `GetControllerCount` to many providers.
- Changed how providers are registered in native to only take a single pointer to an implementation instead of optionally an array.
- Added interop definitions for our libraries.

#### Known Issues
- None.

## 0.11.0 on 2018-05-10

### Notes
This release fixed a number of bugs, improved the BrainPad display API, added a number of methods to the porting API, and completely reworked the native USB client API. We also moved graphics out of the core library so it's now much leaner which helps small devices like the G30.

`.constrained` continues to throw in this release as we gather more data. It is currently known to be used when accessing overridden members on structs, particularly those from object like `ToString`, `Equals`, and `GetHashCode`.

As before, you can find all downloads in their respective sections on the [downloads](downloads.md) page. Just download the new installers and NuGet packages to get going. You don't even need to download the firmwares since you can use the update firmware feature in TinyCLR Config to automatically download them for you. There are no new bootloaders in this release.

### Libraries

#### Changes
- Added a pins library for the UCM standard.
- Fixed the range of values the BrainPad temperature returns.
- Fixed disposing of the underlying image when disposing graphics.
- Fixed another case that would cause `Thread.ManagedThreadId` to get lost.
- Renamed `ShowOnScreen` to `RefreshScreen` and `ClearScreen` to `Clear` in BrainPad.
- Removed the various `AndShowOnScreen` methods in BrainPad.

#### Known Issues
- SPWF04Sx may sometimes lose writes.
- Support for the embedded Visual Basic runtime is incomplete and some uses may throw cryptic compile errors.
- Software SPI does not work with some devices [#293](https://github.com/ghi-electronics/TinyCLR-Ports/issues/293).

### Firmware

#### Changes
- Added RTC to Cerberus [#263](https://github.com/ghi-electronics/TinyCLR-Ports/issues/263).
- Added RTC to G30 and FEZCLR [#228](https://github.com/ghi-electronics/TinyCLR-Ports/issues/228).
- Fixed RTC crashing the G400 and FEZHydra [#260](https://github.com/ghi-electronics/TinyCLR-Ports/issues/260).
- Fixed ADC11 being mapped incorrectly on STM32F7 [#261](https://github.com/ghi-electronics/TinyCLR-Ports/issues/261).
- Fixed opening the debugger UART not throwing an exception when in UART debug mode [#259](https://github.com/ghi-electronics/TinyCLR-Ports/issues/259).
- Fixed pins not always being acquired or released in the HAL [#258](https://github.com/ghi-electronics/TinyCLR-Ports/issues/258).
- Fixed all GPIO getting reset when opening the GPIO controller [#256](https://github.com/ghi-electronics/TinyCLR-Ports/issues/256).
- Fixed errors from the HAL side not always surfacing in managed code.
- Fixed flushing a large screen locking up the device.
- Implemented UART error events for AT and ST.

#### Known Issues
- Many UART properties and events are not implemented.
- PWM may jitter when decreasing the pulse length while enabled.
- UART handshaking may miss data on STM32F4.
- Testing `NaN`s for equality gives unexpected results.
- The linker will not error when regions overflow or overlap [#30](https://github.com/ghi-electronics/TinyCLR-Ports/issues/30).
- Using exception filters may crash the system in some uses [#177](https://github.com/ghi-electronics/TinyCLR-Ports/issues/177).
- Using SPI1 on G120 may corrupt the flash [#294](https://github.com/ghi-electronics/TinyCLR-Ports/issues/294).
- Use of CAN causes all pins for all CAN busses to be reserved [#296](https://github.com/ghi-electronics/TinyCLR-Ports/issues/296).

### TinyCLR Config

#### Changes
- Minor improvements and fixes.

#### Known Issues
- None.

### Extension

#### Changes
- Added a dependency to the VSIX to ensure .NET v4.5.2 is present.
- Added `BrainPad Helper` item template.
- Removed the `BrainPad Application` project template.

#### Known Issues
- When adding an image or font to a resx file a reference to the drawing assembly is not automatically added.

### Porting

#### Changes
- Added `ClearReadBuffer` and `ClearWriteBuffer` to UART.
- Added `GetUnreadCount` and `GetUnwrittenCount` to UART.
- Added `GetUnwrittenMessageCount` and `ClearWriteBuffer` to CAN.
- Changed GPIO debounce time to ticks.
- Cleaned and overhauled the USB client API.
- Moved the graphics interop out of the core library.

#### Known Issues
- None.

## 0.10.0 on 2018-04-05

### Notes
This release fixes a number of bugs including some that caused lockup during debugging and deployment. We added RTC to many devices and also added a target for the STM32F7 in the ports repo that we will maintain.

`.constrained` continues to throw in this release as we gather more data. We have not found any other common cases beyond `ToString` on an enum.

Lastly, the time provider for firmwares was split up into a native and system time provider. The core now exposes a system time provider that you can consume to get and set the current system time (this is also exposed in managed). The existing provider was repurposed to simply provide the native tick count, convert it to system time, and delay.

As before, you can find all downloads in their respective sections on the [downloads](downloads.md) page. Just download the new installers and NuGet packages to get going. You don't even need to download the firmwares since you can use the update firmware feature in TinyCLR Config to automatically download them for you. There are no new bootloaders in this release.

### Libraries

#### Changes
- Added a method to set the system time in `System.Runtime.InteropServices.SystemTime`.
- Fixed `Thread` not overriding `GetHashCode`.
- Fixed `Thread.ManagedThreadId` getting corrupted.
- Fixed partially transparent ellipses having weird artifacts.

#### Known Issues
- SPWF04Sx may sometimes lose writes.
- Support for the embedded Visual Basic runtime is incomplete and some uses may throw cryptic compile errors.
- Pins are not currently reserved so you can create multiple objects on the same pin which behave incorrectly.

### Firmware

#### Changes
- Added CAN to USBizi [#114](https://github.com/ghi-electronics/TinyCLR-Ports/issues/114).
- Added support for repeated start in I2C for the AT91 targets [#55](https://github.com/ghi-electronics/TinyCLR-Ports/issues/55).
- Added an STM32F7 target.
- Added UC2550 and UC5550 firmwares.
- Improved resetting peripherals during soft reset [#247](https://github.com/ghi-electronics/TinyCLR-Ports/issues/247).
- Moved some deployment logic out of flash drivers [#187](https://github.com/ghi-electronics/TinyCLR-Ports/issues/187).
- Fixed the firmware crashing during soft reset if a CAN or UART port is open [#249](https://github.com/ghi-electronics/TinyCLR-Ports/issues/249).
- Fixed being unable to deploy a second time if SPI is used in the application on G120 or G400 [#208](https://github.com/ghi-electronics/TinyCLR-Ports/issues/208).
- Fixed being unable to deploy a second time if CAN is used in the application on G80 [#200](https://github.com/ghi-electronics/TinyCLR-Ports/issues/200).
- Fixed UART and CAN buffer sizes returning zero if they were not previously set [#203](https://github.com/ghi-electronics/TinyCLR-Ports/issues/203). and [#199](https://github.com/ghi-electronics/TinyCLR-Ports/issues/199).
- Fixed some devices freezing if receiving too many messages over CAN after setting the buffer size [#201](https://github.com/ghi-electronics/TinyCLR-Ports/issues/201).
- Fixed the display memory not clearing during soft reset [#198](https://github.com/ghi-electronics/TinyCLR-Ports/issues/198).
- Fixed the ADC being slightly inaccurate on G80 [#45](https://github.com/ghi-electronics/TinyCLR-Ports/issues/45).
- Fixed the LCD on the EMM sometimes not working [#168](https://github.com/ghi-electronics/TinyCLR-Ports/issues/168).
- Fixed the LCD having a blue tint on EMX and EMM [#29](https://github.com/ghi-electronics/TinyCLR-Ports/issues/29).
- Fixed PWM 3.27 not working on EMM [#41](https://github.com/ghi-electronics/TinyCLR-Ports/issues/41).
- Fixed ADC6 and ADC7 not working on USBizi [#40](https://github.com/ghi-electronics/TinyCLR-Ports/issues/40).
- Fixed the firmware crashing on USBizi during debugging [#43](https://github.com/ghi-electronics/TinyCLR-Ports/issues/43).
- Fixed resetting the ADC provider resetting ADC pins that aren't in ADC mode.
- Fixed the USBizi sometimes failing to deploy.
- Fixed some frequencies rounding up on the G120 and G400.

#### Known Issues
- Many UART properties and events are not implemented.
- PWM may jitter when decreasing the pulse length while enabled.
- UART handshaking may miss data on STM32F4.
- Testing `NaN`s for equality gives unexpected results.
- The linker will not error when regions overflow or overlap [#30](https://github.com/ghi-electronics/TinyCLR-Ports/issues/30).
- Using exception filters may crash the system in some uses [#177](https://github.com/ghi-electronics/TinyCLR-Ports/issues/177).
- RTC does not work on Cerb [#263](https://github.com/ghi-electronics/TinyCLR-Ports/issues/263).
- RTC does not work on G400 or FEZHydra [#260](https://github.com/ghi-electronics/TinyCLR-Ports/issues/260).
- RTC does not work on G30 or FEZCLR [#228](https://github.com/ghi-electronics/TinyCLR-Ports/issues/228).
- ADC11 does not work on the STM32F7 target [#261](https://github.com/ghi-electronics/TinyCLR-Ports/issues/261).
- All GPIO are reset when the controller is acquired [#256](https://github.com/ghi-electronics/TinyCLR-Ports/issues/256).

### TinyCLR Config

#### Changes
- Added manufacturer name display.

#### Known Issues
- None.

### Extension

#### Changes
- Fixed debugging in VS sometimes pausing forever until you manually break [#42](https://github.com/ghi-electronics/TinyCLR-Ports/issues/42).

#### Known Issues
- When adding an image or font to a resx file a reference to the drawing assembly is not automatically added.

### Porting

#### Changes
- Added an RTC provider.
- Added a system time provider.
- Reworked the existing time provider to only be a native time provider.
- Removed `DelayNoInterrupt` and `GetInitialTime` from the time provider.
- Fixed getting the value of a `DateTime` for return in interops.
- Enabled deployment regions to be discontiguous.

#### Known Issues
- The USB host API is missing.
- The USB client API is still very rough and will change.

## 0.9.0 on 2018-03-01

### Notes
This release adds a number of new features. We've also worked to reduce the frequency of crashing during deployment and greatly improved the performance of the SPWF04Sx and how it handles low memory situations.

We also re-added the `IO`, `Networking`, and `HTTP` libraries in this release. These contain the old `FileStream`, `HttpWebRequest`, `Socket`, and `SslStream` classes from before. However, there is no native file system or networking support still. Instead, we've added managed hooks that allow you to provide your own file and networking implementation. Take a look at `DriveInfo.RegisterDriverProvider` and `NetworkInterface.RegisterNetworkInterface` to get going. `DriveInfo` expects an instance of an interface that provides the required file IO operations. `NetworkInterface` expects an instance of itself. It will be used for the respective network operations if it implements `ISocketProvider`, `IDnsProvider`, or `ISslStreamProvider` interfaces. The SPWF04Sx driver was updated to implement these interfaces.

All devices now also have a native SPI display provider that is used just like the existing parallel displays. On a `DisplayController` created for the SPI native API, call `ApplySettings` with an instance of `SpiDisplayControllerSettings`. Then just create an instance of `Graphics` like previously. Some displays, like the N18, require certain configuration before flushing data, so make sure to do that yourself before calling `Flush`. It's also expected that you initialize the display itself as well.

Relatedly, we also added `WriteString` to the display controller. This allows you to write directly to the display in a console format, without needing a font, if the display provider supports it (which our current parallel display provider does). It's useful for quick debug logging.

One minor added function is `MethodBase.GetParameters`. It can be used to get the types and positions of parameters for any function (but not the parameter name). This is useful for scenarios like dependency injection.

We have changed the core so that any time the `.constrained` IL prefix is executed, a not-supported instruction is thrown. We noticed a case where it was being generated again so we added this exception to try and catch more cases. Since it is currently not implemented in the firmware, simply ignoring the prefix can corrupt your program. Please let us know if you encounter this exception. We'll evaluate keeping the exception in depending on the frequency it occurs. The one case we have found so far is calling `ToString` on an enum. To work around it, cast your enum to its underlying type (usually `int`) first since we do not support getting names in this way anyway. See [this forum thread](https://forums.ghielectronics.com/t/char-concat/4777) for more information.

Lastly, we've enabled support for anyone to provide NuGet packages for satellite assemblies of our `mscorlib` that contain the `CultureInfo` for a desired localization. While we do not provide any ourselves, take a look at the [NuGet docs](https://docs.microsoft.com/en-us/nuget/create-packages/creating-localized-packages) for more information.

As before, you can find all downloads in their respective sections on the [downloads](downloads.md) page. Just download the new installers and NuGet packages to get going. You don't even need to download the firmwares since you can use the update firmware feature in TinyCLR Config to automatically download them for you. There are no new bootloaders in this release.

### Libraries

#### Changes
- Added `DisplayController.WriteString`.
- Added an `IO` library.
- Added a `Networking` library with `Socket`, `SslStream`, and `HTTP`.
- Added `MethodBase.GetParameters`.
- Added `Type` to `DisplayController`.
- Renamed `LcdControllerSettings` to `ParallelDisplayControllerSettings`.
- Reworking entire SPWF04Sx driver to be more performant and less memory sensitive.
- `ResourceManager` now detects if the culture changes after initialization.
- Culture info can be found in user provided satellite assemblies of `mscorlib`.

#### Known Issues
- SPWF04Sx may sometimes lose writes.
- `Thread` does not override `GetHashCode`.
- `Thread.ManagedThreadId` may return zero.
- Partially transparent ellipses have weird artifacts.
- Support for the embedded Visual Basic runtime is incomplete and some uses may throw cryptic compile errors.
- Pins are not currently reserved so you can create multiple objects on the same pin which behave incorrectly.

### Firmware

#### Changes
- Added a native SPI display driver.
- The `.constrained` IL prefix throws a not supported instruction exception.
- The run app pin now works on USBizi [#39](https://github.com/ghi-electronics/TinyCLR-Ports/issues/39).
- Attempting to use handshaking when it is not available now throws an exception [#175](https://github.com/ghi-electronics/TinyCLR-Ports/issues/175).
- Reduced frequency of an internal error during deployment when low on memory.
- Reduced frequency of crashing on deployment when low on memory.

#### Known Issues
- Many UART properties and events are not implemented.
- PWM may jitter when decreasing the pulse length while enabled.
- Deploying on USBizi sometimes fails. Reset the board and try again to work around it.
- The LCD on EMM sometimes does not work.
- UART handshaking may miss data on STM32F4.
- Testing `NaN`s for equality gives unexpected results.
- The LCD has a blue tint on EMX and EMM [#29](https://github.com/ghi-electronics/TinyCLR-Ports/issues/29).
- The linker will not error when regions overflow or overlap [#30](https://github.com/ghi-electronics/TinyCLR-Ports/issues/30).
- ADC 6 and 7 do not work on USBizi [#40](https://github.com/ghi-electronics/TinyCLR-Ports/issues/40).
- PWM on 3.27 does not work on EMM [#41](https://github.com/ghi-electronics/TinyCLR-Ports/issues/41).
- Debugging in VS with USBizi crashes the firmware sometimes [#43](https://github.com/ghi-electronics/TinyCLR-Ports/issues/43).
- The ADC on G80 may be slightly inaccurate [#45](https://github.com/ghi-electronics/TinyCLR-Ports/issues/45).
- CAN is not present on USBizi [#114](https://github.com/ghi-electronics/TinyCLR-Ports/issues/114).
- Using exception filters may crash the system in some uses [#177](https://github.com/ghi-electronics/TinyCLR-Ports/issues/177).
- The display is not cleared on soft reset [#198](https://github.com/ghi-electronics/TinyCLR-Ports/issues/198).
- `GetWriteBufferSize` returns the wrong value until `SetWriteBufferSize` is called for CAN [#199](https://github.com/ghi-electronics/TinyCLR-Ports/issues/199).
- Deployment fails the second time if using CAN [#200](https://github.com/ghi-electronics/TinyCLR-Ports/issues/200).
- After changing the receive buffer size, CAN may crash if it receives too many messages [#201](https://github.com/ghi-electronics/TinyCLR-Ports/issues/201).
- `GetWriteBufferSize` returns the wrong value until `SetWriteBufferSize` is called for UART [#203](https://github.com/ghi-electronics/TinyCLR-Ports/issues/203).

### TinyCLR Config

#### Changes
- Erasing and loading the app now properly refreshes the assembly list.
- Added function to the loader interface that will update to the latest firmware regardless of the version on device.

#### Known Issues
- Many features will not function with devices running firmwares before 0.6.0.

### Extension

#### Changes
- Fixed the `#` character in a project's path preventing deployment.

#### Known Issues
- When adding an image or font to a resx file a reference to the drawing assembly is not automatically added.
- Debugging in VS sometimes pauses forever until you manually break [#42](https://github.com/ghi-electronics/TinyCLR-Ports/issues/42).

### Porting

#### Changes
- Added `TinyCLR_Display_Provider::GetCapabilities`.
- Removed the `interop` parameter from `TinyCLR_Can_MessageReceivedHandler` and `TinyCLR_Can_ErrorReceivedHandler`.
- Reordered members in `TinyCLR_Api_Info`.
- Reworked `TinyCLR_Display_Provider::SetLcdConfiguration` and other members to a generic `SetConfiguration` that takes a new `TinyCLR_Display_ParallelConfiguration` or `TinyCLR_Display_SpiConfiguration`.
- Renamed `TinyCLR_Display_Format` to `TinyCLR_Display_DataFormat`.
- Renamed `TinyCLR_UsbClient_StreamMode` to `TinyCLR_UsbClient_PipeMode`.
- Moved external flash drivers out of targets [#58](https://github.com/ghi-electronics/TinyCLR-Ports/issues/58).
- Updated many of the names of the targets.

#### Known Issues
- The USB host API is missing.
- The USB client API is still very rough and will change.

## 0.8.0 on 2018-02-01

### Notes
This release adds a firmware and bootloader for the FEZ Hydra, a driver for the SPWF04Sx Wi-Fi module from STMicroelectronics, and a build of the core for Cortex-M7 based devices. We've also updated to the latest GCC and CMSIS builds, so be sure to visit the [porting](native/porting.md) page to ensure you have the latest if you build your own firmware.

Also added are overloads to the various SPI and I2C write and read functions that take an offset and a count so you no longer need to pass exact sized buffers. The previous overloads still exist for compatibility  with UWP. While they're not yet exposed in managed code publicly, UART and CAN now allow you to customize the size of the read and write buffer for each port to suit your needs.

Additionally, we've also added `GetString` to the Encoding class (as before, only UTF8 is provided by default). It takes a byte array so you can create a string without having to use an intermediate char array, potentially wasting space. Additionally, since strings are represented as UTF8 internally, you can save on having your already-UTF8 `byte[]` converted to UTF16 when it's converted to `char[]`, then back to UTF8 when using that `char[]` to create a string.

To get started with the FEZ Hydra, you'll need to install the GHI Bootloader. Follow [these steps](../../hardware/gadgeteer/fez-hydra.md#using-tinyclr-os) to get going.

As before, you can find all downloads in their respective sections on the [downloads](downloads.md) page. Just download the new installers and NuGet packages to get going. You don't even need to download the firmwares since you can use the update firmware feature in TinyCLR Config to automatically download them for you.

### Libraries

#### Changes
- Added `Encoding.GetString`.
- Added `string.IsNullOrEmpty`.
- Added the non-generic `System.Action` delegate.
- Added various overloads to I2C and SPI write and read that take an offset and count.
- Added the Wi-Fi pins to the `FEZ` pins class.
- Added the missing I2C on Cerb socket 1 pins.
- Added driver for STMicroelectronics SPWF04Sx Wi-Fi module.
- Fixed offset in CAN `WriteMessages` having no effect.
- Fixed `PwmController.ActualFrequency` never being set.

#### Known Issues
- Partially transparent ellipses have weird artifacts.
- Support for the embedded Visual Basic runtime is incomplete and some uses may throw cryptic compile errors.
- Pins are not currently reserved so you can create multiple objects on the same pin which behave incorrectly.
- Large responses for `HttpGet` and `HttpPost` on SPWF04Sx will overflow the internal buffer.
- `SpiDevice::TransferFullDuplex` requires same-sized arrays to function correctly.

### Firmware

#### Changes
- Added FEZ Hydra.
- Added ADC 16 and 17 to STM32F4 [#130](https://github.com/ghi-electronics/TinyCLR-Ports/issues/130).
- Improved native SPI driver stability [#128](https://github.com/ghi-electronics/TinyCLR-Ports/issues/128).
- Changed CAN and UART default buffer sizes to be per-port [#154](https://github.com/ghi-electronics/TinyCLR-Ports/issues/154).
- Fixed I2C on LPC24 based devices failing after soft reset [#164](https://github.com/ghi-electronics/TinyCLR-Ports/issues/164).
- Fixed most frequencies on many PWMs not working on LPC17 and LPC24 [#144](https://github.com/ghi-electronics/TinyCLR-Ports/issues/144).
- Fixed handshaking on UART2 for LPC17 and LPC24 not working [#143](https://github.com/ghi-electronics/TinyCLR-Ports/issues/143).
- Fixed PWM on PB6 and PB7 not working on the G30 [#141](https://github.com/ghi-electronics/TinyCLR-Ports/issues/141).
- Fixed PWM not stopping on soft reset on the AT91 [#137](https://github.com/ghi-electronics/TinyCLR-Ports/issues/137).
- Fixed UART6 on Cerb being mapped incorrectly.

#### Known Issues
- An internal error may sometimes occur during deployment. Reset the board, cancel deployment, and try again to work around it.
- Many UART properties and events are not implemented.
- Deploying over USB when out of memory crashes the board.
- PWM may jitter when decreasing the pulse length while enabled.
- Deploying on USBizi sometimes fails. Reset the board and try again to work around it.
- The LCD on EMM sometimes does not work.
- UART handshaking may miss data on STM32F4.
- Testing `NaN`s for equality gives unexpected results.
- The LCD has a blue tint on EMX and EMM [#29](https://github.com/ghi-electronics/TinyCLR-Ports/issues/29).
- The linker will not error when regions overflow or overlap [#30](https://github.com/ghi-electronics/TinyCLR-Ports/issues/30).
- The run app pin does not work on USBizi [#39](https://github.com/ghi-electronics/TinyCLR-Ports/issues/39).
- ADC 6 and 7 do not work on USBizi [#40](https://github.com/ghi-electronics/TinyCLR-Ports/issues/40).
- PWM on 3.27 does not work on EMM [#41](https://github.com/ghi-electronics/TinyCLR-Ports/issues/41).
- Debugging in VS with USBizi crashes the firmware sometimes [#43](https://github.com/ghi-electronics/TinyCLR-Ports/issues/43).
- The ADC on G80 may be slightly inaccurate [#45](https://github.com/ghi-electronics/TinyCLR-Ports/issues/45).
- CAN is not present on USBizi [#114](https://github.com/ghi-electronics/TinyCLR-Ports/issues/114).
- `Debug.WriteLine` sometimes does not output anything [#173](https://github.com/ghi-electronics/TinyCLR-Ports/issues/173).
- Trying to use handshaking on a UART port that doesn't support it does not throw an exception [#175](https://github.com/ghi-electronics/TinyCLR-Ports/issues/175).

### TinyCLR Config

#### Changes
- Fixed the assembly list not clearing during reboot.

#### Known Issues
- Many features will not function with devices running firmwares before 0.6.0.

### Extension

#### Changes
- Fixed the list of assemblies after erase being populated with garbage.
- Fixed strings in the debugger longer than 128 characters displaying as garbage [#169](https://github.com/ghi-electronics/TinyCLR-Ports/issues/169).

#### Known Issues
- When adding an image or font to a resx file a reference to the drawing assembly is not automatically added.
- Debugging in VS sometimes pauses forever until you manually break [#42](https://github.com/ghi-electronics/TinyCLR-Ports/issues/42).

### Porting

#### Changes
- Added Cortex-M7 build.
- Added `length` parameter to `TinyCLR_Display_Provider::WriteString`.
- Added `length` parameter to `TinyCLR_Interop_Provider::CreateString`.
- Added `TinyCLR_Debugger_Provider::Log`.
- Added members to the native CAN and UART providers to control the buffer sizes.
- Renamed `TinyCLR_Startup_SetDebugger` to `TinyCLR_Startup_SetDebuggerTransportProvider`.
- Updated to latest CMSIS.
- Updated to latest GCC.

#### Known Issues
- The USB host API is missing.
- The USB client API is still very rough and will change.

## 0.7.0 on 2018-01-04

### Notes
This release adds CAN support to many devices. The managed API reflects the UWP provider model, but there are more changes to come. We've also fixed the issue in the latest Visual Studio 15.5 update that prevents projects from building along with many other firmware level bugs. For best results with the 15.5 fix, you should either recreate your projects or remove the `NoStdLib` and `AddAdditionalExplicitAssemblyReferences` properties from your csproj (or vbproj).

There have been several changes around the interop API in this release that makes it easier to interact with managed arguments, fields, and objects including reading, writing, creation, and reassignment. You can find an updated basic example on the [interop docs](native/interops.md). There was also a field added to the API info object that allows the API author to track custom state based on their needs.

As before, you can find all downloads in their respective sections on the [downloads](downloads.md) page. There are no new bootloader releases this time. Just download the new installers and NuGet packages to get going. You don't even need to download the firmwares since you can use the update firmware feature in TinyCLR Config to automatically download them for you.

### Libraries

#### Changes
- Added CAN provider.
- Added CAN and USB to pins.
- Fixed builds failing in the latest Visual Studio 15.5 update.
- Fixed some `DataWriter` not always growing the internal buffer enough causing it to throw.
- Fixed many errors and inconsistencies in pins.
- Updated the `ResourceManager` API to match the desktop more closely.
- Changed `mscorlib.targets` to props so it gets included first and also registered it with `MSBuildAllProjects`.

#### Known Issues
- Partially transparent ellipses have weird artifacts.
- Support for the embedded Visual Basic runtime is incomplete and some uses may throw cryptic compile errors.
- Pins are not currently reserved so you can create multiple objects on the same pin which behave incorrectly.
- `PwmController.ActualFrequency` is always 0.

### Firmware

#### Changes
- Fixed `GpioChangeWriter` generating an incorrect signal for periods above 50ms on G400.
- Fixed min and max clock values for SPI.
- Fixed debugging G120 through serial not working [#34](https://github.com/ghi-electronics/TinyCLR-Ports/issues/34).
- Fixed UART3 and UART4 not working on G120 [#35](https://github.com/ghi-electronics/TinyCLR-Ports/issues/35).
- Fixed non-blocking `GpioChangeWriter` not working on NXP devices [#36](https://github.com/ghi-electronics/TinyCLR-Ports/issues/36).
- Fixed the last two PWM being missing on Cerb [#37](https://github.com/ghi-electronics/TinyCLR-Ports/issues/37).
- Fixed PWM on PB8 and PB9 not working on Cerb [#38](https://github.com/ghi-electronics/TinyCLR-Ports/issues/38).
- Fixed AT91 SPI modes being incorrect [#57](https://github.com/ghi-electronics/TinyCLR-Ports/issues/57).
- Fixed 921600 baud not always working on STM32F4 [#91](https://github.com/ghi-electronics/TinyCLR-Ports/issues/91).
- Fixed some interrupts not working on STM32F4 [#106](https://github.com/ghi-electronics/TinyCLR-Ports/issues/106).
- Fixed incorrect SPI clock behavior on STM32F4 [#108](https://github.com/ghi-electronics/TinyCLR-Ports/issues/108).
- Enabled custom GPIO initialization in STM32F4 port [#23](https://github.com/ghi-electronics/TinyCLR-Ports/issues/23).

#### Known Issues
- When the deployment is erased, a junk assembly list is returned until device reboot.
- An internal error may sometimes occur during deployment. Reset the board, cancel deployment, and try again to work around it.
- Rapidly pressing the buttons on the BrainPad may corrupt the display.
- Many UART properties and events are not implemented.
- Deploying over USB when out of memory crashes the board.
- PWM may jitter when decreasing the pulse length while enabled.
- Deploying on USBizi sometimes fails. Reset the board and try again to work around it.
- The LCD on EMM sometimes does not work.
- UART handshaking may miss data on STM32F4.
- The LCD has a blue tint on EMX and EMM [#29](https://github.com/ghi-electronics/TinyCLR-Ports/issues/29).
- The linker will not error when regions overflow or overlap [#30](https://github.com/ghi-electronics/TinyCLR-Ports/issues/30).
- The run app pin does not work on USBizi [#39](https://github.com/ghi-electronics/TinyCLR-Ports/issues/39).
- ADC 6 and 7 do not work on USBizi [#40](https://github.com/ghi-electronics/TinyCLR-Ports/issues/40).
- PWM on 3.27 does not work on EMM [#41](https://github.com/ghi-electronics/TinyCLR-Ports/issues/41).
- Debugging in VS sometimes pauses forever until you manually break [#42](https://github.com/ghi-electronics/TinyCLR-Ports/issues/42).
- Debugging in VS with USBizi crashes the firmware sometimes [#43](https://github.com/ghi-electronics/TinyCLR-Ports/issues/43).
- The ADC on G80 may be slightly inaccurate [#45](https://github.com/ghi-electronics/TinyCLR-Ports/issues/45).
- CAN is not present on USBizi [#114](https://github.com/ghi-electronics/TinyCLR-Ports/issues/114).
- STM32F4 is missing ADC 16 and 17 [#130](https://github.com/ghi-electronics/TinyCLR-Ports/issues/130).
- PWM does not stop after a soft reset on AT91 [#137](https://github.com/ghi-electronics/TinyCLR-Ports/issues/137).
- PWM on PB6 for G30 does not work [#141](https://github.com/ghi-electronics/TinyCLR-Ports/issues/141).
- UART2 handshaking does not work on NXP devices [#143](https://github.com/ghi-electronics/TinyCLR-Ports/issues/143).
- Several PWMs on NXP do not work at most frequencies [#144](https://github.com/ghi-electronics/TinyCLR-Ports/issues/144).

### TinyCLR Config

#### Changes
- Added a list to show deployed assemblies.
- Added a button to enter loader mode.
- Added a display for separate core and device versions.
- Fixed crashes when multiple COM ports are present.
- Fixed many UI issues when rebooting the device.
- Updated the logo.

#### Known Issues
- The assembly list is not cleared when rebooting the device.
- Many features will not function with devices running firmwares before 0.6.0.

### Extension

#### Changes
- Added support for `CustomToolNamespace`.
- Readded resx to the My Project dialogs in VB.
- Readded the Code Analysis project page.
- Fixed VB resx generating under a second level namespace.
- Fixed the deploy list order not reflecting what is actually deployed to.
- Moved two properties from the project templates into the mscorlib.props file referenced by `GHIElectronics.TinyCLR.Core`.
- Increased the number of retries and decreased the wait between each when attempting to connect to the device.

#### Known Issues
- When adding an image or font to a resx file a reference to the drawing assembly is not automatically added.

### Porting

#### Changes
- Added the CAN provider.
- Added `TinyCLR_Result::NoDataAvailable`.
- Added `TinyCLR_Api_Info::State` for implementer use.
- Added support for arrays of non-primitives in interops.
- Added missing RLI region to NXP devices [#46](https://github.com/ghi-electronics/TinyCLR-Ports/issues/46).
- Added better macros for controlling debugger selection [#53](https://github.com/ghi-electronics/TinyCLR-Ports/issues/53).
- Fixed the version passed to `SetDeviceInformation` being ignored.
- Fixed device name and manufacturer for non-GHI devices [#49](https://github.com/ghi-electronics/TinyCLR-Ports/issues/49).
- Clarified policy around USB VID and PID by assigning one PID under our VID for general use [#27](https://github.com/ghi-electronics/TinyCLR-Ports/issues/27).
- Heavily reworked the interop API for easier use.
- Renamed `TinyCLR_Power_Sleep_Level` to `TinyCLR_Power_SleepLevel`.

#### Known Issues
- The USB host API is missing.
- The USB client API is still very rough and will change.

## 0.6.0 on 2017-08-31

### Notes
This release adds support for the G400 and all of our previous NXP based devices: G120, EMX, Embedded Master, and USBizi. There are new LPC17 and LPC24 ports and ARM7, ARM9, and CortexM3 builds of the core now available in the [GitHub repo](https://github.com/ghi-electronics/TinyCLR-Ports). There are new classes available in the `Pins` library to go along with these new ports. The other major changes in this release are fixed automatic loading of USB drivers, updated bootloaders for devices, continued improvements to the `BrainPad` library, `Acquire` and `Release` were added to all native APIs, native interops have increased functionality, and sharing modes for devices are now supported.

Also available in this release is a very early preview of the new TinyCLR Config tool. It can be used to check your device for updates over the internet and install an update if found (if the device has the GHI Bootloader version 2); save, load, erase, pause, and resume the managed application; and capture debug messages. More functionality is planned. See [here](tinyclr-config.md) for more information. Relatedly, we are also making signed drivers for the GHI Bootloader available for Windows 7 and 8. These drivers are not needed on Windows 10 or newer.

Lastly, how we distribute releases is changing going forward. There's no longer one monolithic archive to download. Instead, everything TinyCLR can be found on its [downloads](downloads.md) page and bootloader binaries are available on the bootloader [download](../tinyclr/loaders/ghi-bootloader.md#downloads) page. MD5 hashes are provided for all downloads as well.

### Libraries

#### Changes
- Split `ReadTemperature` in BrainPad to `ReadTemperatureInCelsius` and `ReadTemperatureInFahrenheit`.
- Moved `Picture` out of `BrainPad.Display`.
- Moved `BrainPad.Expansion` to the pins library.
- Changed the original BrainPad display driver to only allocate memory on first use.
- Added basic STM32F4, LPC17, LPC23, LPC24, and AT91 processor definitions to the pins library.
- Added many more devices to the pins library.
- Updated many pin names to match the processor name more closely (particularly COM to UART).
- Calls to `*Provider.FromId` in devices with the same id now return the same object instance.
- Sharing modes for the various providers in the devices library are now supported.
- Software I2C works correctly again.
- Added `Environment.NewLine`.

#### Known Issues
- Formatting numbers that cross an assembly boundary can throw an exception.
- Support for the embedded Visual Basic runtime is incomplete and some uses may throw cryptic compile errors.
- Partially transparent ellipses have weird artifacts.
- Pins are not currently reserved so you can create multiple objects on the same pin which behave incorrectly.

### Firmware

#### Changes
- Fixed the device not loading drivers over USB.
- Added clicker and clicker2.
- Added G400, G120, EMX, Embedded Master, and USBizi.
- Renamed `FEZ` to `FEZCLR` and `FEZCerberus` to `Cerb` [#8](https://github.com/ghi-electronics/TinyCLR-Ports/issues/8).
- Refactored specific devices out of the build script and into configuration files [#6](https://github.com/ghi-electronics/TinyCLR-Ports/issues/6).
- Corrected the incorrect index being passed to `TinyCLR_Startup_SetDebugger` [#3](https://github.com/ghi-electronics/TinyCLR-Ports/issues/3).
- Fixed PWM beyond timer 8 on on STM32F4 boards not functioning.
- Reworked the GPIO functions in the ports to more closely match the processor's API.
- Added ARM7, ARM9, and Cortex M3 targets.
- Added a flag for whether or not to run TinyCLR after rebooting.
- Added `Acquire` and `Release` to GPIO, ADC, DAC, PWM, Interop, Task, Memory, and API providers.
- Interop `GetReturn` now sets the return type automatically but will no longer create an array, object, or string (call `CreateObject` yourself after).
- Interop `ReplaceObject` now functions.
- Strings can now be manipulated in interops.
- Interops now support `DateTime` and `TimeSpan` objects by exposing them as U8.
- Added `FindType` to interops for finding a specific managed typed by name and assembly.
- Objects in interops now track the type of the object as well with the `TinyCLR_Interop_ManagedObjectType` type.
- Very basic object creation in interops has been added, but it fails in many cases and does not run any constructor.
- Removed the `stack` parameter from `ReplaceObject` in interop.

#### Known Issues
- Rapidly pressing the buttons on the BrainPad may corrupt the display.
- Many UART properties and events are not implemented.
- Deploying over USB when out of memory crashes the board.
- Arrays of non-primitives in interops are not supported.
- CAN and USB host are missing.
- The USB client API is still very rough and will change.
- An 0xA2000000 error is sent over the debug transport when there is no deployment present.
- The version passed to `SetDeviceInformation` is ignored.
- PWM may jitter when decreasing the pulse length while enabled.
- Deploying on USBizi sometimes fails. Reset the board and try again to work around it.
- An internal error may sometimes occur during deployment. Reset the board, cancel deployment, and try again to work around it.
- Tight loops on LPC24 may prevent the debugger from working.
- The LCD on EMM sometimes does not work.
- The LCD has a blue tint on EMX and EMM [#29](https://github.com/ghi-electronics/TinyCLR-Ports/issues/29).
- Debugging VS through serial on G120 does not work [#34](https://github.com/ghi-electronics/TinyCLR-Ports/issues/34).
- UART 3 does not work on G120E and 4 does not work on G120 and G120E [#35](https://github.com/ghi-electronics/TinyCLR-Ports/issues/35).
- Non-blocking `GpioChangeWriter` does not work on NXP devices [#36](https://github.com/ghi-electronics/TinyCLR-Ports/issues/36).
- The last two PWM are missing on Cerb [#37](https://github.com/ghi-electronics/TinyCLR-Ports/issues/37).
- PWM on PB8 and PB9 do not work on Cerb [#38](https://github.com/ghi-electronics/TinyCLR-Ports/issues/38).
- The run app pin does not work on USBizi [#39](https://github.com/ghi-electronics/TinyCLR-Ports/issues/39).
- ADC 6 and 7 do not work on USBizi [#40](https://github.com/ghi-electronics/TinyCLR-Ports/issues/40).
- PWM on 3.27 does not work on EMM [#41](https://github.com/ghi-electronics/TinyCLR-Ports/issues/41).
- Debugging in VS sometimes pauses forever until you manually break [#42](https://github.com/ghi-electronics/TinyCLR-Ports/issues/42).
- Debugging in VS with USBizi crashes the firmware sometimes [#43](https://github.com/ghi-electronics/TinyCLR-Ports/issues/43).
- The ADC on G80 may be slightly inaccurate [#45](https://github.com/ghi-electronics/TinyCLR-Ports/issues/45).

### TinyCLR Config

#### Changes
- Initial release.

#### Known Issues
- The `Update Firmware` action won't work in this release because changes were needed in the firmware. Use the `Loader` tab to manually update the firmware. This will not be required in the next release as long as you have the firmware from this release or newer on the device.
- TinyCLR Config may not function properly with devices running firmwares from before this release due to changes in the communication protocols.

### Extension

#### Changes
- Added a using for `GHIElectronics.TinyCLR.BrainPad` to the C# `BrainPad Application` template.
- Removed Expansion from the VB and C# BrainPad application templates.
- Updated URLs in the various NuGet and VSIX packages.
- Forced parity to none when using the serial debugger interface instead of using what the port configures.

#### Known Issues
- Some uses of pattern matching may crash the C# compiler.
- Visual Basic resources page generates an incompatible resource file.
- Visual Basic resource files are wrapped in a second namespace.
- When adding an image or font to a resx file a reference to the drawing assembly is not automatically added.

## 0.5.0 on 2017-07-07

### Notes
This release focuses on the public porting library and API -- though there are a few minor fixes and changes in other areas. As part of the new porting experience, we are also releasing a very early build of TinyCLR for the Netduino 3 and Quail mainboard!

You can now port TinyCLR OS to run on your own system using the header file and library we provide -- as long as your architecture is supported. Currently, only Cortex M4 is available. Keep in mind the available API is still alpha and may change, especially USB client. See [here](native/porting.md) for details. You can also create your own managed functions that can call into native code that you provide. These will be automatically wired into the system for a seamless experience. See [here](native/interops.md) for details.

To support this, we added a few more classes under `System.Runtime.InteropServices`. Most important is the `Interop` class. It allows you to add and remove interops from the system by providing it with the address in memory of the interop definition table. It expects you to load it into memory yourself using the `Marshal` class. You can use `FindAll` to get back a list of all interops registered in the system and `RaiseEvent` to trigger an event on the specified native event dispatcher.

The `NativeEventDispatcher` class allows you to get an instance of the class to receive events that the specified dispatcher name receives (either from native code or `Interop.RaiseEvent`). It has a single event that gets triggered whenever an event is received. There is only one instance per dispatcher name, so calls to `GetDispatcher` with the same name will return the same instance.

Similar to `Interop`, `Api` can be used to add and remove native APIs from the system. It expects you to load the API into memory yourself and pass it the address of the API definition. You can query all registered APIs, find a specific API by name and type, and parse and creator selectors. Selectors are a string that represents an API name and index into its implementations of the form "name\index". A default selector is set so that a specific API type can be returned without knowing the exact name, like the default GPIO controller on a system.

The `Api` class is used internally by the devices library to talk to the native implementation via the implementation `IntPtr` provided for the given API name and index. In some cases you can use the `GetDefault` method on a given device provider to return the default registered API. If there is no default, like for PWM and others, you can pass the `Id` property in the specific pins class to the desired device provider.

We added `Marshal.GetDelegateForFunctionPointer` to enable you to create a quick native interop for a specific address in memory that takes a single `ref IntPtr` parameter and returns nothing. `DeviceInformation` was also added to return the device name, manufacturer, and version set on the native side.

After flashing the firmware for the first time on any device, Windows may still use the old NETMF USB IDs preventing the device from being seen by TinyCLR. Uninstall the device from the Device Manager and reinstall it to fix it. To update the firmware on pre-Windows 10 machines, you will need the bootloader drivers provided by our existing [2016 R1 NETMF SDK](../netmf/downloads.md).

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
- Updated devices library to use the provider and native API model via a `Provider` class for each type.
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
- Pins are not currently reserved so you can create multiple objects on the same pin which behave incorrectly.
- Software I2C does not work.

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
- PWM on controller 8 and up does not work on the G80.
- Deploying over USB when out of memory crashes the board.

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

## 0.4.0 on 2017-05-10

### Notes
This release primarily fixes several bugs; implements more of the serial API; adds `DataReader`, `DataWriter`, and `Marshal` classes; and reworks a lot of the BrainPad API. A new Storage library was added that moves some large members (like `DataReader`) out of Devices that you may not always needed. There is more to be added to this library down the road. `SignalGenerator`, `SignalCapture`, and `PulseFeedback` were renamed to match the Windows 10 counterparts. Their API will be updated to match as well in a future release.

The `Marshal` class under `System.Runtime.InteropServices` can be used like the old `Register` and `AddressSpace` classes to read and write memory. It also adds allocating and releasing unmanaged memory from the managed side that can be manipulated from the other members. 

You can see a quick example on using the new serial API [here](https://gist.github.com/anonymous/f26c82e463c397cd716c6fb807111913). You must use either the `DataReader` and `DataWriter` classes or use the `WindowsRuntimeBufferExtensions` to manipulate a `Buffer` since the internal array is no longer publicly accessible to match the UWP API. Pay attention to the `Load` and `Store` members. You can't read before calling `Load` and writes do not get flushed until you call `Store`.

There has been no change to the G120 and G400 bootloaders in this release so you do not need to update them if you already have them on your device from the 0.3.0 release.

After flashing the firmware for the first time on any device, Windows may still use the old NETMF USB IDs preventing the device from being seen by TinyCLR. Uninstall the device from the Device Manager and reinstall it to fix it. To update the firmware on pre-Windows 10 machines, you will need the bootloader drivers provided by our existing [2016 R1 NETMF SDK](../netmf/downloads.md).

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

## 0.3.0 on 2017-04-06

### Notes
This release has several API additions. Some were added as features themselves (software SPI, SignalGenerator, etc) while others were added to support certain features (the VB runtime, string.Format, MemoryStream and IntPtr for Drawing, etc). We're working to align ourselves with the various [.NET Reference Sources](https://github.com/Microsoft/referencesource) available. You'll also see many new icons throughout, application templates for the BrainPad, and common item templates. The NuGet packages that have dependencies (such as on Core), now require the major and minor versions to match. For example, the 0.3.0 Devices library depends on Core [0.3.0,0.4.0). This is to further our use of SemVer so that the native interop checksum only changes in major and minor versions. See the [NuGet docs](https://docs.microsoft.com/en-us/nuget/create-packages/dependency-versions) for more information.

The biggest addition is the drawing library. It was designed to mirror System.Drawing from the desktop. The basic API is there but there is still more work to be done. To support this, a DisplayController was added to the devices library to configure the display. Since there is no config yet you need to configure the display every time your program starts. A notable change from NETMF is calling flush on a drawing surface the size of the display will no longer draw to the display. Only drawing surfaces created from the FromHdc method passing in the Hdc value from the DisplayController will flush to the display. At this time, only bmp images are supported. Make sure you add a reference to GHIElectronics.TinyCLR.Drawing if using bitmap or font resources. Since it's in NuGet now it isn't automatically added.

Support for Visual Basic has also been reenabled. One important thing to keep in mind is that there is no longer a Microsoft.VisualBasic assembly. We are using the embedded runtime option provided by Roslyn. It relies on several APIs being present in the core library. We added several of the key APIs needed to enable common usage scenarios. If you find you're getting cryptic compile errors from locations not in your code, let us know so we can evaluate what additional APIs are required.

Since the UWP API only supports a controller wide frequency, we had to rework PWM a little bit. There is no longer one controller like there is for GPIO, instead one controller exists for each frequency source. On devices like the G30 and G80, this is a timer. On devices like the G400, there are independent registers for each channel (so unfortunately there will be one controller per channel). The pins library has been updated to organize PwmPin around controllers. SignalGenerator, SignalCapture, and PulseFeedback have also been added, but their APIs will change in a future release to match the UWP style. You can also now change what gets returned by GetDefault calls on the various controllers by updating LowLevelDevicesController.DefaultProvider.

The Diagnostics namespace now matches the desktop version more closely. WriteLineIf and Assert were added to Debug and Trace was added as well. All methods on Debug and Trace are marked with the Conditional attribute as expected using the DEBUG and TRACE constants respectively. There's also now a Listeners property on each. This is a collection that you can add to so you can receive whatever is written to Trace or Debug by registering a class derived from TraceListener. As on the desktop, both Trace and Debug share the same listener collection. By default, the collection is populated with a listener that prints to the debug transport which is now at Debugger.Log. Collect and GetTotalMemory were added to GC. Note that GetTotalMemory returns the amount of memory used, not free, to match the desktop. We're investigating APIs to return the amount free.

The last notable change is that we implemented IntPtr and UIntPtr. For now, they're only used as the type of the Hdc property in drawing. We expect them to be used in more places going forward. Since these two types map to native int and native unsigned int in the CLR and the managed compilers emit those types when they encounter IntPtr or UIntPtr, we have also added initial support for those types in the interpreter and runtime as well. Let us know if you encounter any weird or hard to explain runtime issues.

This release also includes the firmware for the G400. It requires an updated bootloader from the one provided on the [G400 bootloader installation page](../../hardware/ucm/g400d.md). Simply download the bootloader installer from the installation page and replace Bootloader.bin with the bootloader provided in the TinyCLR download package (making sure to rename it to Bootloader.bin). This updated bootloader can still be used to install the NETMF G400 firmware. It will eventually replace the one provided on the installation page.

After flashing the firmware for the first time on any device, Windows may still use the old NETMF USB IDs preventing the device from being seen by TinyCLR. Uninstall the device from the Device Manager and reinstall it to fix it. To update the firmware on pre-Windows 10 machines, you will need the bootloader drivers provided by our existing [2016 R1 NETMF SDK](../netmf/downloads.md).

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

## 0.2.0 on 2017-03-07

### Notes
You cannot use projects you made for the 0.1.0 version. You must recreate them and re-add your code files because of the changes to the project templates to make them more closely align them with the desktop .NET templates -- you'll notice the only difference is a few properties which prevent inclusion of reference assemblies. The templates also use the .NET Framework 4.5.2 target framework. This is only for NuGet compatibility going forward and does not mean you can use other libraries targeting that framework. This was done in anticipation of broader project system support of the new PackageReference format currently used in .NET Core which fails with unknown target frameworks.

The MSBuild package is no longer provided or required. The metadata processor tool has moved internally to the extension and is invoked during deployment to the device. This means that pe and pdbx files are no longer redistributed with their assemblies -- they appear in a pe folder under the output directory when you deploy. We have also rewritten how dependencies are detected for deployment. If you notice any weird failures around assembly resolution or deployment, let us know and send us the entire project as-is so we can diagnose it.

The information displayed while deploying to the device has also been improved to show more information about what is going on and what stage the deployment is in. We've also reworked incremental deployment so that assemblies are deployed one to a flash sector (if space allows) to enable re-deploying only the assemblies that have changed on a sector by sector basis. This greatly increases deployment speed on devices which a large number of flash sectors allocated to deployment.

This release also includes the firmware for the G120 and G120E. Because the current GHI bootloader on the G120 expects to load TinyBooter, we have provided a second stage bootloader with this preview that you must deploy using the existing GHI bootloader as if you were deploying TinyBooter. Once it is deployed and you restart the device, you'll notice that it starts our newer [GHI bootloader 2.0](loaders/ghi-bootloader.md). You can then use this second bootloader to deploy the TinyCLR OS firmware. Asserting LDR0 will enter the second bootloader while asserting both LDR0 and LDR1 will enter the original bootloader and allow you to return to NETMF.

After flashing the firmware the first time, Windows may still use the old NETMF USB IDs preventing the device from being seen by TinyCLR. Uninstall the device from the Device Manager and reinstall it to fix it. To update the firmware on pre-Windows 10 machines, you will need the bootloader drivers provided by our existing [2016 R1 NETMF SDK](../netmf/downloads.md).

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

## 0.1.0 on 2016-12-16

### Known Issues
- After flashing the firmware the first time, Windows may still use the old NETMF USB IDs preventing the device from being seen by TinyCLR. Uninstall the device from the Device Manager and reinstall it to fix it.
- To update the firmware on pre-Windows 10 machines, you will need the bootloader drivers provided by our existing [2016 R1 NETMF SDK](../netmf/downloads.md).
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

***

Visit our main website at [**www.ghielectronics.com**](http://www.ghielectronics.com) and our community forums at [**forums.ghielectronics.com**](https://forums.ghielectronics.com/).
