local group = vim.api.nvim_create_augroup("filetypedetect", { clear = true })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.env",
  group = group,
  command = "set filetype=dottenv syntax=sh",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = ".envrc.ignore",
  group = group,
  command = "set filetype=direnv",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = ".chezmoiignore,.markdownlintignore,.prettierignore",
  group = group,
  command = "set filetype=gitignore",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = ".markdownlintrc",
  group = group,
  command = "set filetype=json",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "tsconfig.json",
  group = group,
  command = "set filetype=jsonc",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "ansible-lint,.prettierrc,.yamllint",
  group = group,
  command = "set filetype=yaml",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "CODEOWNERS,unbound.conf.d/*.conf.j2,unbound.conf.j2",
  group = group,
  command = "set noexpandtab shiftwidth=8 tabstop=8",
})
