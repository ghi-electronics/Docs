# Native Interops in TinyCLR

Interops allow you to write a class in managed code that is partially or entirely implemented in native code. This is useful for time critical tasks, things that would take too long in managed code, or interacting with native functionality not exposed through managed code. Keep in mind that while native code executes, all managed threads are blocked and if you crash in native code, managed code also crashes.

To get started, create a TinyCLR project called `InteropTest`. In the project properties window, go to the `TinyCLR OS` tab. Check both the `Generate native stubs for internal methods` and the `Generate bare native stubs` checkboxes. Next, define your native API. Any method that you plan to implement in native code must be declared extern and be decorated with the `System.Runtime.CompilerServices.MethodImpl` attribute that is constructed with `MethodImplOptions.InternalCall`. Static and instance functions, static and instance constructors, finalizers, and property set and get bodies can all be implemented native. They can have any visibility, can take any number or types of parameters, and can return any type. For example:

```csharp
class MyNativeClass {
    private int field = 5;

    [MethodImpl(MethodImplOptions.InternalCall)]
    public extern string MyNativeFunc(uint param1);

    public extern int MyNativeProperty {
        [MethodImpl(MethodImplOptions.InternalCall)]
        get;
    }
}
```

Once you have your native API defined, build your project. In the output folder, find and open `pe` and then `Interop`. In there are three files that let TinyCLR connect the managed methods to the native methods. There are two main files that have the same name as your project. These define the entire API. Importantly, there is an object that has the assembly name, its checksum, and an array of its methods. The remaining file contains function stubs for each native method you need to implement from the `MyNativeClass` class. Each function has a single parameter of type `TinyCLR_Interop_MethodData` that can be found in the `TinyCLR.h` file. This type has two memebers: an opaque stack type that you pass to other interop functions and the [API provider](native_apis.md) that gives you access to the runtime. You can use this API provider to find the interop provider. The interop provider allows you to read and write object fields, read arguments passed to the function, write to reference arguments, set the return value, raise other events, and create new managed objects. The following code shows reading from a field and setting it as the return value of the property:

```cpp
TinyCLR_Result InteropTest_InteropTest_MyNativeClass::MyNativeProperty___I4(const TinyCLR_Interop_MethodData md) {    
    auto ip = (const TinyCLR_Interop_Provider*)md.ApiProvider.FindDefault(&md.ApiProvider, TinyCLR_Api_Type::InteropProvider);
    
    TinyCLR_Interop_ManagedValue self;
    TinyCLR_Interop_ManagedValue ret;
    TinyCLR_Interop_ManagedValue field;
    
    ret.Type = TinyCLR_Interop_ManagedValueType::I4;
    
    ip->GetThisObject(ip, md.Stack, self);
    ip->GetField(ip, self, InteropTest_InteropTest_MyNativeClass::FIELD___field___I4, field);
    ip->GetReturn(ip, md.Stack, ret);

    ret.Data.Numeric->I4 = field.Data.Numeric->I4;

    return TinyCLR_Result::Success;
}
```

Now you can compile these files using GCC. If you don't have GCC yet, see the [porting guide](intro.md) to find out how to install GCC. To compile, you can use the sample build and linker scripts from [here](http://ghielectronics.com/). Because TinyCLR can't currently dynamically relocate your code, you'll need to tell the scatterfile where to place the final binary image in memory. The sample files automatically place the image in the region dedicated for native interops for the [FEZ](../../hardware/FEZ.md). Make sure to adjust it for your device and that you don't overlap other images.

Once you have a compiled image, look in the map file to find out where the interop definition variable `Interop_InteropTest` got placed. You'll need to pass this address to the managed function that registers the interop. In managed code, add the compiled binary image as a resource and use the `Marshal` class to copy it into the correct location in memory. Then call `System.Runtime.InteropServices.Interop.Add` and pass it the address of the `Interop_InteropTest` object from the map file. You need to do this every time your program runs and before you call any of the native methods in your interop class._