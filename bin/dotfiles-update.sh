#!/bin/bash
cd "$HOME/dotfiles" || exit 1
/usr/bin/git pull origin main || exit 1

