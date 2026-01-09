-- Buffer Tabs Plugin
-- Shows buffers as tabs at the top with close buttons
-- Features:
--   - Visual buffer tabs
--   - Click to switch buffers
--   - Close button on each tab
--   - Shows modified indicator
return {
  "akinsho/bufferline.nvim",
  enabled = false, -- temporarily disabled
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      mode = "buffers",
      close_command = "bdelete! %d",
      indicator = { style = "icon", icon = "▎" },
      buffer_close_icon = "󰅖",
      modified_icon = "●",
      close_icon = "",
      show_close_icon = false,
      show_buffer_close_icons = true,
      diagnostics = "nvim_lsp",
      offsets = {
        { filetype = "NvimTree", text = "File Explorer", highlight = "Directory", separator = true },
      },
    },
  },
}
