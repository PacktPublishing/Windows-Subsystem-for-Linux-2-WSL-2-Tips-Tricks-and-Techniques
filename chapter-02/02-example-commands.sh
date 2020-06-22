#!/bin/bash
echo "This file contains example commands from chapter 2 and is not meant to be executed as a script"
exit 0

# List distros
wsl --list

# List running distros
wsl --list --running

# Verbose listing
wsl --list --Verbose

# Set `Ubuntu` distro to use WSL v2
wsl --set-version Ubuntu 2

# List files in the user home folder in the default distro
wsl ls ~

# Dump the `/etc/issue` contents from the `Ubuntu-20.04` distro
wsl -d Ubuntu-20.04 cat /etc/issue

# Specify the user to run a command as
wsl -u root whoami

# Terminate the `Ubuntu` distro
wsl --terminate Ubuntu

# Stop all distros
wsl --shutdown
