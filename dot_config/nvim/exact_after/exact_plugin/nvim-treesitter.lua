require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "comment",
    "cpp",
    "css",
    "dockerfile",
    "dot",
    "go",
    "gomod",
    "graphql",
    "hcl",
    "html",
    "javascript",
    "json",
    "kotlin",
    "lua",
    "make",
    -- "markdown",
    -- "markdown_inline",
    "perl",
    "php",
    "pug",
    "python",
    "regex",
    "rego",
    "ruby",
    "swift",
    "toml",
    "typescript",
    "vim",
    "yaml",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})
