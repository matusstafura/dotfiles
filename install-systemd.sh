#!/usr/bin/env bash
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Dotfiles Git Update Service
mkdir -p $HOME/.config/systemd/user
ln -sf $DOTFILES/systemd/user/dotfiles-update.service $HOME/.config/systemd/user/dotfiles-update.service
