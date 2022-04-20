require("lualine").setup({
  options = {
    icons_enabled = false,
    theme = "gruvbox",
    component_separators = "|",
    section_separators = "",
    globalstatus = true,
  },
  sections = {
    lualine_b = {
      { "branch", icons_enabled = true },
      "diff",
      "diagnostics",
    },
  },
})
