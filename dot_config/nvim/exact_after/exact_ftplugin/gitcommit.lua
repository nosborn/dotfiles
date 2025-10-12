vim.opt_local.colorcolumn = '72'
vim.opt_local.textwidth = 72

local undo = 'setlocal colorcolumn< textwidth<'
if vim.b.undo_ftplugin then
    vim.b.undo_ftplugin = vim.b.undo_ftplugin .. ' | ' .. undo
else
    vim.b.undo_ftplugin = undo
end

-- Warning if first line is too long.
-- match ErrorMsg /\%1l.\%>51v/
