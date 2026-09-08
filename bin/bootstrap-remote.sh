#!/usr/bin/env bash
# Minimal environment bootstrap for remote servers (e.g. Laravel boxes).
# Installs: zsh + oh-my-zsh + powerlevel10k (default shell), vim + vimrc + vim-plug.
# Does NOT install: neovim, tmux, wezterm, i3/hypr/waybar/rofi, or any desktop stuff.
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/matusstafura/dotfiles/main/bin/bootstrap-remote.sh | bash
# or, if already cloned:
#   ~/dotfiles/bin/bootstrap-remote.sh

set -euo pipefail

DOTFILES_REPO="${DOTFILES_REPO:-https://github.com/matusstafura/dotfiles.git}"
DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"

if [ "$(id -u)" -eq 0 ]; then
  SUDO=""
else
  SUDO="sudo"
fi

log() { printf '\n\033[1;32m==>\033[0m %s\n' "$1"; }

log "Installing base packages (git, curl, zsh, vim)"
if command -v apt-get >/dev/null 2>&1; then
  export DEBIAN_FRONTEND=noninteractive
  $SUDO apt-get update
  $SUDO apt-get install -y git curl zsh vim
else
  echo "apt-get not found; make sure git, curl, zsh and vim are installed manually" >&2
fi

if [ -d "$DOTFILES_DIR/.git" ]; then
  log "Updating existing dotfiles checkout at $DOTFILES_DIR"
  git -C "$DOTFILES_DIR" pull --ff-only || echo "warning: git pull failed, continuing with existing checkout" >&2
else
  log "Cloning dotfiles to $DOTFILES_DIR"
  git clone --depth=1 "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

cd "$DOTFILES_DIR"

if [ -d "$HOME/.oh-my-zsh" ]; then
  log "oh-my-zsh already installed"
else
  log "Installing oh-my-zsh"
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
P10K_DIR="$ZSH_CUSTOM/themes/powerlevel10k"

if [ -d "$P10K_DIR" ]; then
  log "powerlevel10k already installed"
else
  log "Installing powerlevel10k"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
fi

link() {
  local src="$1" dst="$2"
  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    return
  fi
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    mv "$dst" "$dst.bak.$(date +%s)"
  fi
  ln -s "$src" "$dst"
}

log "Linking configs (.zshrc, .p10k.zsh, .vimrc)"
link "$DOTFILES_DIR/zsh/zshrc.remote" "$HOME/.zshrc"
link "$DOTFILES_DIR/zsh/p10k.zsh" "$HOME/.p10k.zsh"
link "$DOTFILES_DIR/vim/vimrc" "$HOME/.vimrc"

log "Installing vim-plug"
curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

log "Installing vim plugins"
vim -es -c "PlugInstall --sync" -c "qa" || true

ZSH_BIN="$(command -v zsh)"
if [ "${SHELL:-}" != "$ZSH_BIN" ]; then
  log "Setting zsh as the default shell"
  if ! grep -qx "$ZSH_BIN" /etc/shells 2>/dev/null; then
    echo "$ZSH_BIN" | $SUDO tee -a /etc/shells >/dev/null
  fi
  $SUDO chsh -s "$ZSH_BIN" "$(whoami)"
fi

log "Done. Run 'exec zsh' (or reconnect) to start using your new shell."
