local checkmake = require("efmls-configs.linters.checkmake")
local gitlint = require("efmls-configs.linters.gitlint")
local shellcheck = require("efmls-configs.linters.shellcheck")
local stylua = require("efmls-configs.formatters.stylua")
local vint = require("efmls-configs.linters.vint")
local yamllint = require("efmls-configs.linters.yamllint")

local languages = {
  gitcommit = { gitlint },
  lua = { stylua },
  makefile = { checkmake },
  sh = { shellcheck },
  vim = { vint },
  yaml = { yamllint },
}

require("lspconfig").efm.setup({
  filetypes = vim.tbl_keys(languages),
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
  settings = {
    languages = languages,
    rootMarkers = { ".git/" },
  },
})
