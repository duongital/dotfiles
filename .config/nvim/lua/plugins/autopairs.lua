-- Auto-pairs Plugin
-- Automatically inserts and manages paired characters while typing
-- Features:
--   - Auto-closes brackets, quotes, parentheses: ( → ()
--   - Smart deletion: deletes pairs together with backspace
--   - Skip over closing characters when typing
--   - Proper indentation on Enter between pairs
return {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup()
  end,
}
