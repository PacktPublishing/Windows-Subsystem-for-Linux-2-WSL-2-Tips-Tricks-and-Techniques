Write-Host "This file contains example commands from chapter 4 and is not meant to be executed as a script"
exit 0

#
# NOTE: This file contains example commands from chapter 4
#       Where distro names and file paths are used, you will likely need to change based on your system
#

# Get the contents of a file in the home folder for user `stuart` in the `Ubuntu-20.04` distro
Get-Content '\\wsl$\ubuntu-20.04\home\stuart\hello-wsl.txt'

# Pipe output from PowerShell into WSL
Get-Childitem $env:SystemRoot | ForEach-Object { $_.Name.Substring(0,1).ToUpper() } | wsl bash -c "sort | uniq -c"

# Pipe output
wsl bash -c "ls /usr/bin | cut -c1-1" | Group-Object

