local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local target_os = wezterm.target_triple

config.color_scheme = "Catppuccin Latte"
config.font = wezterm.font('JetBrains Mono')
config.font_size = 15.0
config.line_height = 1.4
config.audible_bell = "Disabled"
config.default_prog = { "/bin/zsh", "-l", "-c", "tmux" }
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

colors = {
  ansi = '#000000'
}

if string.find(target_os, "darwin") then
  config.font_size = 15.0
  config.line_height = 1.4
end

return config
