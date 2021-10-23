#!/bin/bash

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

ln -sf ~/.dotfiles/.vimrc ~
ln -sf ~/.dotfiles/.p10k.zsh ~

source ~/.zshrc
source ~/.vimrc
touch ~/.dotfiles/.mycnf

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c 'PlugInstall'
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
