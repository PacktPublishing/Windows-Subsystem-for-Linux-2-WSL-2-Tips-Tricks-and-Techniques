#!/bin/bash
echo "This file the set-prompt function and is intended to be added to your .bashrc"
exit 0

function set-prompt() { echo -ne '\033]0;' $@ '\a'; }
