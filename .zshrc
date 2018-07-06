source ~/.dotfiles/.aliases
source ~/.dotfiles/.mycnf

export ZSH=~/.oh-my-zsh

ZSH_THEME="honukai"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
