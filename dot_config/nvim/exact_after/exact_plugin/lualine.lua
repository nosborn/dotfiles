require("lualine").setup({
  options = {
    icons_enabled = false,
    theme = "catppuccin",
    component_separators = "│",
    section_separators = "",
    globalstatus = true,
  },
  sections = {
    lualine_b = {
      { "branch", icon = "", icons_enabled = true },
      "diff",
      { "diagnostics", icons_enabled = true },
    },
    lualine_x = {
      "encoding",
      "fileformat",
      { "filetype", icons_enabled = true },
    },
  },
})
