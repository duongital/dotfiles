-- Fuzzy Finder Plugin
-- Highly extendable fuzzy finder over lists (files, buffers, git files, etc.)
-- Features:
--   - Fast fuzzy file search
--   - Live grep (search text across project)
--   - Buffer/help/command searching
--   - Preview window for files
-- Keybindings (from keymaps.lua):
--   <leader>ff - Find files
--   <leader>fg - Live grep (search text)
--   <leader>fb - Find buffers
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
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
}
