#!/bin/bash

# We're going to need sudo, so prompt for the password upfront
sudo -v

# Create symlinks
source ./install/symlinks.sh

# Ensure homebrew packages are installed
#source ./.brew

# Set up OS X defaults
#source ./.osx

