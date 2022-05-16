require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
  sync_install = false,
})

vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"

local augroup = vim.api.nvim_create_augroup("folding", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost,FileReadPost", { pattern = "*", group = augroup, command = "normal zR" })
