-- https://github.com/nvim-treesitter/nvim-treesitter

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "sql",
        "regex",
        "bash",
        "markdown",
        "markdown_inline",
        "yaml",
        "json",
        "jsonc",
        "javascript",
        "typescript",
        "python",
        "dockerfile",
        "html",
        "css",
        "lua",
        "vim",
        "vimdoc",
      },
    },
  },
}
