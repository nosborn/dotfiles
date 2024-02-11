require("conform").setup({
  format_on_save = { -- These options will be passed to conform.format()
    lsp_fallback = true,
    timeout_ms = 500,
  },
  formatters_by_ft = {
    css = { "prettier" },
    graphql = { "prettier" },
    handlebars = { "prettier" },
    hcl = { "terraform_fmt" },
    html = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    less = { "prettier" },
    markdown = { "prettier" }, -- TODO
    python = { "black" },
    ruby = { "rubocop" },
    scss = { "prettier" },
    sh = { "shfmt" },
    toml = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    vue = { "prettier" },
    xml = { "trim_newlines", "xmlformat" },
    yaml = { "prettier" }, -- TODO
    zsh = { "shfmt" },
  },
})
