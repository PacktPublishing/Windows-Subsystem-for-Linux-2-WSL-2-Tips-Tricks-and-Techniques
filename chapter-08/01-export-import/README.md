# README

This is a sample code to accompany chapter 8, exporting and importing distros.

## Steps

From inside the distro to export, check that the `[user]` section has the `default` value

```bash
cat /etc/wsl.conf
```

If not, add it:

```bash
sudo bash -c "echo -e '\n[user]\ndefault=$(whoami)' >> /etc/wsl.conf"
```

Export the distro (change names and paths as needed):

```bash
wsl --export Ubuntu-18.04 c:\temp\Ubuntu-18.04.tar
```


Import the distro in WSL:

```powershell
# Distros from the store are in folders under $env:LOCALAPPDATA\Packages 
# Change the path if you prefer
wsl --import Ubuntu-18.04-Copy C:\wsl-distros\Ubuntu-18.04-Copy C:\temp\Ubuntu-18.04.tar
```

Run the new distro:

```powershell
wsl -d Ubuntu-18.04-Copy
```