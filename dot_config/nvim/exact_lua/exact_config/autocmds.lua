local ansible_vault_group = vim.api.nvim_create_augroup("AnsibleVault", { clear = true })
vim.api.nvim_create_autocmd({ "BufReadPre", "FileReadPre" }, {
  command = "setlocal nobackup noswapfile noundofile viminfo=",
  group = ansible_vault_group,
  pattern = "*/group_vars/*/vault.yml,*/host_vars/*/vault.yml,*/vars/*/vault.yml",
})
vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
  command = "call ansible#vault#decrypt()",
  group = ansible_vault_group,
  pattern = "*/group_vars/*/vault.yml,*/host_vars/*/vault.yml,*/vars/*/vault.yml",
})
local group = vim.api.nvim_create_augroup("AnsibleVault", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePre", "FileWritePre" }, {
  command = "call ansible#vault#encrypt()",
  group = ansible_vault_group,
  pattern = "*/group_vars/*/vault.yml,*/host_vars/*/vault.yml,*/vars/*/vault.yml",
})
vim.api.nvim_create_autocmd({ "BufWritePost", "FileWritePost" }, {
  command = "silent undo",
  group = ansible_vault_group,
  pattern = "*/group_vars/*/vault.yml,*/host_vars/*/vault.yml,*/vars/*/vault.yml",
})

local open_diagnostic_float_group = vim.api.nvim_create_augroup("OpenDiagnosticFloat", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float()
  end,
  group = open_diagnostic_float_group,
  pattern = "*",
})

-- local open_folds_group = vim.api.nvim_create_augroup("OpenFolds", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
--   command = "normal zR",
--   group = open_folds_group,
--   pattern = "*",
-- }
