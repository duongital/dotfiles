-- Syntax Highlighting and Parsing Plugin
-- Uses tree-sitter for better syntax highlighting and code understanding
-- Features:
--   - Accurate, incremental syntax highlighting
--   - Better code indentation
--   - Understands code structure (not just regex patterns)
--   - Supports multiple languages
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "vim",
        "python",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
