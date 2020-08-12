# README

This is a sample code to accompany chapter 8, building distros with Dockerfiles.

## Steps

Build the image and create the TAR export file, run `build.ps1` from PowerShell:

```powershell
./build.ps1 -UserName "stuart" -Password "YourPassword" -ExportTarPath "c:\temp\dotnet.tar"
```

Import the distro in WSL:

```powershell
# Distros from the store are in folders under $env:LOCALAPPDATA\Packages 
# Change the path if you prefer
wsl --import dotnet C:\wsl-distros\dotnet C:\temp\dotnet.tar
```

Run the new distro:

```powershell
wsl -d dotnet
```