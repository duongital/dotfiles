-- kulala.nvim - A featureful HTTP client for Neovim
-- Execute HTTP requests directly from .http files
-- Supports environment variables, authentication, and response formatting
-- Repository: https://github.com/mistweaverco/kulala.nvim

return {
  "mistweaverco/kulala.nvim",
  ft = "http",
  keys = {
    { "<leader>rb", "<cmd>lua require('kulala').from_curl()<cr>", desc = "Paste cURL as HTTP", ft = "http" },
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
        -- Response size limit (in bytes): 200KB
        max_response_size = 204800,
      },
    })
  end,
}
