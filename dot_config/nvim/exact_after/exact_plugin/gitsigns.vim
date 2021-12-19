lua <<EOT
require("gitsigns").setup({
  current_line_blame_opts = {
    delay = 500,
  },
  current_line_blame_formatter_opts = {
    relative_time = true,
  },
})
EOT
