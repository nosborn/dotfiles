scriptencoding utf-8

lua <<EOT
require('gitsigns').setup({
  current_line_blame_formatter_opts = {
    relative_time = true
  }
})
EOT
