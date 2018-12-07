source ~/.dotfiles/.aliases
source ~/.dotfiles/.mycnf
source ~/.dotfiles/.syndicate

export ZSH=~/.oh-my-zsh

#ZSH_THEME="honukai"
ZSH_THEME="cobalt2"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/mariadb@10.1/bin:$PATH"
