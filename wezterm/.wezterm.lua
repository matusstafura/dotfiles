local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config = {
    color_scheme = "Catppuccino Mocha",
    font = wezterm.font('JetBrains Mono'),
    font_size = 15.0,
    line_height = 1.3,
    audible_bell = "Disabled",
    window_padding = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0,
    }
}

config.colors = {
    color0 = "#5C5F77",
    color1 = "#D20F39",
    color10 = "#40A02B", 
    color11 = "#DF8E1D", 
    color12 = "#1E66F5", 
    color13 = "#EA76CB", 
    color14 = "#179299", 
    color15 = "#BCC0CC", 
    color2  = "#40A02B", 
    color3  = "#DF8E1D", 
    color4  = "#1E66F5", 
    color5  = "#EA76CB", 
    color6  = "#179299", 
    color7  = "#ACB0BE", 
    color8 = "#6C6F85", 
    color9 = "#D20F39", 
}

return config
