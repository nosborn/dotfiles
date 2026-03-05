vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2

vim.wo.wrap = true
vim.wo.linebreak = true

-- Stolen from https://github.com/plasticboy/vim-markdown
local function tableFormat()
    local pos = vim.fn.getpos('.')
    vim.cmd('normal! {')
    -- Search instead of `normal! j` because of the table at beginning of file edge case.
    vim.fn.search('|')
    vim.cmd('normal! j')
    -- Remove everything that is not a pipe, colon or hyphen next to a colon otherwise well formatted tables would grow
    -- because of addition of 2 spaces on the separator line by Tabularize /|.
    local flags = vim.o.gdefault and '' or 'g'
    vim.cmd('s/\\(:\\@<!-:\\@!\\|[^|:-]\\)//e' .. flags)
    vim.cmd('s/--/-/e' .. flags)
    vim.cmd('Tabularize /|')
    -- Move colons for alignment to left or right side of the cell.
    vim.cmd('s/:\\( \\+\\)|/\\1:|/e' .. flags)
    vim.cmd('s/|\\( \\+\\):/|:\\1/e' .. flags)
    vim.cmd('s/ /-/' .. flags)
    vim.cmd('s/|-/| /' .. flags)
    vim.cmd('s/-|/ |/' .. flags)
    vim.fn.setpos('.', pos)
end
vim.api.nvim_buf_create_user_command(0, 'TableFormat', tableFormat, {})
