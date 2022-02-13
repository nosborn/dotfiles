scriptencoding utf-8

lua <<EOT
require'lualine'.setup {
  options = {
    icons_enabled = false,
    theme = 'gruvbox',
  },
  sections = {
    lualine_b = {
      {'branch', icons_enabled = true},
      'diff',
      'diagnostics',
    }
  }
}
EOT
