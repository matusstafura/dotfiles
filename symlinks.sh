#!/bin/bash

# Settings
DOTFOLDER=".dotfiles"
GLOBIGNORE="*.sh":"*.md":"*.swp":"*.plist":".git"	

# symAll() { # creates symlink for each dotfile
# for f in *; do
# 	ln -sf ~/$DOTFOLDER/$f ~/$f
# done
# }
# symAll

ln -sf ~/.dotfiles/.vimrc ~
ln -sf ~/.dotfiles/.p10k.zsh ~

