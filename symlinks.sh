#!/bin/bash

# Settings
DOTFOLDER=".dotfiles"
GLOBIGNORE="*.sh":"*.md":"*.swp":"*.plist":".git"	

symAll() { # creates symlink for each dotfile
for f in *; do
	ln -s ~/$DOTFOLDER/$f ~/$f
done
}

symAll
