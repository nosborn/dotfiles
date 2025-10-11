scriptencoding utf8

let g:mapleader = ' '

set autoindent
" set clipboard=unnamed,unnamedplus
set completeopt=fuzzy,menuone,noselect
set cursorline
" set cursorlineopt=number
set expandtab
set foldenable
set foldlevelstart=99
set guicursor=n-v-i-c:block-Cursor
set ignorecase
" set laststatus=3
set list
set listchars=tab:⇥\ ,extends:…,precedes:…,nbsp:␣
set mouse=a
set noshowmode
set noswapfile
set number
" set pumblend=10 " make builtin completion menus slightly transparent
" set pumheight=10 " make popup menu smaller
" set relativenumber
" set scrolloff=10
set shiftwidth=2
set signcolumn=yes
set smartcase
" set spelllang=en_gb
set spelloptions=camel
set tabstop=2
" set updatetime=1000
" set winblend=10 " make floating windows slightly transparent
" set winborder=bold
" set winhighlight=NormalNC:CursorLine

" vim.g.health = { style = 'float' }
let g:loaded_perl_provider = 0
let g:loaded_python_provider = 0
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0
let g:netrw_banner = 0

" Clear highlights on search.
nnoremap <Esc> :nohlsearch<CR>

" Better up/down.
nnoremap <expr> <Down> v:count == 0 ? 'gj' : 'j'
xnoremap <expr> <Down> v:count == 0 ? 'gj' : 'j'
nnoremap <expr> <Up>   v:count == 0 ? 'gk' : 'k'
xnoremap <expr> <Up>   v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j      v:count == 0 ? 'gj' : 'j'
xnoremap <expr> j      v:count == 0 ? 'gj' : 'j'
nnoremap <expr> k      v:count == 0 ? 'gk' : 'k'
xnoremap <expr> k      v:count == 0 ? 'gk' : 'k'

" Move to window using the <ctrl> hjkl keys.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Better indenting.
xnoremap < <gv
xnoremap > >gv

" Insert mode.
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-k> <C-o>C

" Command mode.
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

lua <<EOT
vim.lsp.enable({
  'golangci_lint_ls',
  'gopls',
  'terraformls',
  'tflint',
})
EOT

lua <<EOT
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/implementation') then
            -- Create a keymap for vim.lsp.buf.implementation ...
        end
        -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
        if client:supports_method('textDocument/completion') then
            -- Optional: trigger autocompletion on EVERY keypress. May be slow!
            -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
            -- client.server_capabilities.completionProvider.triggerCharacters = chars
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end
        -- Auto-format ("lint") on save.
        -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
        if not client:supports_method('textDocument/willSaveWaitUntil')
           and client:supports_method('textDocument/formatting')
        then
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('lsp-attach', { clear = false }),
                buffer = args.buf,
                callback = function() vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 }) end,
            })
        end
        -- if client.server_capabilities.inlayHintProvider then
        --     vim.lsp.inlay_hint.enable(true, args.buf)
        -- end
        -- Organize imports for gopls before save
        if client.name == 'gopls' then
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('gopls-imports', { clear = true }),
                buffer = args.buf,
                callback = function()
                    local params = vim.lsp.util.make_range_params(nil, client.offset_encoding)
                    params.context = { only = { 'source.organizeImports' } }
                    local result = vim.lsp.buf_request_sync(args.buf, 'textDocument/codeAction', params, 3000)
                    for _, res in pairs(result or {}) do
                        for _, r in pairs(res.result or {}) do
                            if r.edit then
                                vim.lsp.util.apply_workspace_edit(r.edit, client.offset_encoding)
                            end
                        end
                    end
                end,
            })
        end
    end,
})
EOT

lua <<EOT
local map_multistep = require('mini.keymap').map_multistep
map_multistep('i', '<Tab>', { 'pmenu_next' })
map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
map_multistep('i', '<BS>', { 'minipairs_bs' })
EOT

augroup color-scheme
  autocmd!
  autocmd ColorScheme catppuccin highlight! link WinSeparator FloatBorder
  autocmd ColorScheme default,retrobox,sorbet,wildcharm,zaibatsu highlight Comment cterm=italic gui=italic
augroup END

lua <<EOT
require('kanso').setup({
    background = {
        dark = 'zen',
        light = 'pearl',
    },
    compile = true,
    dimInactive = true,
    -- foreground = 'saturated',
})
EOT
colorscheme kanso

lua <<EOT
vim.diagnostic.config({
    -- float = {
    --     border = 'rounded',
    --     source = 'always',
    --     width = 100,
    --     wrap = true,
    --     format = function(diagnostic)
    --         return string.format('[%s] %s', diagnostic.source or 'unknown', diagnostic.message)
    --     end,
    -- },
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
            [vim.diagnostic.severity.INFO] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
        },
    },
    underline = false,
    virtual_text = true,
})
EOT

lua <<EOT
-- -- Show diagnostic popup when cursor moves to a diagnostic
-- vim.api.nvim_create_autocmd('CursorMoved', {
--     desc = 'Show diagnostic popup when navigating to diagnostics',
--     group = vim.api.nvim_create_augroup('diagnostic-popup', { clear = true }),
--     callback = function()
--         local current_line = vim.api.nvim_win_get_cursor(0)[1]
--         local diagnostics = vim.diagnostic.get(0, { lnum = current_line - 1 })
--         if #diagnostics > 0 then
--             -- Small delay to avoid popup spam while navigating
--             vim.defer_fn(function()
--                 if vim.api.nvim_win_get_cursor(0)[1] == current_line then
--                     vim.diagnostic.open_float(nil, { focus = false })
--                 end
--             end, 100)
--         end
--     end,
-- })
EOT

augroup highlight-yank
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup END

if executable('ansible-vault')
  function AnsibleVaultDecrypt()
    let s:header = split(getline(1), ';')
    let b:ansible_vault_id = len(s:header) > 3 ? s:header[3] : 'default'
    silent %!ansible-vault decrypt
  endfunction

  function AnsibleVaultEncrypt()
    execute 'silent %!ansible-vault encrypt --encrypt-vault-id='.b:ansible_vault_id
  endfunction

  augroup ansible-vault
    autocmd!
    autocmd BufReadPre,FileReadPre */group_vars/*/vault.yaml setlocal nobackup noswapfile noundofile viminfo=
    autocmd BufReadPre,FileReadPre */host_vars/*/vault.yaml setlocal nobackup noswapfile noundofile viminfo=
    autocmd BufReadPre,FileReadPre */vars/vault.yaml setlocal nobackup noswapfile noundofile viminfo=
    autocmd BufReadPost,FileReadPost */group_vars/*/vault.yaml call AnsibleVaultDecrypt()
    autocmd BufReadPost,FileReadPost */host_vars/*/vault.yaml call AnsibleVaultDecrypt()
    autocmd BufReadPost,FileReadPost */vars/vault.yaml call AnsibleVaultDecrypt()
    autocmd BufWritePre,FileWritePre */group_vars/*/vault.yaml call AnsibleVaultEncrypt()
    autocmd BufWritePre,FileWritePre */host_vars/*/vault.yaml call AnsibleVaultEncrypt()
    autocmd BufWritePre,FileWritePre */vars/vault.yaml call AnsibleVaultEncrypt()
    autocmd BufWritePost,FileWritePost */group_vars/*/vault.yaml silent undo
    autocmd BufWritePost,FileWritePost */host_vars/*/vault.yaml silent undo
    autocmd BufWritePost,FileWritePost */vars/vault.yaml silent undo
  augroup END
endif

" Typing is hard.
cabbrev <expr> w1 getcmdtype() == ':' && getcmdline() == 'w1' ? 'w!' : 'w1'
