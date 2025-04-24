-- vim.g.mapleader = ' '

vim.o.breakindent = true
vim.o.completeopt = 'menuone,noselect'
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.fillchars = 'eob: '
vim.o.formatoptions = 'qjl1'
vim.o.ignorecase = true
vim.o.infercase = true
vim.o.laststatus = 3
vim.o.linebreak = true
vim.o.list = true
vim.o.listchars = 'extends:…,nbsp:␣,precedes:…,tab:» ,trail:·'
vim.o.mouse = 'a'
vim.o.number = true
vim.o.pumblend = 10
vim.o.pumheight = 10
vim.o.ruler = false
vim.o.shiftwidth = 4
vim.o.showmode = false
vim.o.signcolumn = 'yes'
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.spelllang = 'en_gb'
vim.o.splitbelow = true
vim.o.splitkeep = 'screen'
vim.o.splitright = true
vim.o.tabstop = 4
vim.o.virtualedit = 'block'
vim.o.winblend = 10
vim.o.wrap = false
vim.o.writebackup = false

vim.opt.shortmess:append('WcC')

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlights on search' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', 'gj', 'j')
vim.keymap.set('n', 'gk', 'k')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     if client:supports_method('textDocument/completion') then
--       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--     end
--   end,
-- })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.diagnostic.config({
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.HINT] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.WARN] = '',
    },
  },
  underline = false,
  virtual_lines = true,
})

require('moonfly')
vim.cmd.colorscheme('moonfly')

require('ibl').setup({
  scope = {
    enabled = false,
  },
})

require('mini.diff').setup()
require('mini.git').setup()

require('mini.hipatterns').setup({
  highlighters = {
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
    note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
    todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
  },
})

require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons()

require('mini.indentscope').setup({
  symbol = '┊',
})

require('mini.notify').setup({
  window = {
    config = function()
      local has_statusline = vim.o.laststatus > 0
      local pad = vim.o.cmdheight + (has_statusline and 1 or 0)
      return { anchor = 'SE', col = vim.o.columns, row = vim.o.lines - pad }
    end,
  },
})
MiniNotify.make_notify()

require('lualine').setup({
  options = {
    component_separators = { left = '│', right = '│' },
    globalstatus = true,
    section_separators = { left = '', right = '' },
  },
  sections = {
    -- lualine_a = {
    --   'mode',
    --   function()
    --     local schema = require('yaml-companion').get_buf_schema(0)
    --     if schema.result[1].name == 'none' then
    --       return 'none' -- FIXME
    --     end
    --     return schema.result[1].name
    --   end,
    -- },
    lualine_b = {
      {
        'branch',
        cond = function()
          return vim.fn.winwidth(0) > 80
        end,
        icon = '',
      },
      {
        'diff',
        cond = function()
          return vim.fn.winwidth(0) > 80
        end,
        symbols = {
          added = ' ',
          modified = ' ',
          removed = ' ',
        },
      },
      'diagnostics',
    },
  },
})

require('nvim-treesitter.configs').setup({
  auto_install = true,
  ensure_installed = {
    'bash',
    'git_config',
    'gotmpl',
    'ini',
    'json',
    'lua',
    'markdown',
    'markdown_inline',
    'terraform',
    'yaml',
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { 'ruby' },
  },
  -- indent = { enable = true, disable = { "ruby" } },
})
require('nvim-treesitter.parsers').get_parser_configs().d2 = {
  filetype = 'd2',
  install_info = {
    files = {
      'src/parser.c',
      'src/scanner.cc',
    },
    revision = 'main',
    url = 'https://github.com/pleshevskiy/tree-sitter-d2',
  },
}
require('nvim-treesitter.parsers').get_parser_configs().river = {
  install_info = {
    branch = 'main',
    files = {
      'src/parser.c',
    },
    generate_requires_npm = false,
    requires_generate_from_grammar = false,
    url = 'https://github.com/grafana/tree-sitter-river.git',
  },
}

-- require('gitsigns').setup({
--   current_line_blame = true,
--   numhl = true,
--   word_diff = true,
-- })

require('lint').linters_by_ft = {
  actionlint = { 'actionlint' },
  dockerfile = { 'hadolint' },
  dotenv = { 'dotenv_linter' },
  json = { 'jsonlint' },
  make = { 'checkmake' },
  markdown = { 'markdownlint' },
  ruby = { 'ruby' },
  sh = { 'shellcheck' },
  vim = { 'vint' },
  yaml = { 'yamllint' },
}
do
  local augroup = vim.api.nvim_create_augroup('lint', { clear = true })
  vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
    group = augroup,
    callback = function()
      require('lint').try_lint()
    end,
  })
end

require('conform').setup({
  format_on_save = {
    lsp_format = 'fallback',
    timeout_ms = 500,
  },
  formatters = {
    alloy_fmt = {
      command = 'alloy',
      args = { 'fmt', '-' },
      stdin = true,
    },
    packer_fmt = {
      command = 'packer',
      args = { 'fmt', '-' },
      stdin = true,
    },
  },
  formatters_by_ft = {
    hcl = { 'packer_fmt', 'squeeze_blanks', 'trim_newlines', 'trim_whitespace' },
    ini = { 'squeeze_blanks', 'trim_newlines', 'trim_whitespace' },
    lua = { 'stylua', 'squeeze_blanks', 'trim_newlines', 'trim_whitespace' },
    markdown = { 'prettier', 'squeeze_blanks', 'trim_newlines', 'trim_whitespace' },
    river = { 'alloy_fmt', 'squeeze_blanks', 'trim_newlines', 'trim_whitespace' },
    sh = { 'shfmt', 'squeeze_blanks', 'trim_newlines', 'trim_whitespace' },
    toml = { 'squeeze_blanks', 'trim_newlines', 'trim_whitespace' },
    txt = { 'squeeze_blanks', 'trim_newlines', 'trim_whitespace' },
    vim = { 'squeeze_blanks', 'trim_newlines', 'trim_whitespace' },
    yaml = { 'yamlfmt' },
  },
})
require('conform').formatters.shfmt = {
  prepend_args = { '-i', '2', '-ci' },
}

require('virt-column').setup({
  virtcolumn = '+1,80',
})

vim.lsp.enable('terraformls')

-- vim.lsp.config('yamlls', {
--   require('yaml-companion').setup({
--     lspconfig = {
--       -- flags = {
--       --   debounce_text_changes = 150,
--       -- },
--       settings = {
--         redhat = {
--           telemetry = {
--             enabled = false,
--           },
--         },
--         yaml = {
--           format = {
--             enable = true,
--           },
--           hover = true,
--           schemaDownload = {
--             enable = true,
--           },
--           schemaStore = {
--             enable = true,
--             url = 'https://www.schemastore.org/api/json/catalog.json',
--           },
--           schemas = {},
--           trace = {
--             server = 'debug',
--           },
--           validate = true,
--         },
--       },
--     },
--   }),
-- })
-- vim.lsp.enable('yamlls')

-- set encoding=UTF-8
-- scriptencoding utf-8
--
-- filetype plugin indent on
-- syntax enable
--
-- set backspace=indent,eol,start
-- set completeopt+=longest
-- set display+=lastline
-- set display+=truncate
-- set list
-- set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
-- set mouse=a
-- set noshowmode
-- set nostartofline
-- set noswapfile
-- set nowrap
-- set nrformats-=octal
-- " set omnifunc=ale#completion#OmniFunc
-- set scrolloff=2
-- set sessionoptions-=options
-- set showmatch
-- set sidescrolloff=5
-- set signcolumn=yes
-- set tabpagemax=50
-- set updatetime=100
-- set viewoptions-=options
-- set viminfo-=!
-- set wildmenu
-- set wildoptions=pum
--
-- if executable('rg')
--   set grepformat=%f:%l:%c:%m,%f:%l:%m
--   set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
-- endif
--
-- nmap [D :ALEFirst<CR>
-- nmap ]D :ALELast<CR>
-- nmap [d :ALEPreviousWrap<CR>
-- nmap ]d :ALENextWrap<CR>
--
-- let g:ansible_extra_keywords_highlight = 1
-- let g:ansible_name_highlight = 'd'
-- let g:ansible_template_syntaxes = {
--   \   '*.conf.j2':      'conf',
--   \   '*.ini.j2':       'dosini',
--   \   '*.json.j2':      'json',
--   \   '*.php.j2':       'php',
--   \   '*.sh.j2':        'sh',
--   \   '*.yaml.j2':      'yaml',
--   \   '*.yml.j2':       'yaml',
--   \   'Dockerfile.j2':  'dockerfile',
--   \   'my.cnf.j2':      'dosini',
--   \   'named.conf.j2':  'named',
--   \   'nginx.conf.j2':  'nginx',
--   \   'smb.conf.j2':    'dosini',
--   \   'sshd_config.j2': 'sshdconfig',
--   \ }
-- let g:ansible_unindent_after_newline = 1
--
-- let g:bash_is_sh = 1
--
-- let g:is_posix = 1 " modified
--
-- let g:gitgutter_map_keys = 0
-- " let g:gitgutter_preview_win_floating = 1
-- " let g:gitgutter_set_sign_backgrounds = 1
-- let g:gitgutter_sign_added = '┃'
-- let g:gitgutter_sign_modified = '┃'
-- " let g:gitgutter_sign_modified_removed = '~'
-- let g:gitgutter_sign_removed = '▁'
-- " let g:gitgutter_sign_removed_above_and_below = '{'
-- let g:gitgutter_sign_removed_first_line = '▔'
--
-- " let g:gitgutter_sign_priority = 9
--
-- nmap ]c <Plug>(GitGutterNextHunk)
-- nmap [c <Plug>(GitGutterPrevHunk)
--
-- let g:lightline = {
--       \   'active': {
--       \     'left': [
--       \       ['mode', 'paste'],
--       \       ['gitbranch', 'githunks', 'readonly', 'filename', 'modified'],
--       \     ],
--       \     'right': [
--       \       ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
--       \       ['lineinfo'],
--       \       ['percent'],
--       \       ['fileformat', 'fileencoding', 'filetype'],
--       \     ]
--       \   },
--       \   'colorscheme': 'tokyonight_night',
--       \   'component_function': {
--       \     'gitbranch': 'lightline#custom#gitbranch',
--       \     'githunks': 'lightline#custom#githunks',
--       \     'readonly': 'lightline#custom#readonly',
--       \   },
--       \   'subseparator': {
--       \     'left': '│',
--       \     'right': '│',
--       \   }
--       \ }
-- let g:lightline.component_expand = {
--       \   'linter_checking': 'lightline#ale#checking',
--       \   'linter_errors': 'lightline#ale#errors',
--       \   'linter_infos': 'lightline#ale#infos',
--       \   'linter_ok': 'lightline#ale#ok',
--       \   'linter_warnings': 'lightline#ale#warnings',
--       \ }
-- let g:lightline.component_type = {
--       \   'linter_checking': 'right',
--       \   'linter_errors': 'error',
--       \   'linter_infos': 'right',
--       \   'linter_ok': 'right',
--       \   'linter_warnings': 'warning',
--       \ }
-- let g:lightline#ale#indicator_checking = '⋯' " "\uf110"
-- let g:lightline#ale#indicator_ok = '✓'
--
-- let g:markdown_fenced_languages = [
--       \   'bash=sh',
--       \   'gitconfig',
--       \   'json',
--       \   'sh',
--       \   'terraform',
--       \   'yaml',
--       \   'zsh=sh',
--       \ ]
-- let g:markdown_syntax_conceal = 0
--
-- let g:netrw_banner = 0
--
-- let g:vim_json_conceal = 0
--
-- let g:vim_markdown_conceal = 0
-- let g:vim_markdown_folding_disabled = 1
--
-- colorscheme tokyonight-night
--
-- if $TERM ==# 'xterm-ghostty'
--   let &t_Cs = "\e[4:3m"
--   let &t_Ce = "\e[4:0m"
--   highlight SpellBad cterm=undercurl term=underline
-- else
--   highlight SpellBad cterm=underline term=underline
-- endif
--
-- if executable('ansible-vault')
--   function AnsibleVaultDecrypt()
--     let s:header = split(getline(1), ';')
--     let b:ansible_vault_id = len(s:header) > 3 ? s:header[3] : 'default'
--     silent %!ansible-vault decrypt
--   endfunction
--
--   function AnsibleVaultEncrypt()
--     execute 'silent %!ansible-vault encrypt --encrypt-vault-id='.b:ansible_vault_id
--   endfunction
--
--   augroup ansible-vault
--     autocmd!
--     autocmd BufReadPre,FileReadPre */ansible/**/vault.yml setlocal nobackup noswapfile noundofile viminfo=
--     autocmd BufReadPre,FileReadPre */group_vars/*/vault.yml setlocal nobackup noswapfile noundofile viminfo=
--     autocmd BufReadPre,FileReadPre */host_vars/*/vault.yml setlocal nobackup noswapfile noundofile viminfo=
--     autocmd BufReadPre,FileReadPre */vars/vault.yml setlocal nobackup noswapfile noundofile viminfo=
--     autocmd BufReadPost,FileReadPost */group_vars/*/vault.yml call AnsibleVaultDecrypt()
--     autocmd BufReadPost,FileReadPost */host_vars/*/vault.yml call AnsibleVaultDecrypt()
--     autocmd BufReadPost,FileReadPost */vars/vault.yml call AnsibleVaultDecrypt()
--     autocmd BufWritePre,FileWritePre */group_vars/*/vault.yml call AnsibleVaultEncrypt()
--     autocmd BufWritePre,FileWritePre */host_vars/*/vault.yml call AnsibleVaultEncrypt()
--     autocmd BufWritePre,FileWritePre */vars/vault.yml call AnsibleVaultEncrypt()
--     autocmd BufWritePost,FileWritePost */ansible/**/vault.yml silent undo
--     autocmd BufWritePost,FileWritePost */group_vars/*/vault.yml silent undo
--     autocmd BufWritePost,FileWritePost */host_vars/*/vault.yml silent undo
--     autocmd BufWritePost,FileWritePost */vars/vault.yml silent undo
--   augroup END
-- endif
