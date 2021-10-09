#!/bin/bash

# Settings
DOTFOLDER=".dotfiles"
GLOBIGNORE="*.sh":"*.md":"*.swp":"*.plist":".git"	

symAll() { # creates symlink for each dotfile
for f in *; do
	ln -sf ~/$DOTFOLDER/$f ~/$f
done
}

ln -sf ~/.dotfiles/.vimrc ~

symAll
