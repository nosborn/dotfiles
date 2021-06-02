require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = {"haskell"},
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
