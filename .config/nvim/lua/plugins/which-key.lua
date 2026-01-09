-- Keybinding Helper Plugin
-- Displays a popup with possible keybindings when you start typing a command
-- Features:
--   - Shows available keybindings after a delay
--   - Organized by prefix (e.g., all <leader> commands)
--   - Helps discover and remember keybindings
--   - Displays descriptions for each binding
return {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup()
  end,
}
