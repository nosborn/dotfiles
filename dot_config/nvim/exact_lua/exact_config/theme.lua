require("tokyonight").setup({
  style = "night",
})

local colors = require("tokyonight.util").colors

require("tiny-devicons-auto-colors").setup({
  colors = colors,
})

vim.cmd.colorscheme("tokyonight")
