# dotfiles

Personal dotfiles and setup scripts.

Includes configurations for:
- zsh
- neovim
- tmux
- wezterm
- i3wm
- polybar
- rofi
- vimrc
- p10k

## Installation

### Packages first

- Fedora

```bash
./install-packages.sh
```

### Basic desktop setup
```bash
git clone git@github.com:matusstafura/dotfiles.git
./install.sh
```

For systemd services, enable them with:

```bash
./install-systemd.sh
```

### Minimal remote server setup (e.g. Laravel boxes)

Installs just zsh + oh-my-zsh + powerlevel10k (set as default shell) and vim + vimrc + vim-plug.
No neovim, tmux, wezterm, or desktop stuff. Works on a fresh Ubuntu/Debian server with nothing
cloned yet:

```bash
curl -fsSL https://raw.githubusercontent.com/matusstafura/dotfiles/main/bin/bootstrap-remote.sh | bash
```

Or, if you already cloned the repo to `~/dotfiles`:

```bash
~/dotfiles/bin/bootstrap-remote.sh
```

The script is idempotent — safe to re-run on the same box.

