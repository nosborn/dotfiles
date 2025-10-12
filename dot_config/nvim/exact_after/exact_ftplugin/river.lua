vim.opt_local.commentstring = '//%s'
vim.opt_local.expandtab = false
vim.opt_local.shiftwidth = 8
vim.opt_local.tabstop = 8

local undo = 'setlocal commentstring< expandtab< shiftwidth< tabstop<'
if vim.b.undo_ftplugin then
    vim.b.undo_ftplugin = vim.b.undo_ftplugin .. ' | ' .. undo
else
    vim.b.undo_ftplugin = undo
end
