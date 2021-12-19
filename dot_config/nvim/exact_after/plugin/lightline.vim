lua << END
require("lualine").setup({
  options = {
    icons_enabled = false,
    theme = 'gruvbox',
    component_separators = '',
    section_separators = ''
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {{'branch', icons_enabled = true}, 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
})
END
