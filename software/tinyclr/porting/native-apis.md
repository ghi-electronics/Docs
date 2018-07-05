# Native APIs in TinyCLR
---
The TinyCLR runtime provides several built in APIs for you to use and allows you to register APIs of your own that other parts of the system can later use. These APIs are also exposed to managed code to query and use.

Looking inside the TinyCLR.h file provided in the porting repo, you'll see several types defined under `TinyCLR_Api_Type`. Each of those types has an associated provider somewhere else in the file that defines its API. The `GPIO` API for example allows you to read and write a pin that that provider has. APIs can also be set as the default API for a given type. This makes it easier for managed code to get access to a resource without knowing the exact name. Notice also that APIs are all defined as a struct with a field to access the owning API and a number of function pointers that provide the API. Most function pointers in avaialble APIs take a pointer to the owning struct as a `this` reference, since one is not implicitly provided because they're not traditional classes with instance members.

Ports will register various providers to expose some functionality to other parts of the system, including native code. Our `GHIElectronics.TinyCLR.Devices` library allows you to specify which native provider you want to use and will automatically acquire and interface with it. It also uses the default API functionality to power the various `GetDefault` methods.

All access to APIs is handled by the `TinyCLR_Api_Provider` type that is passed to the `TinyCLR_Startup_SoftResetHandler` you register. The base function to find APIs is `Find`. You provide it an API name and the type that API should be and then it returns a `TinyCLR_Api_Info` type if it is found, or `nullptr` otherwise. The info struct contains information on the API like name, author, version, and type. It may also provide zero or one implementations. When providing zero implementations, `Implementation` is `nullptr`. When providing one, `Implementation` points direcetly to the an instance of the corresponding API struct.

The functions `SetDefaultSelector` and `GetDefaultSelector` allow you to set and get the default selector used for a given API type. A selector takes the form "{API name}\{API index}" (excluding the braces). This selector can be used by the `FindBySelector` method. It'll look for an API with the given name and then find the implementation with the given index, making sure not to go out of bounds for the specified API. `FindByIndex` does the same thing except you manually provide it with the name and index. `FindByDefault` finds the default selector for the type if present and returns the API implementation it corresponds to.

You can also add your own API using the `Add` function. Just provide it with a pointer to a `TinyCLR_Api_Info` struct that is properly constructed and it can later be found by calls to `Find`. You can add APIs from within native interops or your own native code if you're building your own firmware.

The below code shows you how to find and interact with the default GPIO provider in the system. It assumes one is present and that the API provider is available as a global variable in your code.

```cpp
void gpioTest() {
    auto gpioProvider = (const TinyCLR_Gpio_Provider*)apiProvider->FindDefault(apiProvider, TinyCLR_Api_Type::GpioProvider);

    if (gpioProvider != nullptr) {
        gpioProvider->AcquirePin(gpioProvider, 0);
        gpioProvider->WritePin(gpioProvider, 0, TinyCLR_Gpio_PinValue::High);
        gpioProvider->ReleasePin(gpioProvider, 0);
    }
}
```