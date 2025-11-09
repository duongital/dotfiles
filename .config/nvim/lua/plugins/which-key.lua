return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    wk.setup({
      preset = "modern",
      delay = 300,
      -- Show popup at bottom
      win = {
        border = "rounded",
        position = "bottom",
      },
    })

    -- Optional: Define key group names for better organization
    wk.add({
      { "<leader>f", group = "Find (Telescope)" },
    })
  end,
}
