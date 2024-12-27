local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.audible_bell = "Disabled"
config.color_scheme = "tokyonight_night"

config.color_scheme_dirs = {
  os.getenv("HOME") .. ".local/share/nvim/site/pack/folke/start/tokyonight.nvim/extras/wezterm"
}

config.font_size = 16.0
config.hide_tab_bar_if_only_one_tab = true
config.initial_cols = 88
config.initial_rows = 44
config.quit_when_all_windows_are_closed = false
config.scrollback_lines = 10000

return config
