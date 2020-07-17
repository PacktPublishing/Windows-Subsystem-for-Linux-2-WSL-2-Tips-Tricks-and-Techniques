#!/bin/bash
echo "This file contains example commands from chapter 5 and is not meant to be executed as a script"
exit 0

#
# NOTE: This file contains example commands from chapter 5
#       Where distro names and file paths are used, you will likely need to change based on your system
#       In the examples, the chapter-05 content is placed in a wsl-book folder in both C:\ in Windows 
#       and the user home directory in WSL
#

# output the contents of the file from the Windows file system via /mnt/c/...
cat /mnt/c/wsl-book/example.txt

# open a file from the Windows file system in vi
vi /mnt/c/wsl-book/wsl.txt

# use PowerShell to retrieve Windows information
powershell.exe -C "Get-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System"

# execute a script using PowerShell
powershell.exe -C ./wsl.ps1 -Name Stuart

# pipe output from PowerShell into bash commands
powershell.exe -C "Get-Content ./wsl.ps1" | wc -l

# pass values to PowerShell
MESSAGE="Hello"; powershell.exe -noprofile -C "Write-Host $MESSAGE"

# pass input to PowerShell via stdin
echo "Stuart" | powershell.exe -noprofile -c 'Write-Host "Hello $input"'

# create a symlink to Windows Downloads
ln -s /mnt/c/Users/stuart/Downloads/ ~/Downloads

# launch the default Windows editor for a file
wslview my-text-file.txt

# launch the default Windows editor for a file
wslview https://wsl.tips

# Show the current folder contents via PowerShell
powershell.exe ls

# Convert a WSL path to a Windows path (\\wsl$\...)
wslpath -w ~/my-text-file.txt

# Convert a Windows path to a WSL path
wslpath -u '\\wsl$\Ubuntu-20.04\home\stuart\my-text-file.txt'

# Create a wslview helper that converts paths, and call it
wslvieww() { wslview $(wslpath -w "$1"); };
wslvieww /home/stuart/my-text-file.txt

# Commands to find and map the Windows path to WSL path to create a Downloads symlink automatically
WIN_PROFILE=$(cmd.exe /C echo %USERPROFILE% 2>/dev/null)
WIN_PROFILE_MNT=$(wslpath -u ${WIN_PROFILE/[$'\r\n']})
ln -s $WIN_PROFILE_MNT/Downloads ~/Downloads





