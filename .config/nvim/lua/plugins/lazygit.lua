-- LazyGit Integration Plugin
-- Integrates LazyGit terminal UI for Git operations inside Neovim
-- Features:
--   - Full-featured Git UI (commit, push, pull, branch, merge, rebase, etc.)
--   - Visual diff and conflict resolution
--   - Interactive staging and unstaging
--   - Git log and history browsing
-- Keybindings:
--   <leader>gg - Open LazyGit
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
}
