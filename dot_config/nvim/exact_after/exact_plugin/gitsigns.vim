scriptencoding utf-8

lua <<EOT
require("gitsigns").setup({
  current_line_blame = true,
  current_line_blame_opts = {
    delay = vim.o.updatetime,
    ignore_whitespace = true,
  },
  current_line_blame_formatter_opts = {
    relative_time = true
  },
})
EOT
