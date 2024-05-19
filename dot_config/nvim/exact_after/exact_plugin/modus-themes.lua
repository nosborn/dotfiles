require("modus-themes").setup({
  dim_inactive = true,
  style = "auto",
  variant = "default", -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`

  styles = {
    comments = {
      italic = true,
    },
    functions = {},
    keywords = {
      italic = false,
    },
    variables = {},
  },

  on_colors = function(colors) end,

  on_highlights = function(highlights, colors) end,
})

vim.cmd.colorscheme("modus")
