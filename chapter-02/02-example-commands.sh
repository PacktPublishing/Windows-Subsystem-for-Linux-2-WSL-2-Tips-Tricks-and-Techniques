#!/bin/bash
echo "This file contains example commands from chapter 2 and is not meant to be executed as a script"
exit 0

#
# NOTE: This file contains example commands from chapter 2
#       Where distro names and user names are used, you will likely need to change based on your system
#


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

# Dump the `/etc/issue` contents from the default distro
wsl cat /etc/issue

# Dump the `/etc/issue` contents from the `Ubuntu-20.04` distro
wsl -d Ubuntu-20.04 cat /etc/issue

# Dump the `/etc/issue` contents from the `Alpine` distro
wsl -d Alpine cat /etc/issue

# Run `whoami` as the default user
wsl whoami

# Run `whoami` as `stuart` user
wsl -u stuart whoami

# Run `whoami` as `root` user
wsl -u root whoami

# Terminate the `Ubuntu` distro
wsl --terminate Ubuntu

# Stop all distros
wsl --shutdown
