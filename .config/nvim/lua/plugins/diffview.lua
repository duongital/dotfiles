-- Diffview.nvim - Single tabpage interface for cycling through diffs
-- Provides a powerful diff view for git changes
-- Repository: https://github.com/sindrets/diffview.nvim

return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
  config = function()
    local actions = require("diffview.actions")

    require("diffview").setup({
      -- Use nvim-web-devicons for file icons (same as nvim-tree)
      icons = {
        folder_closed = "",
        folder_open = "",
      },
      file_panel = {
        tree_options = {
          -- Flatten dirs that only contain one single dir
          flatten_dirs = true,
          folder_statuses = "only_folded", -- Show folder git status
        },
      },
      hooks = {
        -- Disable LSP when entering diffview
        view_opened = function()
          vim.cmd("LspStop")
        end,
        -- Re-enable LSP when exiting diffview
        view_closed = function()
          vim.cmd("LspStart")
        end,
      },
    })
  end,
}
