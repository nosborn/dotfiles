return {
  { -- Linting
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        dockerfile = { "hadolint" },
        dotenv = { "dotenv-linter" },
        json = { "jsonlint" },
        make = { "checkmake" },
        markdown = { "markdownlint" },
        ruby = { "ruby" },
        terraform = { "tflint" },
        vim = { "vint" },
        yaml = { "yamllint" },
      }
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
