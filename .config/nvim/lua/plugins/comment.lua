-- Smart Commenting Plugin
-- Fast and powerful commenting with tree-sitter integration
-- Features:
--   - Toggle line/block comments
--   - Language-aware (uses correct comment syntax)
--   - Works in visual mode for block commenting
--   - Respects indentation
--   - JSX/TSX aware: uses {/* */} in JSX context, // in TS context
-- Default keybindings:
--   gcc - Toggle line comment
--   gbc - Toggle block comment
--   gc in visual mode - Comment selection
return {
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },
  {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },
}
