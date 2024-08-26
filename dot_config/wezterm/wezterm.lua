local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.audible_bell = "Disabled"
config.color_scheme = "Tomorrow Night"
config.exit_behavior = "CloseOnCleanExit"
config.font = wezterm.font("JetBrains Mono NL")
config.font_size = 16.0
config.hide_tab_bar_if_only_one_tab = true
config.initial_cols = 88
config.initial_rows = 44
config.quit_when_all_windows_are_closed = false
config.scrollback_lines = 10000
config.swallow_mouse_click_on_pane_focus = true

return config
