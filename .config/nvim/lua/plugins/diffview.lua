-- Diffview.nvim - Single tabpage interface for cycling through diffs
-- Provides a powerful diff view for git changes
-- Repository: https://github.com/sindrets/diffview.nvim

return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
  config = function()
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

    local keymap = vim.keymap.set
    keymap("n", "<leader>do", "<cmd>DiffviewOpen<CR>", { desc = "Open diff view" })
    keymap("n", "<leader>dc", "<cmd>DiffviewClose<CR>", { desc = "Close diff view" })
    keymap("n", "<leader>dh", "<cmd>DiffviewFileHistory<CR>", { desc = "File history (all)" })
    keymap("n", "<leader>df", "<cmd>DiffviewFileHistory %<CR>", { desc = "File history (current)" })
    keymap("n", "<leader>dt", "<cmd>DiffviewToggleFiles<CR>", { desc = "Toggle file panel" })
    keymap("n", "<leader>dr", "<cmd>DiffviewRefresh<CR>", { desc = "Refresh diff view" })
  end,
}
