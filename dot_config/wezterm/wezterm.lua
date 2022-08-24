local wezterm = require("wezterm")

return {
  audible_bell = "Disabled",
  check_for_updates = false,
  color_scheme = "Catppuccin Mocha",
  font_size = 18.0,
  harfbuzz_features = {
    "calt=0",
    "clig=0",
    "liga=0",
  },
  hide_tab_bar_if_only_one_tab = true,
  initial_cols = 88,
  initial_rows = 40,
  scrollback_lines = 5000,
  set_environment_variables = {
    TERMINFO_DIRS = os.getenv("HOME") .. "/.local/share/terminfo",
  },
  term = "wezterm",
  -- window_frame = {
  --   font = wezterm.font({ family = "SF Pro", weight = "Bold" }),
  -- },
}
