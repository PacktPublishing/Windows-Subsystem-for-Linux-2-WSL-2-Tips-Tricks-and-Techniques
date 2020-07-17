echo "This file contains example commands from chapter 5 and is not meant to be executed as a script"
exit 0


::
:: NOTE: This file contains example commands for launching the Windows Terminal from chapter 6
::       Where distro names and file paths are used, you will likely need to change based on your system
::


:: Launch wt specifying a title
wt.exe --title "Put a title here"

:: Launch wt specifying a profile and title
wt.exe -p Ubuntu-20.04 --title "This is Ubuntu" 

:: Launch wt with multiple tabs
wt.exe -p "PowerShell" --title "This one is PowerShell"; new-tab -p "Ubuntu-20.04" --title "WSL here!"

:: Launch wt with multiple panes
wt.exe -p PowerShell; split-pane -p Ubuntu-20.04 -V --title "web server"; split-pane -H -p Ubuntu-20.04 --title htop bash -c htop

