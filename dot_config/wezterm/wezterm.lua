local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.audible_bell = "Disabled"
config.check_for_updates = false
config.color_scheme = "tokyonight_night"
config.enable_tab_bar = false
config.font = wezterm.font("JetBrains Mono NL")
config.font_size = 18
config.initial_cols = 88
config.initial_rows = 44

return config
