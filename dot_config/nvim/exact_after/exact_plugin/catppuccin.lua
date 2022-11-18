require("catppuccin").setup({
  flavour = "mocha",
  custom_highlights = function(colors)
    return {
      Comment = {
        fg = colors.overlay0,
      },
    }
  end,
  integrations = {
    treesitter = true,
  },
})

vim.cmd.colorscheme("catppuccin")
