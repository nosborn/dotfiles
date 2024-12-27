vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.inccommand = "nosplit"
vim.opt.listchars = { extends = "…", nbsp = "␣", precedes = "…", tab = "» ", trail = "·" }
vim.opt.scrolloff = 10
vim.opt.signcolumn = "no"
vim.opt.spelllang = "en_gb"
vim.opt.timeoutlen = 300
vim.opt.undofile = false
vim.opt.updatetime = 250

vim.g.netrw_banner = 0

-- vim.schedule(function()
--   vim.opt.clipboard = "unnamedplus"
-- end)

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

require("tokyonight").setup({
  style = "night",
})
vim.cmd("colorscheme tokyonight")

require("fidget").setup({})

require("fzf-lua").setup({ "fzf-vim" })

require("mason").setup()           -- before mason-lspconfig

require("mason-lspconfig").setup({ -- before lspconfig
  ensure_installed = {
    "vimls",
  },
})

require("lspconfig").jsonls.setup({
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = {
        enable = true,
      },
    },
  },
})

require("lspconfig").lua_ls.setup({
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
        return
      end
    end
    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file("", true),
      },
    })
  end,
  settings = {
    Lua = {},
  },
})

require("lspconfig").yamlls.setup({
  settings = {
    redhat = {
      telemetry = {
        enabled = false,
      },
    },
    yaml = {
      format = {
        enable = true,
      },
      keyOrdering = false,
      schemaStore = {
        enable = false,
        url = "",
      },
      schemas = {
        kubernetes = "*.yaml",
        ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
        ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
        ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
        ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
        ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
        ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
        ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
        ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
        ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
        ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] =
        "*api*.{yml,yaml}",
        ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] =
        "*flow*.{yml,yaml}",
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
        "*docker-compose*.{yml,yaml}",
      },
      --schemas = require('schemastore').yaml.schemas(),
      validate = true,
    },
  },
})

require("mini.basics").setup({
  options = {
    extra_ui = true,
  },
  autocommands = {
    relnum_in_visual_mode = true,
  },
})

require("mini.bracketed").setup()

require("mini.clue").setup({
  triggers = {
    { mode = "c", keys = "<C-r>" },
    { mode = "i", keys = "<C-r>" },
    { mode = "i", keys = "<C-x>" },
    { mode = "n", keys = "'" },
    { mode = "n", keys = "<C-w>" },
    { mode = "n", keys = "<Leader>" },
    { mode = "n", keys = "[" },
    { mode = "n", keys = "]" },
    { mode = "n", keys = "`" },
    { mode = "n", keys = "g" },
    { mode = "n", keys = "z" },
    { mode = "n", keys = '"' },
    { mode = "x", keys = "'" },
    { mode = "x", keys = "<Leader>" },
    { mode = "x", keys = "`" },
    { mode = "x", keys = "g" },
    { mode = "x", keys = "z" },
    { mode = "x", keys = '"' },
  },
  clues = { -- Enhance this by adding descriptions for <Leader> mapping groups
    require("mini.clue").gen_clues.builtin_completion(),
    require("mini.clue").gen_clues.g(),
    require("mini.clue").gen_clues.marks(),
    require("mini.clue").gen_clues.registers(),
    require("mini.clue").gen_clues.windows(),
    require("mini.clue").gen_clues.z(),
  },
})

require("mini.comment").setup()

--require("mini.completion").setup()

require("mini.diff").setup()

require("mini.extra").setup()

require("mini.files").setup()

require("mini.git").setup()

require("mini.hipatterns").setup({
  highlighters = {
    fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
    hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
    note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
    todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
  },
})

require("mini.icons").setup()

require("mini.indentscope").setup()

require("mini.move").setup()

-- require("mini.notify").setup()
-- vim.notify = require("mini.notify").make_notify()

require("mini.pairs").setup()

require("mini.statusline").setup()
require("mini.statusline").section_location = function()
  return "%2l:%-2v"
end
vim.api.nvim_create_autocmd({ "BufNewFile" }, {
  pattern = { "*.yaml", "*.yml" },
  command = "norm i---\n",
})

require("mini.surround").setup()

require("nvim-treesitter.configs").setup({
  auto_install = true,
  ensure_installed = {
    "bash",
    "git_config",
    "gotmpl",
    "ini",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "terraform",
    "yaml",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "ruby" },
  },
  indent = { enable = true, disable = { "ruby" } },
})
require("nvim-treesitter.parsers").get_parser_configs().d2 = {
  filetype = "d2",
  install_info = {
    files = {
      "src/parser.c",
      "src/scanner.cc",
    },
    revision = "main",
    url = "https://github.com/pleshevskiy/tree-sitter-d2",
  },
}
require("nvim-treesitter.parsers").get_parser_configs().river = {
  install_info = {
    branch = "main",
    files = {
      "src/parser.c",
    },
    generate_requires_npm = false,
    requires_generate_from_grammar = false,
    url = "https://github.com/grafana/tree-sitter-river.git",
  },
}

require("lspconfig").tflint.setup({})
require("lspconfig").vimls.setup({})

require("lint").linters_by_ft = {
  actionlint = { "actionlint" },
  dockerfile = { "hadolint" },
  dotenv = { "dotenv_linter" },
  --json = { "jsonlint" },
  make = { "checkmake" },
  markdown = { "markdownlint" },
  ruby = { "ruby" },
  sh = { "shellcheck" },
  --terraform = { "tflint" },
  --vim = { "vint" },
  --yaml = { "yamllint" },
}
do
  local augroup = vim.api.nvim_create_augroup("lint", { clear = true })
  vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = augroup,
    callback = function()
      require("lint").try_lint()
    end,
  })
end

require("conform").setup({
  format_on_save = {
    lsp_format = "fallback",
    timeout_ms = 500,
  },
  formatters = {
    alloy_fmt = {
      command = "alloy",
      args = { "fmt", "-" },
      stdin = true,
    },
    packer_fmt = {
      command = "packer",
      args = { "fmt", "-" },
      stdin = true,
    },
    squeeze = {
      command = "cat",
      args = { "-s" },
      stdin = true,
    },
  },
  formatters_by_ft = {
    hcl = { "packer_fmt", "squeeze", "trim_newlines" },
    ini = { "squeeze", "trim_newlines" },
    --lua = { "stylua", "squeeze", "trim_newlines" },
    markdown = { "prettier", "squeeze", "trim_newlines" },
    river = { "alloy_fmt", "squeeze", "trim_newlines" },
    sh = { "shfmt", "squeeze", "trim_newlines" },
    terraform = { "terraform_fmt", "squeeze", "trim_newlines" },
    ["terraform-vars"] = { "terraform_fmt", "squeeze", "trim_newlines" },
    toml = { "squeeze", "trim_newlines" },
    vim = { "squeeze", "trim_newlines" },
    --yaml = { "prettier", "squeeze", "trim_newlines" },
  },
})
require("conform").formatters.shfmt = {
  prepend_args = { "-i", "2", "-ci" },
}

require("virt-column").setup({
  virtcolumn = "+1,80",
})

-- require("yaml_nvim").setup()
-- do
--   local augroup = vim.api.nvim_create_augroup("yaml_nvim", { clear = true })
--   vim.api.nvim_create_autocmd({ "BufEnter", "CursorMoved" }, {
--     group = augroup,
--     pattern = { "*.yaml", "*.yml" },
--     callback = function()
--       vim.opt_local.winbar = (require("yaml_nvim").get_yaml_key() or "")
--     end,
--   })
-- end

require("lazygit")
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open Lazygit" })

-- require("lazy").setup({
--   {
--     "Bilal2453/luvit-meta",
--     lazy = true,
--   },
--
--   {
--     "cuducos/yaml.nvim",
--     ft = { "yaml" }, -- optional
--     dependencies = {
--       "nvim-telescope/telescope.nvim",
--       "nvim-treesitter/nvim-treesitter",
--     },
--   },
--
--   {
--     "folke/lazydev.nvim",
--     ft = "lua",
--     opts = {
--       library = {
--         -- Load luvit types when the `vim.uv` word is found
--         { path = "luvit-meta/library", words = { "vim%.uv" } },
--       },
--     },
--   },
--
--   -- {
--   --   "folke/todo-comments.nvim",
--   --   event = "VimEnter",
--   --   dependencies = { "nvim-lua/plenary.nvim" },
--   --   opts = { signs = false },
--   -- },
--
--   -- {
--   --   "folke/which-key.nvim",
--   --   event = "VimEnter", -- Sets the loading event to 'VimEnter'
--   --   opts = {
--   --     icons = {
--   --       mappings = true,
--   --       keys = {},
--   --     },
--   --
--   --     -- Document existing key chains
--   --     spec = {
--   --       { "<leader>c", group = "[C]ode", mode = { "n", "x" } },
--   --       { "<leader>d", group = "[D]ocument" },
--   --       { "<leader>r", group = "[R]ename" },
--   --       { "<leader>s", group = "[S]earch" },
--   --       { "<leader>w", group = "[W]orkspace" },
--   --       { "<leader>t", group = "[T]oggle" },
--   --       { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
--   --     },
--   --   },
--   -- },
--
--   {
--     "hrsh7th/nvim-cmp",
--     event = "InsertEnter",
--     dependencies = {
--       -- Snippet Engine & its associated nvim-cmp source
--       {
--         "L3MON4D3/LuaSnip",
--         build = (function()
--           -- Build Step is needed for regex support in snippets.
--           -- This step is not supported in many windows environments.
--           -- Remove the below condition to re-enable on windows.
--           if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
--             return
--           end
--           return "make install_jsregexp"
--         end)(),
--         dependencies = {
--           -- `friendly-snippets` contains a variety of premade snippets.
--           --    See the README about individual language/framework/plugin snippets:
--           --    https://github.com/rafamadriz/friendly-snippets
--           -- {
--           --   'rafamadriz/friendly-snippets',
--           --   config = function()
--           --     require('luasnip.loaders.from_vscode').lazy_load()
--           --   end,
--           -- },
--         },
--       },
--       "saadparwaiz1/cmp_luasnip",
--
--       -- Adds other completion capabilities.
--       --  nvim-cmp does not ship with all sources by default. They are split
--       --  into multiple repos for maintenance purposes.
--       "hrsh7th/cmp-nvim-lsp",
--       "hrsh7th/cmp-path",
--     },
--     config = function()
--       -- See `:help cmp`
--       local cmp = require("cmp")
--       local luasnip = require("luasnip")
--       luasnip.config.setup({})
--
--       cmp.setup({
--         snippet = {
--           expand = function(args)
--             luasnip.lsp_expand(args.body)
--           end,
--         },
--         completion = { completeopt = "menu,menuone,noinsert" },
--
--         -- For an understanding of why these mappings were
--         -- chosen, you will need to read `:help ins-completion`
--         --
--         -- No, but seriously. Please read `:help ins-completion`, it is really good!
--         mapping = cmp.mapping.preset.insert({
--           -- Select the [n]ext item
--           ["<C-n>"] = cmp.mapping.select_next_item(),
--           -- Select the [p]revious item
--           ["<C-p>"] = cmp.mapping.select_prev_item(),
--
--           -- Scroll the documentation window [b]ack / [f]orward
--           ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--           ["<C-f>"] = cmp.mapping.scroll_docs(4),
--
--           -- Accept ([y]es) the completion.
--           --  This will auto-import if your LSP supports it.
--           --  This will expand snippets if the LSP sent a snippet.
--           ["<C-y>"] = cmp.mapping.confirm({ select = true }),
--
--           -- If you prefer more traditional completion keymaps,
--           -- you can uncomment the following lines
--           --['<CR>'] = cmp.mapping.confirm { select = true },
--           --['<Tab>'] = cmp.mapping.select_next_item(),
--           --['<S-Tab>'] = cmp.mapping.select_prev_item(),
--
--           -- Manually trigger a completion from nvim-cmp.
--           --  Generally you don't need this, because nvim-cmp will display
--           --  completions whenever it has completion options available.
--           ["<C-Space>"] = cmp.mapping.complete({}),
--
--           -- Think of <c-l> as moving to the right of your snippet expansion.
--           --  So if you have a snippet that's like:
--           --  function $name($args)
--           --    $body
--           --  end
--           --
--           -- <c-l> will move you to the right of each of the expansion locations.
--           -- <c-h> is similar, except moving you backwards.
--           ["<C-l>"] = cmp.mapping(function()
--             if luasnip.expand_or_locally_jumpable() then
--               luasnip.expand_or_jump()
--             end
--           end, { "i", "s" }),
--           ["<C-h>"] = cmp.mapping(function()
--             if luasnip.locally_jumpable(-1) then
--               luasnip.jump(-1)
--             end
--           end, { "i", "s" }),
--
--           -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
--           --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
--         }),
--         sources = {
--           {
--             name = "lazydev",
--             -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
--             group_index = 0,
--           },
--           { name = "nvim_lsp" },
--           { name = "luasnip" },
--           { name = "path" },
--         },
--       })
--     end,
--   },
--
--   {
--     "lewis6991/gitsigns.nvim",
--     opts = {
--       current_line_blame = true,
--       current_line_blame_opts = {
--         delay = vim.o.updatetime,
--         ignore_whitespace = true,
--         virt_text_pos = "right_align",
--       },
--       numhl = true,
--       signs = {
--         add = { text = "+" },
--         change = { text = "~" },
--         delete = { text = "_" },
--         topdelete = { text = "‾" },
--         changedelete = { text = "~" },
--       },
--     },
--   },
--
--   {
--     "neovim/nvim-lspconfig",
--     dependencies = {
--       -- Automatically install LSPs and related tools to stdpath for Neovim
--       { "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
--       "williamboman/mason-lspconfig.nvim",
--       "WhoIsSethDaniel/mason-tool-installer.nvim",
--
--       -- Useful status updates for LSP.
--       -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
--       { "j-hui/fidget.nvim", opts = {} },
--
--       -- Allows extra capabilities provided by nvim-cmp
--       "hrsh7th/cmp-nvim-lsp",
--     },
--     config = function()
--       -- Brief aside: **What is LSP?**
--       --
--       -- LSP is an initialism you've probably heard, but might not understand what it is.
--       --
--       -- LSP stands for Language Server Protocol. It's a protocol that helps editors
--       -- and language tooling communicate in a standardized fashion.
--       --
--       -- In general, you have a "server" which is some tool built to understand a particular
--       -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
--       -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
--       -- processes that communicate with some "client" - in this case, Neovim!
--       --
--       -- LSP provides Neovim with features like:
--       --  - Go to definition
--       --  - Find references
--       --  - Autocompletion
--       --  - Symbol Search
--       --  - and more!
--       --
--       -- Thus, Language Servers are external tools that must be installed separately from
--       -- Neovim. This is where `mason` and related plugins come into play.
--       --
--       -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
--       -- and elegantly composed help section, `:help lsp-vs-treesitter`
--
--       --  This function gets run when an LSP attaches to a particular buffer.
--       --    That is to say, every time a new file is opened that is associated with
--       --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
--       --    function will be executed to configure the current buffer
--       vim.api.nvim_create_autocmd("LspAttach", {
--         group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
--         callback = function(event)
--           -- NOTE: Remember that Lua is a real programming language, and as such it is possible
--           -- to define small helper and utility functions so you don't have to repeat yourself.
--           --
--           -- In this case, we create a function that lets us more easily define mappings specific
--           -- for LSP related items. It sets the mode, buffer and description for us each time.
--           local map = function(keys, func, desc, mode)
--             mode = mode or "n"
--             vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
--           end
--
--           -- Jump to the definition of the word under your cursor.
--           --  This is where a variable was first declared, or where a function is defined, etc.
--           --  To jump back, press <C-t>.
--           map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
--
--           -- Find references for the word under your cursor.
--           map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
--
--           -- Jump to the implementation of the word under your cursor.
--           --  Useful when your language has ways of declaring types without an actual implementation.
--           map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
--
--           -- Jump to the type of the word under your cursor.
--           --  Useful when you're not sure what type a variable is and you want to see
--           --  the definition of its *type*, not where it was *defined*.
--           map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
--
--           -- Fuzzy find all the symbols in your current document.
--           --  Symbols are things like variables, functions, types, etc.
--           map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
--
--           -- Fuzzy find all the symbols in your current workspace.
--           --  Similar to document symbols, except searches over your entire project.
--           map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
--
--           -- Rename the variable under your cursor.
--           --  Most Language Servers support renaming across files, etc.
--           map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
--
--           -- Execute a code action, usually your cursor needs to be on top of an error
--           -- or a suggestion from your LSP for this to activate.
--           map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
--
--           -- WARN: This is not Goto Definition, this is Goto Declaration.
--           --  For example, in C this would take you to the header.
--           map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
--
--           -- The following two autocommands are used to highlight references of the
--           -- word under your cursor when your cursor rests there for a little while.
--           --    See `:help CursorHold` for information about when this is executed
--           --
--           -- When you move your cursor, the highlights will be cleared (the second autocommand).
--           local client = vim.lsp.get_client_by_id(event.data.client_id)
--           if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
--             local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
--             vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--               buffer = event.buf,
--               group = highlight_augroup,
--               callback = vim.lsp.buf.document_highlight,
--             })
--
--             vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
--               buffer = event.buf,
--               group = highlight_augroup,
--               callback = vim.lsp.buf.clear_references,
--             })
--
--             vim.api.nvim_create_autocmd("LspDetach", {
--               group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
--               callback = function(event2)
--                 vim.lsp.buf.clear_references()
--                 vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
--               end,
--             })
--           end
--
--           -- The following code creates a keymap to toggle inlay hints in your
--           -- code, if the language server you are using supports them
--           --
--           -- This may be unwanted, since they displace some of your code
--           if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
--             map("<leader>th", function()
--               vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
--             end, "[T]oggle Inlay [H]ints")
--           end
--         end,
--       })
--
--       -- LSP servers and clients are able to communicate to each other what features they support.
--       --  By default, Neovim doesn't support everything that is in the LSP specification.
--       --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
--       --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
--       local capabilities = vim.lsp.protocol.make_client_capabilities()
--       capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
--
--       -- Enable the following language servers
--       --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--       --
--       --  Add any additional override configuration in the following tables. Available keys are:
--       --  - cmd (table): Override the default command used to start the server
--       --  - filetypes (table): Override the default list of associated filetypes for the server
--       --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
--       --  - settings (table): Override the default settings passed when initializing the server.
--       --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
--       local servers = {
--         -- clangd = {},
--         -- gopls = {},
--         -- pyright = {},
--         -- rust_analyzer = {},
--         -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
--         --
--         -- Some languages (like typescript) have entire language plugins that can be useful:
--         --    https://github.com/pmizio/typescript-tools.nvim
--         --
--         -- But for many setups, the LSP (`ts_ls`) will work just fine
--         -- ts_ls = {},
--         --
--
--         lua_ls = {
--           -- cmd = {...},
--           -- filetypes = { ...},
--           -- capabilities = {},
--           settings = {
--             Lua = {
--               completion = {
--                 callSnippet = "Replace",
--               },
--               -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
--               -- diagnostics = { disable = { 'missing-fields' } },
--             },
--           },
--         },
--       }
--
--       -- Ensure the servers and tools above are installed
--       --  To check the current status of installed tools and/or manually install
--       --  other tools, you can run
--       --    :Mason
--       --
--       --  You can press `g?` for help in this menu.
--       require("mason").setup()
--
--       -- You can add other tools here that you want Mason to install
--       -- for you, so that they are available from within Neovim.
--       local ensure_installed = vim.tbl_keys(servers or {})
--       vim.list_extend(ensure_installed, {
--         "stylua", -- Used to format Lua code
--       })
--       require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
--
--       require("mason-lspconfig").setup({
--         handlers = {
--           function(server_name)
--             local server = servers[server_name] or {}
--             -- This handles overriding only values explicitly passed
--             -- by the server configuration above. Useful when disabling
--             -- certain features of an LSP (for example, turning off formatting for ts_ls)
--             server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
--             require("lspconfig")[server_name].setup(server)
--           end,
--         },
--       })
--     end,
--   },
--
--   {
--     "nvim-telescope/telescope.nvim",
--     event = "VimEnter",
--     branch = "0.1.x",
--     dependencies = {
--       "nvim-lua/plenary.nvim",
--       { -- If encountering errors, see telescope-fzf-native README for installation instructions
--         "nvim-telescope/telescope-fzf-native.nvim",
--
--         -- `build` is used to run some command when the plugin is installed/updated.
--         -- This is only run then, not every time Neovim starts up.
--         build = "make",
--
--         -- `cond` is a condition used to determine whether this plugin should be
--         -- installed and loaded.
--         cond = function()
--           return vim.fn.executable("make") == 1
--         end,
--       },
--       { "nvim-telescope/telescope-ui-select.nvim" },
--
--       -- Useful for getting pretty icons, but requires a Nerd Font.
--       { "nvim-tree/nvim-web-devicons", enabled = true },
--     },
--     config = function()
--       -- Telescope is a fuzzy finder that comes with a lot of different things that
--       -- it can fuzzy find! It's more than just a "file finder", it can search
--       -- many different aspects of Neovim, your workspace, LSP, and more!
--       --
--       -- The easiest way to use Telescope, is to start by doing something like:
--       --  :Telescope help_tags
--       --
--       -- After running this command, a window will open up and you're able to
--       -- type in the prompt window. You'll see a list of `help_tags` options and
--       -- a corresponding preview of the help.
--       --
--       -- Two important keymaps to use while in Telescope are:
--       --  - Insert mode: <c-/>
--       --  - Normal mode: ?
--       --
--       -- This opens a window that shows you all of the keymaps for the current
--       -- Telescope picker. This is really useful to discover what Telescope can
--       -- do as well as how to actually do it!
--
--       -- [[ Configure Telescope ]]
--       -- See `:help telescope` and `:help telescope.setup()`
--       require("telescope").setup({
--         -- You can put your default mappings / updates / etc. in here
--         --  All the info you're looking for is in `:help telescope.setup()`
--         --
--         -- defaults = {
--         --   mappings = {
--         --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
--         --   },
--         -- },
--         -- pickers = {}
--         extensions = {
--           ["ui-select"] = {
--             require("telescope.themes").get_dropdown(),
--           },
--         },
--       })
--
--       -- Enable Telescope extensions if they are installed
--       pcall(require("telescope").load_extension, "fzf")
--       pcall(require("telescope").load_extension, "ui-select")
--
--       -- See `:help telescope.builtin`
--       local builtin = require("telescope.builtin")
--       vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
--       vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
--       vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
--       vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
--       vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
--       vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
--       vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
--       vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
--       vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
--       vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
--
--       -- Slightly advanced example of overriding default behavior and theme
--       vim.keymap.set("n", "<leader>/", function()
--         -- You can pass additional configuration to Telescope to change the theme, layout, etc.
--         builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
--           winblend = 10,
--           previewer = false,
--         }))
--       end, { desc = "[/] Fuzzily search in current buffer" })
--
--       -- It's also possible to pass additional configuration options.
--       --  See `:help telescope.builtin.live_grep()` for information about particular keys
--       vim.keymap.set("n", "<leader>s/", function()
--         builtin.live_grep({
--           grep_open_files = true,
--           prompt_title = "Live Grep in Open Files",
--         })
--       end, { desc = "[S]earch [/] in Open Files" })
--
--       -- Shortcut for searching your Neovim configuration files
--       vim.keymap.set("n", "<leader>sn", function()
--         builtin.find_files({ cwd = vim.fn.stdpath("config") })
--       end, { desc = "[S]earch [N]eovim files" })
--     end,
--   },
--
--   "rfratto/vim-river",
