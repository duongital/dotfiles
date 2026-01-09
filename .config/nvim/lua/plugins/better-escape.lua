-- Better Escape Plugin
-- Provides a better way to escape insert mode using key combinations
-- Features:
--   - Map key sequences like 'jk' or 'jj' to escape insert mode
--   - Faster than reaching for ESC key
--   - Configurable timeout for key sequences
--   - Works in insert and terminal modes
return {
  "max397574/better-escape.nvim",
  config = function()
    require("better_escape").setup()
  end,
}
