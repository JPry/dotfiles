#!/bin/bash

CWD="$(pwd)"
DIR="$CWD/.."

# Create symlinks
for file in .{aliases,bash_profile,bash_prompt,colors,functions,gitconfig,path,zshrc}; do
    target="$HOME/$file"
    if [[ -L $target ]]; then
        echo "Link exists: $target"
    else
        echo "Creating new link: $DIR/$file -> $target"
        ln -s $CWD/$file $target;
    fi
done
unset file
unset target
