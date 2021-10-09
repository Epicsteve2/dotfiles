local wezterm = require 'wezterm';

return {
  font = wezterm.font_with_fallback({
    "Monofur Nerd Font",
    "FiraCode Nerd Font"
  }),
  font_size = 26,
  color_scheme = "Monokai Remastered",
  scrollback_lines = 35000,
  enable_scroll_bar = true,
}