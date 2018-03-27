# TinyCLR Tutorials
---
![Learn More](../images/learn.jpg)

Here you will find tutorials covering different features of our TinyCLR OS. We try to keep the documents hardware generic as much as possible but changes may be required to get the sample code to run on your target platform.

## System Setup
Follow [these steps](../intro.md#tinyclr-computer-setup) to setup your development machine.

## Starting a New Project

Open Visual Studio, select `File > New > Project`. 

![Start New Project](images/StartNewProject.jpg)   

There should be a `TinyCLR` option under `Visual C#`

Click the "OK" button to create a  new project. 

![Select TinyCLR Project](images/SelectTinyCLRProject.jpg)   

The project has only one `C#` file, called `Program.cs`. `C#` source files are listed in the `Solution Explorer` window. 

![Solution Explorer](images/SolutionExplorer.jpg) 

If the `Solution Explorer` window is not visible, click on `View > Solution Explorer` to open it.

![View Show Solution Explorer](images/ViewShowSolutionExplorer.jpg) 

## Adding NuGet Packages
TinyCLR OS libraries are available as NuGet packages.  Because of this, there will be no SDK to install or machines to lock to specific versions.  Simply use NuGet to download any needed version of any needed library on a per-project basis.

To manage your NuGet packages, right click on your Project in the Solution Explorer and select `Manage NuGet Packages`

![View Show Solution Explorer](images/SelectManageNugetPackages.jpg) 

## Local Hosting NuGet packages

Since TinyCLR OS is still so new, we haven't yet uploaded any packages to NuGet, so make sure to download the available libraries, extract the archive, and place them in a local NuGet feed.

To do this you'll have to point Visual Studio to that local NuGet feed. 

After selecting `Manage NuGet Packages` select the `Package Source` settings icon. 

![Setting Nuget Package Source](images/SettingNugetPackageSource.jpg) 

Next you'll click the `+` button to add a new Package source. 

![Add Package Source](images/AddPackageSource.jpg)

Then select the location where the NuGet packages are stored locally, by pressing the '...' button. 

 ![Choose Local NuGet Package Folder](images/ChooseLocalNuGetPackageFolder.jpg)

After Selecting the local folder where the downloaded NuGet packages are. You can select the `Installed` Tab to view the installed NuGet Packages. 

 ![Show Installed NuGet Packages](images/ShowInstalledNuGetPackages.jpg)

Selecting the `Browse` tab will show all the NuGet packages located in your local NuGet feed. Those installed are noted with a GREEN check mark in front of the name. 

 ![Browse Local NuGet Feed](images/BrowseLocalNuGetFeed.jpg)

To install one of the packages. 

 ![Add Nuget Package](images/AddNuGetPackage.jpg)

The last thing to do is accept the licensing agreement. 

![Accept Agreement for NuGet](images/AcceptAgreementforNuGet.jpg)

And, that's it! You're now ready to start programming using TinyCLR OS. Fit the F5 key to build and deploy your application.

(add more images for build and deploy and see a message on the output window)

