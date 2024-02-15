require("lsp-format").setup({})

require("lspconfig").terraformls.setup({
  on_attach = require("lsp-format").on_attach,
})
