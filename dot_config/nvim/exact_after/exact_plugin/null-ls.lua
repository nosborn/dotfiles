local null_ls = require("null-ls")

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            bufnr = bufnr,
            filter = function(client)
              return client.name == "null-ls"
            end,
          })
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
    --null_ls.builtins.diagnostics.cfn_lint,
    null_ls.builtins.diagnostics.checkmake,
    --null_ls.builtins.diagnostics.commitlint,
    null_ls.builtins.diagnostics.dotenv_linter,
    --null_ls.builtins.diagnostics.editorconfig_checker,
    --null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.diagnostics.gitlint,
    --null_ls.builtins.diagnostics.golangci_lint,
    null_ls.builtins.diagnostics.hadolint,
    null_ls.builtins.diagnostics.jsonlint,
    --null_ls.builtins.diagnostics.ktlint,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.diagnostics.rubocop,
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.diagnostics.tfsec,
    null_ls.builtins.diagnostics.tsc,
    --null_ls.builtins.diagnostics.trail_space,
    null_ls.builtins.diagnostics.vint,
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.diagnostics.zsh,
    -- Formatting
    -- null_ls.builtins.formatting.black,
    -- --null_ls.builtins.formatting.eslint,
    -- --null_ls.builtins.formatting.ktlint,
    -- --null_ls.builtins.formatting.packer,
    -- null_ls.builtins.formatting.prettier.with({
    --   extra_filetypes = { "toml" },
    -- }),
    -- null_ls.builtins.formatting.rubocop,
    -- null_ls.builtins.formatting.shfmt.with({
    --   extra_args = { "-i", "2", "-ci" },
    -- }),
    -- null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.xmllint.with({
      extra_args = { "--nonet" },
    }),
    -- Hover
  },
})
