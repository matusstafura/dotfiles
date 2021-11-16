#!/bin/bash

git clone git@github.com:matusstafura/dotfiles.git ~/.dotfiles

# install packages
sudo apt install tmux fzf -y
cd ~ && curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage && chmod u+x nvim.appimage && sudo mv ./nvim.appimage /usr/bin/nvim

# install zsh and theme p10k
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# replace config files
cd ~ && rm .p10k.zsh .tmux.conf .vimrc .zshrc 
ln -sf ~/.dotfiles/.p10k.zsh ~
ln -sf ~/.dotfiles/.tmux.conf ~
ln -sf ~/.dotfiles/.vimrc ~
ln -sf ~/.dotfiles/.zshrc ~
mkdir -p ~/.config/nvim && ln -sf ~/.dotfiles/init.vim ~/.config/nvim/init.vim

# reload config files
source ~/.zshrc
source ~/.vimrc
tmux source-file ~/.tmux.conf

vim -c 'PlugInstall'
