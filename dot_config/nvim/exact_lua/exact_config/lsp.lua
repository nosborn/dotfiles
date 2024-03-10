local lsp_format = require("lsp-format")

lsp_format.setup({})

local on_attach = function(client, bufnr)
  lsp_format.on_attach(client, bufnr)
end

local lspconfig = require("lspconfig")

lspconfig.bashls.setup({})

lspconfig.gopls.setup({
  on_attach = on_attach,
})

--lspconfig.jsonls.setup({})

lspconfig.terraformls.setup({
  on_attach = on_attach,
})
