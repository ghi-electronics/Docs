# TinyCLR Tutorials

Here you will find tutorials covering different features of the TinyCLR OS. We try to keep the documents hardware-generic as much as possible but when we can't, we use [FEZ](../../hardware/fez.md) as a reference.
___

## Getting Started
First you'll need to download and install Visual Studio 2017, if you already haven't 

* [Visual Studio 2017 Download](https://www.visualstudio.com/downloads/)

Next you have to download the lastest version of TinyCLR OS here:

 
* [TinyCLR OS Download](http://ghielectronics.com/downloads/TinyCLR/TinyCLR.0.4.0.zip)

Release notes:
* [TinyCLR OS Release Notes](https://www.ghielectronics.com/docs/350/tinyclr-os)

The TinyCLR OS zip file you downloaded contains all files you'll currently need to run TinyCLR OS. 

Extract all the files from the downloaded zip into a folder on your desktop. 

Next run the VSIX installer file, found inside the folder you just extracted to you DESKTOP



## Adding Nuget Packages

For the current preview releases you'll have to create a local NUGET folder to host the NUGET packages that are found in the [TinyCLR OS Download](http://ghielectronics.com/downloads/TinyCLR/TinyCLR.0.4.0.zip)

In the near future all libraries will be downloaded through NuGet. Because of this, there will be no SDK to install or machines to lock to specific versions. Simply use NuGet to download any needed version of any needed library on a per-project basis.
___

## Create a New Project
Open Visual Studio, select FILE>New Project. There should be a "TinyCLR" option under "Visual C#"

Click the "OK" button a project and program are created. The project has only one C# file, called Program.cs. C# source files are listed in the "Solution Explorer" window. If the Solution Explorer is not opened, use the VIEW->Solution Explorer menu.








