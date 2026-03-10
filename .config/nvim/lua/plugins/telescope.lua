-- Fuzzy Finder Plugin
-- Highly extendable fuzzy finder over lists (files, buffers, git files, etc.)
-- Features:
--   - Fast fuzzy file search
--   - Live grep (search text across project)
--   - Buffer/help/command searching
--   - Preview window for files
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/" },
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
        },
      })

      local keymap = vim.keymap.set
      keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
      keymap("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
      keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
      keymap("n", "<C-S-f>", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
      keymap("n", "<leader>fS", function()
        require("telescope.builtin").live_grep({
          additional_args = { "--case-sensitive" },
        })
      end, { desc = "Live grep (case sensitive)" })
      keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
      keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
      keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
      keymap("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })
      keymap("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Git status" })
      keymap("n", "<leader>gh", "<cmd>Telescope git_bcommits<CR>", { desc = "Git bcommits" })
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
}
