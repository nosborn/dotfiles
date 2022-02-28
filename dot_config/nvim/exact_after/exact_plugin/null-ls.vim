scriptencoding utf-8

lua <<EOT
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
  null_ls.builtins.formatting.fish_indent,
  null_ls.builtins.formatting.prettier.with({
    filetypes = { "json" },
  }),
  null_ls.builtins.formatting.rubocop,
  null_ls.builtins.formatting.shfmt.with({
    extra_args = { "-i", "2", "-ci" },
  }),
  null_ls.builtins.formatting.terraform_fmt,
  null_ls.builtins.formatting.trim_newlines,
  null_ls.builtins.formatting.trim_whitespace,
  -- null_ls.builtins.formatting.xmllint.with({
  --   extra_args = { '--nonet' },
  -- }),
  -- Diagnostics
  null_ls.builtins.diagnostics.ansiblelint,
  null_ls.builtins.diagnostics.codespell,
  null_ls.builtins.diagnostics.flake8,
  null_ls.builtins.diagnostics.gitlint,
  null_ls.builtins.diagnostics.hadolint,
  null_ls.builtins.diagnostics.jsonlint,
  null_ls.builtins.diagnostics.markdownlint,
  null_ls.builtins.diagnostics.rubocop,
  null_ls.builtins.diagnostics.shellcheck,
  null_ls.builtins.diagnostics.vint,
  null_ls.builtins.diagnostics.yamllint,
  -- Code actions
  null_ls.builtins.code_actions.gitsigns,
  null_ls.builtins.code_actions.shellcheck,
  -- Completion
}

null_ls.setup({
  on_attach = on_attach,
  sources = sources,
})

local actionlint = {
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { "yaml.gha" },
  generator = null_ls.generator({
    args = { "-no-color", "-oneline", "-" },
    check_exit_code = function(code)
      return code <= 1
    end,
    command = "actionlint",
    format = "line",
    on_output = helpers.diagnostics.from_patterns({
      {
        pattern = ":(%d+):(%d+): (.+) %[.+%]",
        groups = { "row", "col", "message" },
      }
    }),
    to_stdin = true,
  }),
}

null_ls.register(actionlint)
EOT
