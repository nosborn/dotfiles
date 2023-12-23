require("nvim-treesitter.configs").setup({
  ensure_installed = {
    -- "awk",
    "bash",
    "c",
    "cmake",
    "comment",
    "cpp",
    "css",
    "diff",
    "dockerfile",
    "dot",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "go",
    "gomod",
    "graphql",
    "hcl",
    "hocon",
    "html",
    "http",
    "ini", -- experimental
    "java",
    "javascript",
    "jq",
    "json",
    "jsonnet",
    "kotlin",
    "lua",
    "make",
    "markdown", -- experimental
    "markdown_inline", -- experimental
    "passwd",
    "perl",
    "php",
    "python",
    "regex",
    "rego",
    "ruby",
    "sql",
    "terraform",
    -- "todotxt",
    "toml",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
  },

  highlight = {
    enable = true,
  },

  indent = {
    enable = true,
  },
})

require("nvim-treesitter.parsers").get_parser_configs().river = {
  install_info = {
    branch = "main",
    files = {
      "src/parser.c",
    },
    generate_requires_npm = false,
    requires_generate_from_grammar = false,
    url = "https://github.com/grafana/tree-sitter-river.git",
  },
}
