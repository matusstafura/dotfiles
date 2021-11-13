# run tmux on startup
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# load custom .dotfiles
[ -f ~/.dotfiles/.aliases ] && source ~/.dotfiles/.aliases
[ -f ~/.dotfiles/.mycnf ] && source ~/.dotfiles/.mycnf

export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# PATHS
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/php@7.4/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"
#export PATH="/usr/local/opt/php/bin:$PATH"
#export PATH="/usr/local/opt/php/sbin:$PATH"

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/mariadb@10.1/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH=~/.composer/vendor/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
