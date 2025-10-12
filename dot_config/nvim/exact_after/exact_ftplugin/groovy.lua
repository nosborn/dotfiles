vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4

local undo = 'setlocal shiftwidth< tabstop<'
if vim.b.undo_ftplugin then
    vim.b.undo_ftplugin = vim.b.undo_ftplugin .. ' | ' .. undo
else
    vim.b.undo_ftplugin = undo
end
