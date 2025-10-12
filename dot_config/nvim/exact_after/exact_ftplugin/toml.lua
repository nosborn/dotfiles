vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2

local undo = 'setlocal expandtab< shiftwidth< tabstop<'
if vim.b.undo_ftplugin then
    vim.b.undo_ftplugin = vim.b.undo_ftplugin .. ' | ' .. undo
else
    vim.b.undo_ftplugin = undo
end
