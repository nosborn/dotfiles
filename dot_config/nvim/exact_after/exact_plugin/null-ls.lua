local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- Code actions
    null_ls.builtins.code_actions.gitsigns,
    -- Completion
    null_ls.builtins.completion.spell,
    -- Diagnostics
    null_ls.builtins.diagnostics.actionlint,
    null_ls.builtins.diagnostics.ansiblelint,
    --null_ls.builtins.diagnostics.cfn_lint,
    null_ls.builtins.diagnostics.checkmake,
    null_ls.builtins.diagnostics.dotenv_linter,
    null_ls.builtins.diagnostics.golangci_lint,
    null_ls.builtins.diagnostics.hadolint,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.diagnostics.rubocop,
    --null_ls.builtins.diagnostics.terraform_validate,
    --null_ls.builtins.diagnostics.tfsec, -- DEPRECATED
    --null_ls.builtins.diagnostics.trivy,
    null_ls.builtins.diagnostics.vint,
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.diagnostics.zsh,
    -- Formatting
    null_ls.builtins.formatting.black,
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
    -- Hover
  },
})
