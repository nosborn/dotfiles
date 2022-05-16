-- " Use <C-L> to clear the highlighting of :set hlsearch.
-- if maparg('<C-L>', 'n') ==# ''
--   nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
-- endif

-- map Q <Nop>

vim.opt.backup = false
vim.opt.fillchars = {
  fold = " ",
}
vim.opt.foldnestmax = 3
vim.opt.foldtext = "getline(v:foldstart).'...'.trim(getline(v:foldend))"
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
-- vim.opt.path = $PWD/**
vim.opt.relativenumber = true
vim.opt.scrolloff = 2
vim.opt.shortmess = vim.opt.shortmess + "I"
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.sidescrolloff = 5
vim.opt.signcolumn = "yes"
vim.opt.smarttab = true
vim.opt.spell = false
vim.opt.spelllang = "en_gb"
vim.opt.swapfile = false
-- vim.opt.tags = './tags;,tags'
vim.opt.ttimeout = true
-- set viminfo-=!
vim.opt.updatetime = 250
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
  "**/.terragrunt-cache/**",
  "**/node_modules/**",
}
vim.opt.wrap = false
vim.opt.writebackup = false

-- inoremap <C-U> <C-G>u<C-U>

-- if !exists(':DiffOrig')
--   command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
--         \ | wincmd p | diffthis
-- endif

vim.g.ansible_extra_keywords_highlight = 1
vim.g.ansible_name_highlight = "d"
vim.g.ansible_template_syntaxes = {
  ["*.conf.j2"] = "conf",
  ["*.ini.j2"] = "dosini",
  ["*.json.j2"] = "json",
  ["*.php.j2"] = "php",
  ["*.sh.j2"] = "sh",
  ["*.service.j2"] = "systemd",
  ["*.yaml.j2"] = "yaml",
  ["*.yml.j2"] = "yaml",
  ["Dockerfile.j2"] = "dockerfile",
  ["my.cnf.j2"] = "dosini",
  ["named.conf.j2"] = "named",
  ["nginx.conf.j2"] = "nginx",
  ["smb.conf.j2"] = "dosini",
  ["sshd_config.j2"] = "sshdconfig",
}
vim.g.ansible_unindent_after_newline = 1

vim.g.bash_is_sh = 1

vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_italic = 1

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
  "terraform",
  "yaml",
  "zsh",
}
vim.g.markdown_syntax_conceal = 0

vim.g.vim_json_conceal = 0

vim.g.vimsyn_embed = "l"

vim.cmd([[colorscheme gruvbox]])

if vim.env.TERM_PROGRAM == "Apple_Terminal" then
  vim.opt.mouse = "a"
  -- let &t_ZH = "\e[3m"
  -- let &t_ZR = "\e[23m"
end

-- function AnsibleVaultDecrypt()
--   let s:header = split(getline(1), ';')
--   let b:ansible_vault_id = len(s:header) > 3 ? s:header[3] : 'default'
--   silent %!ansible-vault decrypt
-- endfunction

-- function AnsibleVaultEncrypt()
--   execute 'silent %!ansible-vault encrypt --encrypt-vault-id='.b:ansible_vault_id
-- endfunction

-- augroup ansible-vault
--   autocmd!
--   autocmd BufReadPre,FileReadPre */ansible/**/vault.yml setlocal nobackup noswapfile noundofile nobackup viminfo=
--   autocmd BufReadPre,FileReadPre */group_vars/*/vault.yml setlocal nobackup noswapfile noundofile nobackup viminfo=
--   autocmd BufReadPre,FileReadPre */host_vars/*/vault.yml setlocal nobackup noswapfile noundofile nobackup viminfo=
--   autocmd BufReadPre,FileReadPre */vars/vault.yml setlocal nobackup noswapfile noundofile nobackup viminfo=
--   autocmd BufReadPost,FileReadPost */group_vars/*/vault.yml call AnsibleVaultDecrypt()
--   autocmd BufReadPost,FileReadPost */host_vars/*/vault.yml call AnsibleVaultDecrypt()
--   autocmd BufReadPost,FileReadPost */vars/vault.yml call AnsibleVaultDecrypt()
--   autocmd BufWritePre,FileWritePre */group_vars/*/vault.yml call AnsibleVaultEncrypt()
--   autocmd BufWritePre,FileWritePre */host_vars/*/vault.yml call AnsibleVaultEncrypt()
--   autocmd BufWritePre,FileWritePre */vars/vault.yml call AnsibleVaultEncrypt()
--   autocmd BufWritePost,FileWritePost */ansible/**/vault.yml silent undo
--   autocmd BufWritePost,FileWritePost */group_vars/*/vault.yml silent undo
--   autocmd BufWritePost,FileWritePost */host_vars/*/vault.yml silent undo
--   autocmd BufWritePost,FileWritePost */vars/vault.yml silent undo
-- augroup END

vim.api.nvim_set_keymap("n", "gj", "j", { noremap = true })
vim.api.nvim_set_keymap("n", "gk", "k", { noremap = true })
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })

local augroup = vim.api.nvim_create_augroup("diagnostics-float", { clear = true })
vim.api.nvim_create_autocmd(
  "CursorHold",
  { pattern = "*", group = augroup, command = "lua vim.diagnostic.open_float()" }
)

vim.diagnostic.config({
  -- virtual_text = {
  --   source = 'if_many',
  --   spacing = 1,
  -- },
  virtual_text = false,
  float = {
    focusable = false,
  },
})

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

-- set wildcharm=<C-Z>
-- cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
-- cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
-- cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
-- cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"

vim.cmd([[
  sign define DiagnosticSignError text=Ⓔ texthl=DiagnosticSignError linehl= numhl=
  sign define DiagnosticSignHint text=Ⓗ texthl=DiagnosticSignHint linehl= numhl=
  sign define DiagnosticSignInfo text=Ⓘ texthl=DiagnosticSignInfo linehl= numhl=
  sign define DiagnosticSignWarn text=Ⓦ texthl=DiagnosticSignWarn linehl= numhl=
]])
