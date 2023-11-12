require("conform").setup({
  formatters = {
    shfmt = {
      prepend_args = { "-i", "2", "-ci" },
    },
  },
  formatters_by_ft = {
    ["markdown.mdx"] = { "prettier" }, -- TODO
    css = { "prettier" },
    graphql = { "prettier" },
    handlebars = { "prettier" },
    hcl = { "terraform_fmt", "trim_newlines" },
    html = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    json = { "prettier", "trim_newlines" },
    jsonc = { "prettier" },
    less = { "prettier" },
    lua = { "stylua" },
    luau = { "stylua" },
    markdown = { "prettier", "trim_newlines" }, -- TODO
    python = { "black" },
    ruby = { "rubocop" },
    scss = { "prettier" },
    sh = { "shfmt", "trim_newlines" },
    terraform = { "terraform_fmt", "trim_newlines" },
    toml = { "prettier", "trim_newlines" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    vue = { "prettier" },
    xml = { "trim_newlines", "xmlformat" },
    yaml = { "prettier", "trim_newlines" }, -- TODO
    zsh = { "shfmt", "trim_newlines" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
