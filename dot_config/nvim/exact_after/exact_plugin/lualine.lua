require("lualine").setup({
  options = {
    theme = "tokyonight",
    component_separators = "│",
    section_separators = "",
    globalstatus = true,
  },
  sections = {
    lualine_b = {
      {
        "branch",
        cond = function()
          return vim.fn.winwidth(0) > 80
        end,
        icon = "",
        -- icons_enabled = true,
      },
      {
        "diff",
        cond = function()
          return vim.fn.winwidth(0) > 80
        end,
        symbols = { added = " ", modified = " ", removed = " " },
      },
      "diagnostics",
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
      "fileformat",
      "filetype",
    },
  },
})
