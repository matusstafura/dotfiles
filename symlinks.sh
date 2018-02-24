#!/bin/bash

# Settings
DOTFOLDER=".dotfiles"
GLOBIGNORE="*.sh":"*.md":"*.swp":"*.plist":".git"	

symAll()
{ # creates symlink for each dotfile
for f in *
do
	if [ ! -L "$HOME/$f" ]
	then
		ln -s ~/$DOTFOLDER/$f ~/$f
		echo "Symlink created:\t " $f
	else
		echo "Symlink already exists:\t" $f
	fi	
done
}

symAll
