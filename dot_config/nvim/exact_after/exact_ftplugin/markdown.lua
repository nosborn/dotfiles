vim.opt_local.expandtab = true
vim.opt_local.linebreak = true
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.wrap = true

local undo = 'setlocal expandtab< filetype< linebreak< shiftwidth< tabstop< wrap<'
if vim.b.undo_ftplugin then
    vim.b.undo_ftplugin = vim.b.undo_ftplugin .. ' | ' .. undo
else
    vim.b.undo_ftplugin = undo
end

-- Stolen from https://github.com/plasticboy/vim-markdown
local function table_format()
    local pos = vim.fn.getpos('.')
    vim.cmd('normal! {')
    vim.fn.search('|')
    vim.cmd('normal! j')

    local flags = vim.o.gdefault and '' or 'g'

    vim.cmd([[s/\(:\@<!-:\@!\|[^|:-]\)//e]] .. flags)
    vim.cmd([[s/--/-/e]] .. flags)
    vim.cmd([[Tabularize /|]])
    vim.cmd([[s/:\( \+\)|/\1:|/e]] .. flags)
    vim.cmd([[s/|\( \+\):/|:\1/e]] .. flags)
    vim.cmd([[s/ /-/]] .. flags)
    vim.cmd([[s/|-/| /]] .. flags)
    vim.cmd([[s/-|/ |/]] .. flags)

    vim.fn.setpos('.', pos)
end

vim.api.nvim_buf_create_user_command(0, 'TableFormat', table_format, {})
