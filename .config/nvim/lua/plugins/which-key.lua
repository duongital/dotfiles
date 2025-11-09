return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    wk.setup({
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
      },
      window = {
        border = "rounded",
        position = "bottom",
      },
    })

    -- Optional: Define key group names for better organization
    wk.register({
      f = { name = "Find (Telescope)" },
    }, { prefix = "<leader>" })
  end,
}
