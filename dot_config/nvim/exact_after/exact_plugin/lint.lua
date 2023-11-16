require("lint").linters_by_ft = {
  dockerfile = { "hadolint" },
  dotenv = { "dotenv_linter" },
  gitcommit = { "gitlint" },
  json = { "jsonlint" },
  lua = { "luacheck" },
  python = { "flake8" },
  ruby = { "rubocop" },
  sh = { "shellcheck" },
  terraform = { "terraform_validate", "tflint", "tfsec" },
  vim = { "vint" },
  yaml = { "actionlint", "yamllint" },
  zsh = { "shellcheck" },
}

local linters = require("lint").linters
linters.luacheck.args = { "--formatter", "plain", "--codes", "--ranges", "-", "--globals", "vim" }

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
  callback = function()
    require("lint").try_lint()
  end,
  group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
})
