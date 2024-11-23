local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config = {
    color_scheme = "Catppuccin Mocha",
    font = wezterm.font('JetBrains Mono'),
    font_size = 15.0,
    line_height = 1.3,
    audible_bell = "Disabled",
    default_prog = { "tmux" },
    window_padding = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0,
    }
}

return config
