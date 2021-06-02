require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  ignore_install = {},
  matchup = {
    enable = true,
  },
  highlight = {
    enable = true
  },
  context_commentstring = {
    enable = true,
    config = {
      css = '// %s'
    }
  },
  -- indent = {enable = true, disable = {"python", "html", "javascript"}},
  -- TODO seems to be broken
  indent = {enable = {"javascriptreact"}},
  autotag = {enable = true},
}
