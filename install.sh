#!/bin/bash

# General variables
GIT_USER='JPry'
GIT_REMOTE='jpry'
WPE_DIR='/wpengine'
CWD="$(pwd)"
GROUP="$(id -g -n $USER)"

# We're going to need sudo, so prompt for the password upfront
sudo -v

# Create symlinks
source ./install/symlinks.sh

# Ensure homebrew packages are installed
source ./.brew

# Set up OS X defaults
source ./.osx

# Set up WPE Git repos
source ./install/wpe_repos.sh


