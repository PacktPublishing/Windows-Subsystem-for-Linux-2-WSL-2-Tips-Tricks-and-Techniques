#!/bin/bash

# This is an example script showing how to set up a prompt for connecting to a remote machine over SSH
PS3="Select the SSH remote to connect to: "

# TODO Put your SSH remotes here (with username if required)
vals=(
    stuart@sshtest.wsl.tips
    stuart@slsshtest.uksouth.cloudapp.azure.com
)
IFS="\n"
select option in "${vals[@]}"
do
if [[ $option == "" ]]; then
    echo "unrecognised option"
    exit 1
fi
echo "Connecting to $option..."
ssh $option
break
done