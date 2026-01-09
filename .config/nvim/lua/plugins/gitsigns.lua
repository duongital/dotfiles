-- Git Integration Plugin
-- Shows git diff indicators in the sign column (gutter)
-- Features:
--   - Visual indicators for added/changed/deleted lines
--   - Git blame and hunk operations
--   - Stage/unstage hunks
--   - Preview changes inline
return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    })
  end,
}
