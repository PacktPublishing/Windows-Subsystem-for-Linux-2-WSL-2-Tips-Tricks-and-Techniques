# README

This is a sample code to accompany chapter 8, building distros with Dockerfiles.

## Steps

Run the starting container image:

```powershell
docker run -it --name dotnet mcr.microsoft.com/dotnet/sdk:5.0
```

Add new user and set the password (change username as appropriate):

```bash
useradd -m stuart
passwd stuart
```

Set the user as WSL default user in `/etc/wsl/conf`:

```bash
echo -e "[user]\ndefault=stuart" > /etc/wsl.conf
```

Exit the container and export to a TAR file (change the paths as required):

```powershell
docker export -o c:\temp\dotnet.tar dotnet
```


Import the distro in WSL:

```powershell
# Distros from the store are in folders under $env:LOCALAPPDATA\Packages 
# Change the path if you prefer
wsl --import dotnet C:\wsl-distros\dotnet C:\temp\dotnet.tar --version 2
```

Run the new distro:

```powershell
wsl -d dotnet
```