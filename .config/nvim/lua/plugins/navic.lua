-- Breadcrumbs plugin showing current code context (function, class, etc.)
-- Integrates with LSP to display your cursor location in the code structure
return {
  "SmiteshP/nvim-navic",
  dependencies = "neovim/nvim-lspconfig",
  opts = {
    lsp = {
      auto_attach = true,
    },
    highlight = true,
    separator = " > ",
    depth_limit = 0,
    depth_limit_indicator = "..",
    click = true,
  },
}
