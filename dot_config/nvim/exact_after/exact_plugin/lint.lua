require("lint").linters_by_ft = {
  dockerfile = { "hadolint" },
  gitcommit = { "gitlint" },
  json = { "jsonlint" },
  lua = { "luacheck" },
  python = { "flake8" },
  ruby = { "rubocop" },
  sh = { "dotenv_linter", "shellcheck" },
  terraform = { "terraform_validate", "tflint", "tfsec" },
  vim = { "vint" },
  yaml = { "actionlint", "yamllint" },
  zsh = { "shellcheck" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
