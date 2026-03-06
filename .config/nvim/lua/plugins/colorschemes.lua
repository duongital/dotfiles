-- Colorscheme Collection
-- Multiple colorschemes for visual customization
-- Installed themes:
--   - default: Neovim's default color scheme
--   - catppuccin: Pastel theme with warm colors (mocha, latte, frappe, macchiato)
--   - github-theme: GitHub's color scheme
--   - nord-vim: Arctic, north-bluish color palette
--   - rose-pine: All natural pine, faux fur and a bit of soho vibes
--   - tokyonight: Clean, dark theme inspired by Tokyo's night
--   - vscode (ACTIVE): VSCode's Dark+ theme
-- To switch colorschemes: :colorscheme <name>
return {
  {
    "Mofiqul/vscode.nvim",
    name = "vscode",
    priority = 1000,
    config = function()
      require("vscode").setup({
        style = "dark",
        transparent = false,
      })
      vim.cmd.colorscheme("vscode")
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    config = function()
      require("github-theme").setup({
        options = {
          transparent = true,
        },
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        options = {
          transparent = true,
        },
      })
    end,
  },
  { "arcticicestudio/nord-vim" },
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
  { "folke/tokyonight.nvim" },
}
