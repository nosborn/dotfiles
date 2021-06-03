require('plugins')

require('tree-sitter')

require('lsp')

-- set fillchars=vert:│,fold:·
vim.opt.ignorecase = true
-- set list
vim.opt.listchars = 'tab:»·,trail:▿,nbsp:▿'
vim.opt.mouse = 'nv'
vim.opt.number = true
-- set path=$PWD/**
vim.opt.relativenumber = true
vim.opt.scrolloff = 2
vim.opt.shortmess:append('I')
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.sidescrolloff = 5
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.spell = false
vim.opt.swapfile = false
-- set updatetime=100
vim.opt.wildignore = {
  '**/.git/**', '**/.terraform/**', '**/node_modules/**', '*.class', '*.o',
  '*.obj', '*.pyc', '*.swp', '*.tar.gz', '*.tgz', '*.tmp', '*.zip', '*~',
  '.DS_Store',
}
vim.opt.wrap = false
vim.opt.writebackup = false
