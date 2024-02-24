local filetypedetect = vim.api.nvim_create_augroup("filetypedetect", { clear = true })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = ".envrc.ignore",
  group = filetypedetect,
  command = "set filetype=direnv",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.env",
  group = filetypedetect,
  command = "set filetype=dottenv syntax=sh",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "dot_editorconfig",
  group = filetypedetect,
  command = "set filetype=editorconfig",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = ".chezmoiignore,.markdownlintignore,.prettierignore",
  group = filetypedetect,
  command = "set filetype=gitignore",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = ".markdownlintrc",
  group = filetypedetect,
  command = "set filetype=json",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "tsconfig.json",
  group = filetypedetect,
  command = "set filetype=jsonc",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "ansible-lint,.prettierrc,.yamllint",
  group = filetypedetect,
  command = "set filetype=yaml",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "CODEOWNERS,unbound.conf.d/*.conf.j2,unbound.conf.j2",
  group = filetypedetect,
  command = "set noexpandtab shiftwidth=8 tabstop=8",
})
