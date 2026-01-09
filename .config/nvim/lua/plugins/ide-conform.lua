-- Code Formatting Plugin
-- Manages external code formatters for consistent code style
-- Features:
--   - Format on save (automatic)
--   - Per-filetype formatter configuration
--   - Chain multiple formatters together
--   - Async formatting for better performance
-- Configured formatters:
--   - Python: ruff (organize imports + format)
--   - JavaScript/TypeScript/React: prettier
--   - JSON/YAML/Markdown/HTML/CSS: prettier
--   - Lua: stylua
--   - Go: goimports
-- Keybindings:
--   <leader>cf - Manual format
return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        -- Python formatter (ruff handles both formatting and import sorting)
        python = { "ruff_organize_imports", "ruff_format" },
        -- TypeScript/JavaScript formatters
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        -- Additional common formats
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        lua = { "stylua" },
        go = { "goimports" },
      },
      -- Format on save
      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = false,
      },
    })

    -- Keybinding for manual formatting
    vim.keymap.set({ "n", "v" }, "<leader>cf", function()
      conform.format({
        lsp_fallback = false,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
