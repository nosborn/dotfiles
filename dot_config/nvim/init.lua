require("config/options")
require("config/lsp")

vim.g.ansible_extra_keywords_highlight = 1
vim.g.ansible_name_highlight = "d"
vim.g.ansible_template_syntaxes = {
  ["*.conf.j2"] = "conf",
  ["*.ini.j2"] = "dosini",
  ["*.json.j2"] = "json",
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
  "terraform",
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
-- " EOT

-- " lua <<EOT
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

vim.cmd([[
  sign define DiagnosticSignError text=󰅚 texthl=DiagnosticSignError linehl= numhl=
  sign define DiagnosticSignHint text=󰌶 texthl=DiagnosticSignHint linehl= numhl=
  sign define DiagnosticSignInfo text=󰋽 texthl=DiagnosticSignInfo linehl= numhl=
  sign define DiagnosticSignWarn text=󰀪 texthl=DiagnosticSignWarn linehl= numhl=
]])

require("config/mini")
require("config/keymaps")
require("config/autocmds")

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
