vim.opt.backup = false
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
--vim.opt.path = $PWD/**
vim.opt.relativenumber = true
vim.opt.scrolloff = 2
vim.opt.shortmess = vim.opt.shortmess + "I"
vim.opt.showcmd = false
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.sidescrolloff = 5
vim.opt.signcolumn = "yes"
vim.opt.smarttab = true
vim.opt.spell = false
vim.opt.spelllang = "en_gb"
vim.opt.swapfile = false
--vim.opt.tags = './tags;,tags'
vim.opt.termguicolors = true
vim.opt.ttimeout = true
--set viminfo-=!
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
  "**/.terraform.d/**",
  "**/.terragrunt-cache/**",
  "**/node_modules/**",
}
vim.opt.wrap = false
vim.opt.writebackup = false

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

vim.g.direnv_auto = 0

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
  "terraform=hcl",
  "yaml",
  "zsh",
}
vim.g.markdown_syntax_conceal = 0

vim.g.vim_json_conceal = 0

vim.g.vimsyn_embed = "l"

--vim.cmd([[colorscheme gruvbox]])

vim.diagnostic.config({
  virtual_text = false,
  float = {
    focusable = false,
  },
})

vim.cmd([[
  sign define DiagnosticSignError text=Ⓔ texthl=DiagnosticSignError linehl= numhl=
  sign define DiagnosticSignHint text=Ⓗ texthl=DiagnosticSignHint linehl= numhl=
  sign define DiagnosticSignInfo text=Ⓘ texthl=DiagnosticSignInfo linehl= numhl=
  sign define DiagnosticSignWarn text=Ⓦ texthl=DiagnosticSignWarn linehl= numhl=
]])

require("Comment").setup()

require("catppuccin").setup()
vim.g.catppuccin_flavour = "mocha"
vim.cmd([[colorscheme catppuccin]])

require("gitsigns").setup({
  current_line_blame = true,
  current_line_blame_opts = {
    delay = vim.o.updatetime,
    ignore_whitespace = true,
  },
  current_line_blame_formatter_opts = {
    relative_time = true,
  },
})

require("indent_blankline").setup({
  show_current_context = true,
  space_char_blank_line = " ",
})

require("lualine").setup({
  options = {
    icons_enabled = false,
    theme = "catppuccin",
    component_separators = "│",
    section_separators = "",
    globalstatus = true,
  },
  sections = {
    lualine_b = {
      { "branch", icon = "", icons_enabled = true },
      "diff",
      { "diagnostics", icons_enabled = true },
    },
    lualine_x = {
      "encoding",
      "fileformat",
      { "filetype", icons_enabled = true },
    },
  },
})

local null_ls = require("null-ls")
null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.formatting_sync()
          -- 0.8 TODO:
          --vim.lsp.buf.format({
          --  bufnr = bufnr,
          --  filter = function(client)
          --    return client.name == "null-ls"
          --  end
          --})
        end,
      })
    end
  end,
  sources = {
    -- Code actions
    --null_ls.builtins.code_actions.eslint,
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.code_actions.shellcheck,
    -- Completion
    null_ls.builtins.completion.spell,
    -- Diagnostics
    null_ls.builtins.diagnostics.actionlint.with({
      runtime_condition = function(params)
        return params.bufname:match("/.github/workflows/") ~= nil
      end,
    }),
    null_ls.builtins.diagnostics.ansiblelint,
    null_ls.builtins.diagnostics.checkmake,
    null_ls.builtins.diagnostics.codespell,
    null_ls.builtins.diagnostics.editorconfig_checker,
    --null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.diagnostics.gitlint,
    null_ls.builtins.diagnostics.golangci_lint,
    null_ls.builtins.diagnostics.hadolint,
    null_ls.builtins.diagnostics.jsonlint,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.diagnostics.rubocop,
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.diagnostics.sqlfluff,
    null_ls.builtins.diagnostics.tsc,
    null_ls.builtins.diagnostics.vale,
    null_ls.builtins.diagnostics.vint,
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.diagnostics.zsh,
    -- Formatting
    null_ls.builtins.formatting.black,
    --null_ls.builtins.formatting.eslint,
    null_ls.builtins.formatting.prettier.with({
      extra_filetypes = { "toml" },
    }),
    null_ls.builtins.formatting.rubocop,
    null_ls.builtins.formatting.shfmt.with({
      extra_args = { "-i", "2", "-ci" },
    }),
    null_ls.builtins.formatting.stylua,
    --null_ls.builtins.formatting.terrafmt,
    null_ls.builtins.formatting.terraform_fmt.with({
      extra_filetypes = { "hcl" },
    }),
    null_ls.builtins.formatting.trim_newlines,
    null_ls.builtins.formatting.trim_whitespace,
    null_ls.builtins.formatting.xmllint.with({
      extra_args = { "--nonet" },
    }),
    -- Hover
  },
})

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "comment",
    "cpp",
    "css",
    "dockerfile",
    "dot",
    "go",
    "gomod",
    "graphql",
    "hcl",
    "html",
    "javascript",
    "json",
    "kotlin",
    "lua",
    "make",
    "perl",
    "php",
    "python",
    "regex",
    "rego",
    "ruby",
    "swift",
    "toml",
    "typescript",
    "vim",
    "yaml",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})

require("telescope").setup()

vim.keymap.set("n", "<Leader>fb", "<Cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<Leader>ff", "<Cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<Leader>fg", "<Cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<Leader>fh", "<Cmd>Telescope help_tags<CR>")
vim.keymap.set("n", "<Leader>gp", "<CMD>Gitsigns preview_hunk<CR>", { noremap = true })
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gj", "j", { noremap = true })
vim.keymap.set("n", "gk", "k", { noremap = true })
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })

local augroup = vim.api.nvim_create_augroup("ansible-vault", { clear = true })
local patterns = {
  "*/group_vars/*/vault.yml",
  "*/host_vars/*/vault.yml",
  "*/vars/*/vault.yml",
}
for _, pattern in ipairs(patterns) do
  vim.api.nvim_create_autocmd(
    "BufReadPre,FileReadPre",
    { pattern = pattern, group = augroup, command = "setlocal nobackup noswapfile noundofile viminfo=" }
  )
  vim.api.nvim_create_autocmd(
    "BufReadPost,FileReadPost",
    { pattern = pattern, group = augroup, command = "call ansible#vault#decrypt()" }
  )
  vim.api.nvim_create_autocmd(
    "BufWritePre,FileWritePre",
    { pattern = pattern, group = augroup, command = "call ansible#vault#encrypt()" }
  )
  vim.api.nvim_create_autocmd(
    "BufWritePost,FileWritePost",
    { pattern = pattern, group = augroup, command = "silent undo" }
  )
end

local augroup = vim.api.nvim_create_augroup("diagnostics-float", { clear = true })
vim.api.nvim_create_autocmd(
  "CursorHold",
  { pattern = "*", group = augroup, command = "lua vim.diagnostic.open_float()" }
)

-- " Use <C-L> to clear the highlighting of :set hlsearch.
-- if maparg('<C-L>', 'n') ==# ''
--   nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
-- endif
--
-- map Q <Nop>

-- inoremap <C-U> <C-G>u<C-U>
--
-- if !exists(':DiffOrig')
--   command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
--         \ | wincmd p | diffthis
-- endif

--set wildcharm=<C-Z>
--cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
--cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
--cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
--cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"
