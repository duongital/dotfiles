-- kulala.nvim - A featureful HTTP client for Neovim
-- Execute HTTP requests directly from .http files
-- Supports environment variables, authentication, and response formatting
-- Repository: https://github.com/mistweaverco/kulala.nvim

return {
  "mistweaverco/kulala.nvim",
  ft = "http",
  keys = {
    { "<leader>rb", "<cmd>lua require('kulala').from_curl()<cr>", desc = "Paste cURL as HTTP", ft = "http" },
    { "<leader>rr", "<cmd>lua require('kulala').run()<cr>", desc = "Run REST request", ft = "http" },
    { "<leader>ra", "<cmd>lua require('kulala').run_all()<cr>", desc = "Run all REST requests", ft = "http" },
    { "<leader>rs", "<cmd>lua require('kulala').search()<cr>", desc = "Search REST requests", ft = "http" },
    { "<leader>rv", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle REST view", ft = "http" },
    { "<leader>ri", "<cmd>lua require('kulala').inspect()<cr>", desc = "Inspect REST request", ft = "http" },
    { "<leader>ry", "<cmd>lua require('kulala').copy()<cr>", desc = "Copy REST request as curl", ft = "http" },
    { "<leader>rR", "<cmd>lua require('kulala').replay()<cr>", desc = "Replay last REST request", ft = "http" },
    { "[r", "<cmd>lua require('kulala').jump_prev()<cr>", desc = "Jump to previous REST request", ft = "http" },
    { "]r", "<cmd>lua require('kulala').jump_next()<cr>", desc = "Jump to next REST request", ft = "http" },
    {
      "<leader>re",
      "<cmd>lua require('kulala').set_selected_env()<cr>",
      desc = "Select REST environment",
      ft = "http",
    },
    {
      "<leader>rE",
      "<cmd>lua vim.notify('Current env: ' .. require('kulala').get_selected_env())<cr>",
      desc = "Show current REST environment",
      ft = "http",
    },
  },
  config = function()
    require("kulala").setup({
      -- HTTP request settings
      default_view = "body", -- body|headers|headers_body
      default_env = "dev",
      debug = false,
      -- Display settings
      display_mode = "split", -- split|float
      split_direction = "vertical",
      -- Content type formatters
      contenttypes = {
        ["application/json"] = {
          ft = "json",
          formatter = { "prettier", "--parser", "json" },
        },
      },
      -- Additional settings
      icons = {
        inlay = {
          loading = "⏳",
          done = "✅",
        },
        lualine = "🐼",
      },
      additional_curl_options = {},
      -- UI settings
      ui = {
        -- Response size limit (in bytes): 500KB
        max_response_size = 512000,
      },
    })
  end,
}
