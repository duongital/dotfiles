-- Mason: LSP/Formatter/Linter installer
-- Provides :Mason command to install and manage tools
return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  config = function()
    require("mason").setup()
  end,
}
