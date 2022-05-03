local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

local on_attach = function(client)
  if client.resolved_capabilities.document_formatting then
    vim.cmd([[
      augroup LspFormatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
      augroup END
    ]])
  end
end

local sources = {
  -- Formatting
  null_ls.builtins.formatting.black,
  -- null_ls.builtins.formatting.eslint,
  null_ls.builtins.formatting.prettier.with({
    extra_filetypes = { "toml" },
  }),
  null_ls.builtins.formatting.rubocop,
  null_ls.builtins.formatting.shfmt.with({
    extra_args = { "-i", "2", "-ci" },
  }),
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.terraform_fmt.with({
    extra_filetypes = { "hcl" },
  }),
  null_ls.builtins.formatting.trim_newlines,
  null_ls.builtins.formatting.trim_whitespace,
  null_ls.builtins.formatting.xmllint.with({
    extra_args = { "--nonet" },
  }),
  -- Diagnostics
  null_ls.builtins.diagnostics.actionlint.with({
    runtime_condition = function(params)
      return params.bufname:match("/.github/workflows/") ~= nil
    end,
  }),
  null_ls.builtins.diagnostics.alex,
  null_ls.builtins.diagnostics.ansiblelint,
  null_ls.builtins.diagnostics.checkmake,
  null_ls.builtins.diagnostics.codespell,
  -- null_ls.builtins.diagnostics.eslint,
  null_ls.builtins.diagnostics.flake8,
  null_ls.builtins.diagnostics.gitlint,
  null_ls.builtins.diagnostics.hadolint,
  null_ls.builtins.diagnostics.jsonlint,
  null_ls.builtins.diagnostics.markdownlint,
  null_ls.builtins.diagnostics.rubocop,
  null_ls.builtins.diagnostics.shellcheck,
  null_ls.builtins.diagnostics.sqlfluff,
  null_ls.builtins.diagnostics.trail_space,
  null_ls.builtins.diagnostics.tsc,
  null_ls.builtins.diagnostics.vint,
  null_ls.builtins.diagnostics.yamllint,
  null_ls.builtins.diagnostics.zsh,
  -- Code actions
  -- null_ls.builtins.code_actions.eslint,
  null_ls.builtins.code_actions.gitsigns,
  null_ls.builtins.code_actions.shellcheck,
  -- Completion
}

null_ls.setup({
  on_attach = on_attach,
  sources = sources,
})
