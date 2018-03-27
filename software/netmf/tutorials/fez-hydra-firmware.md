# FEZ Hydra Firmware

Since the [FEZ Hydra](https://www.ghielectronics.com/catalog/product/530) is open source, its firmware is available and can be built by end users who wish to customize it. To begin, make sure you have the following installed:

* Visual Studio 2012 Express for Desktop
* The GNU GCC toolchain

Only Visual Studio 2012 is supported due to a requirement in NETMF itself. You may continue to use Visual Studio 2013 or newer for deploying programs to the board. You may use other compilers or toolchains, but they are not covered in this guide and may require a number of changes to the sources to use correctly. 

Additionally, compiling the firmware requires the path to the compiler to not have any spaces in it. If you install the above toolchain to the default location in Program Files, you must create a shortcut to it that has no spaces. To do so, assuming the default install path, execute the below command from an elevated command prompt. It will create a shortcut to the install directory in C:\ called gcc.

```
mklink /D C:\gcc "C:\Program Files (x86)\GNU Tools ARM Embedded\4.9 2015q2"
```

## Getting the Sources
After you have installed the above tools, you need to download the source code for the firmware. It can be found on Bitbucket. If you are familiar with git, you can clone is to a local directory. If not, you can download the latest version from the downloads page. In either case, make sure you extract it to a folder with no spaces in its path just like the compiler. Unfortunately, a shortcut like we created above will not work. For this guide, we will assume you cloned or downloaded and extracted it to C:\netmf-open-firmware.

One important thing to keep in mind is that we do not release the C# sources to our extensions. However, the firmware does include the native interop code. As such, if you wish to use our libraries, you must match the libraries found in an SDK with the firmware version you are compiling. For example, when we released the 2014 R5 SDK, we tagged that commit as SDK-2014-R5 to easily find it later. Pre-releases are not tagged but just have a commit message of the form "Commit for SDK release 2015.1.9.0". If you try to compile a firmware version that came after the SDK version you got our libraries from, it will likely not work.

## Compiling
Once you have all of the tools installed and the firmware source code downloaded, you are ready to compile. Begin by opening a command prompt and navigating to the directory with the firmware source, for example: C:\netmf-open-firmware. Once in that directory, execute the below command. Make sure that the last parameter matches the directory you installed the GCC toolchain to or the shortcut you created.

```
setenv_gcc 4.9.3 C:\gcc
```

After that, to build TinyBooter, execute:

```
msbuild Solutions\FEZ_Hydra\TinyBooter\TinyBooter.proj /t:cleanbuild /p:flavor=release
```

Once compilation finishes, you will find the final binary at C:\netmf-open-firmware\BuildOutput\ARM\GCC4.9\le\FLASH\release\FEZ_Hydra\bin\TinyBooter.bin. You can then use the loader updater that comes with our SDK to deploy that TinyBooter to your board (make sure to rename it to Loader.bin for the script to find.)

Next, you can compile TinyCLR (the main firmware). Execute the same command as above, except change TinyBooter to TinyCLR:

```
msbuild Solutions\FEZ_Hydra\TinyCLR\TinyCLR.proj /t:cleanbuild /p:flavor=release
```

Once that finishes, the final firmware can be found in "C:\netmf-open-firmware\BuildOutput\ARM\GCC4.9\le\FLASH\release\FEZ_Hydra\bin\tinyclr.hex". ER_CONFIG is the same as Config.hex in our SDK and ER_FLASH is the same as Firmware.hex. You can deploy those files using MFDeploy or FEZ Config. You now have your own firmware running on your FEZ Hydra and can deploy to it from Visual Studio.