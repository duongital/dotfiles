-- LazyGit Integration Plugin
-- Integrates LazyGit terminal UI for Git operations inside Neovim
-- Features:
--   - Full-featured Git UI (commit, push, pull, branch, merge, rebase, etc.)
--   - Visual diff and conflict resolution
--   - Interactive staging and unstaging
--   - Git log and history browsing
-- Keybindings:
--   <leader>gg - Open LazyGit
--   q - Exit LazyGit (Esc is blocked)
return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
  },
  config = function()
    -- Block Esc from exiting terminal mode in lazygit buffer
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "*lazygit*",
      callback = function()
        local opts = { buffer = true, silent = true }
        -- Block Esc - send it to lazygit instead of exiting terminal mode
        vim.keymap.set("t", "<Esc>", "<Esc>", opts)
      end,
    })
  end,
}
