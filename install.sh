#!/bin/bash

# Install homebrew
if [ ! hash brew 2>/dev/null]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Ensure homebrew packages are installed
source .brew
