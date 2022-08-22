local wezterm = require("wezterm")

return {
  audible_bell = "Disabled",
  check_for_updates = false,
  color_scheme = "Catppuccin Mocha",
  font = wezterm.font("SauceCodePro Nerd Font Mono"),
  font_size = 18.0,
  hide_tab_bar_if_only_one_tab = true,
  scrollback_lines = 10000,
  -- window_frame = {
  --   font = wezterm.font({ family = "SF Pro", weight = "Bold" }),
  -- },
}
