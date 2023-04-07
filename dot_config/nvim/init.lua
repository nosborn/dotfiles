vim.loader.enable()

vim.opt.backup = false
vim.opt.colorcolumn = "80"
vim.opt.foldexpr = "vim.treesitter.foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.ignorecase = true
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars = {
  nbsp = "▿",
  tab = "»·",
  trail = "▿",
}
vim.opt.mouse = "a"
vim.opt.number = true
-- vim.opt.path = "$PWD/**"
vim.opt.relativenumber = true
vim.opt.scrolloff = 2
-- " set shada-=!
vim.opt.shortmess:append("I")
vim.opt.showcmd = false
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.sidescrolloff = 5
vim.opt.signcolumn = "yes"
vim.opt.smarttab = true
vim.opt.spell = true
vim.opt.spelllang = "en_gb"
vim.opt.swapfile = false
-- vim.opt.tags = "./tags;,tags"
vim.opt.termguicolors = true
vim.opt.ttimeout = true
vim.opt.updatetime = 250
vim.opt.wrap = false
vim.opt.wildignore = {
  "*~",
  "*.class",
  "*.o",
  "*.obj",
  "*.pyc",
  "*.swp",
  "*.tar.gz",
  "*.tgz",
  "*.tmp",
  "*.zip",
  "**/.DS_Store",
  "**/.git/**",
  "**/.terraform/**",
  "**/.terraform.d/**",
  "**/.terraform.lock.hcl",
  "**/.terragrunt-cache/**",
  "**/node_modules/**",
}
vim.opt.writebackup = false

vim.g.ansible_extra_keywords_highlight = 1
vim.g.ansible_name_highlight = "d"
-- let g:ansible_template_syntaxes = {
--       \   '*.conf.j2': 'conf',
--       \   '*.ini.j2': 'dosini',
--       \   '*.json.j2': 'json',
--       \   '*.php.j2': 'php',
--       \   '*.sh.j2': 'sh',
--       \   '*.service.j2': 'systemd',
--       \   '*.yaml.j2': 'yaml',
--       \   '*.yml.j2': 'yaml',
--       \   'Dockerfile.j2': 'dockerfile',
--       \   'my.cnf.j2': 'dosini',
--       \   'named.conf.j2': 'named',
--       \   'nginx.conf.j2': 'nginx',
--       \   'smb.conf.j2': 'dosini',
--       \   'sshd_config.j2': 'sshdconfig',
--       \ }
vim.g.ansible_unindent_after_newline = 1

vim.g.bash_is_sh = 1

vim.g.direnv_auto = 0

vim.g.highlight_balanced_quotes = 1
vim.g.highlight_function_names = 1
vim.g.highlight_sedtabs = 1

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.g.markdown_fenced_languages = {
  "bash",
  "gitconfig",
  "hcl",
  "json",
  "sh",
  "terraform=hcl",
  "yaml",
  "zsh",
}
vim.g.markdown_syntax_conceal = 0

vim.g.vim_json_conceal = 0

vim.g.vimsyn_embed = "l"

vim.diagnostic.config({
  float = {
    border = "single",
    focusable = false,
  },
  severity_sort = true,
  underline = false,
  update_in_insert = true,
})

-- " lua <<EOT
-- " vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
-- "   border = "single"
-- " })
-- "
-- " vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
-- "   border = "single",
-- "   focusable = true,
-- "   relative = "cursor"
-- " })
-- "
-- " -- Suppress error messages from language servers.
-- " vim.notify = function(msg, log_level)
-- "   if msg:match "exit code" then
-- "     return
-- "   end
-- "   if log_level == vim.log.levels.ERROR then
-- "     vim.api.nvim_err_writeln(msg)
-- "   else
-- "     vim.api.nvim_echo({ { msg } }, true, {})
-- "   end
-- " end
-- "
-- " -- Borders for LspInfo window.
-- " local win = require "lspconfig.ui.windows"
-- " local _default_opts = win.default_opts
-- "
-- " win.default_opts = function(options)
-- "   local opts = _default_opts(options)
-- "   opts.border = "single"
-- "   return opts
-- " end
-- " EOT

vim.cmd("sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=")
vim.cmd("sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=")
vim.cmd("sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=")
vim.cmd("sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=")

vim.api.nvim_set_keymap("n", "<Leader>fb", "<Cmd>Telescope buffers<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>ff", "<Cmd>Telescope find_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>fg", "<Cmd>Telescope live_grep<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>fh", "<Cmd>Telescope help_tags<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>gp", "<Cmd>Gitsigns preview_hunk<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "[d", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "]d", "<Cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gj", "j", { noremap = true })
vim.api.nvim_set_keymap("n", "gk", "k", { noremap = true })
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })

local ansible_vault_group = vim.api.nvim_create_augroup("AnsibleVault", { clear = true })
vim.api.nvim_create_autocmd({ "BufReadPre", "FileReadPre" }, {
  pattern = "*/group_vars/*/vault.yml",
  command = "setlocal nobackup noswapfile noundofile viminfo=",
  group = ansible_vault_group,
})
vim.api.nvim_create_autocmd({ "BufReadPre", "FileReadPre" }, {
  pattern = "*/host_vars/*/vault.yml",
  command = "setlocal nobackup noswapfile noundofile viminfo=",
  group = ansible_vault_group,
})
vim.api.nvim_create_autocmd({ "BufReadPre", "FileReadPre" }, {
  pattern = "*/vars/*/vault.yml",
  command = "setlocal nobackup noswapfile noundofile viminfo=",
  group = ansible_vault_group,
})
vim.api.nvim_create_autocmd(
  { "BufReadPost", "FileReadPost" },
  { pattern = "*/group_vars/*/vault.yml", command = "call ansible#vault#decrypt()", group = ansible_vault_group }
)
vim.api.nvim_create_autocmd(
  { "BufReadPost", "FileReadPost" },
  { pattern = "*/host_vars/*/vault.yml", command = "call ansible#vault#decrypt()", group = ansible_vault_group }
)
vim.api.nvim_create_autocmd(
  { "BufReadPost", "FileReadPost" },
  { pattern = "*/vars/*/vault.yml", command = "call ansible#vault#decrypt()", group = ansible_vault_group }
)
vim.api.nvim_create_autocmd(
  { "BufWritePre", "FileWritePre" },
  { pattern = "*/group_vars/*/vault.yml", command = "call ansible#vault#encrypt()", group = ansible_vault_group }
)
vim.api.nvim_create_autocmd(
  { "BufWritePre", "FileWritePre" },
  { pattern = "*/host_vars/*/vault.yml", command = "call ansible#vault#encrypt()", group = ansible_vault_group }
)
vim.api.nvim_create_autocmd(
  { "BufWritePre", "FileWritePre" },
  { pattern = "*/vars/*/vault.yml", command = "call ansible#vault#encrypt()", group = ansible_vault_group }
)
vim.api.nvim_create_autocmd(
  { "BufWritePost", "FileWritePost" },
  { pattern = "*/group_vars/*/vault.yml", command = "silent undo", group = ansible_vault_group }
)
vim.api.nvim_create_autocmd(
  { "BufWritePost", "FileWritePost" },
  { pattern = "*/host_vars/*/vault.yml", command = "silent undo", group = ansible_vault_group }
)
vim.api.nvim_create_autocmd(
  { "BufWritePost", "FileWritePost" },
  { pattern = "*/vars/*/vault.yml", command = "silent undo", group = ansible_vault_group }
)

local open_diagnostic_float_group = vim.api.nvim_create_augroup("OpenDiagnosticFloat", { clear = true })
vim.api.nvim_create_autocmd(
  "CursorHold",
  { pattern = "*", command = "lua vim.diagnostic.open_float()", group = open_diagnostic_float_group }
)

local open_folds_group = vim.api.nvim_create_augroup("OpenFolds", { clear = true })
vim.api.nvim_create_autocmd(
  { "BufReadPost", "FileReadPost" },
  { pattern = "*", command = "normal zR", group = open_folds_group }
)

-- " " Use <C-L> to clear the highlighting of :set hlsearch.
-- " if maparg('<C-L>', 'n') ==# ''
-- "   nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
-- " endif
-- "
-- " map Q <Nop>
-- "
-- " inoremap <C-U> <C-G>u<C-U>
-- "
-- " if !exists(':DiffOrig')
-- "   command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
-- "          \ | wincmd p | diffthis
-- " endif
-- "
-- " set wildcharm=<C-Z>
-- " cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
-- " cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
-- " cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
-- " cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"
