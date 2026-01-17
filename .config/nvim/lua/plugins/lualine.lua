-- Statusline Plugin
-- Provides a fast and customizable statusline at the bottom of Neovim
-- Features:
--   - Shows current mode, git branch, file info
--   - Displays file encoding, format, and type
--   - Shows cursor location and progress through file
--   - Auto-detects colorscheme theme
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "NvimTree" },
          winbar = { "NvimTree" },
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "diff", "diagnostics" },
        lualine_c = {
          {
            "navic",
            color_correction = nil,
            navic_opts = nil,
          },
        },
        lualine_x = {},
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      winbar = {
        lualine_c = { { "filename", path = 1 } },
      },
      inactive_winbar = {
        lualine_c = { { "filename", path = 0 } },
      },
    })
  end,
}
