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
      {
        "branch",
        icon = "",
        icons_enabled = true,
      },
      "diff",
      {
        "diagnostics",
        icons_enabled = true,
      },
    },
    lualine_c = {
      {
        "filename",
        newfile_status = true,
        path = 1,
      },
    },
    lualine_x = {
      "encoding",
      {
        "fileformat",
        icons_enabled = true,
      },
      {
        "filetype",
        icons_enabled = true,
      },
    },
  },
})
