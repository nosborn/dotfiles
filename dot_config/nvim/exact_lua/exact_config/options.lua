--set foldexpr=lua vim.treesitter.foldexpr()
--set foldmethod=expr
--set path=$PWD/**
--set shada-=!
--set tags./tags;,tags
vim.opt.backup = false
vim.opt.colorcolumn = "80"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --smart-case --vimgrep"
vim.opt.ignorecase = true
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars = { nbsp = "▿", tab = "»·", trail = "▿" }
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 2
--vim.opt.shortmess+=I
vim.opt.showcmd = false
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.sidescrolloff = 5
vim.opt.signcolumn = "yes"
vim.opt.smarttab = true
vim.opt.spell = true
vim.opt.spelllang = "en_gb"
vim.opt.spelloptions = "camel,noplainbuffer"
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.ttimeout = true
vim.opt.updatetime = 250
vim.opt.wildignore = {
  "**/.DS_Store",
  "**/.git/**",
  "**/.terraform.d/**",
  "**/.terraform.lock.hcl",
  "**/.terraform/**",
  "**/.terragrunt-cache/**",
  "**/node_modules/**",
  "*.class",
  "*.o",
  "*.obj",
  "*.pyc",
  "*.swp",
  "*.tar.gz",
  "*.tgz",
  "*.tmp",
  "*.zip",
  "*~",
}
vim.opt.wrap = false
vim.opt.writebackup = false
