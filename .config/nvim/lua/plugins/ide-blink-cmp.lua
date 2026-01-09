-- Code Completion Plugin
-- Fast completion engine written in Rust
-- Features:
--   - LSP-based completions (TypeScript, ESLint, etc.)
--   - Buffer word completions
--   - File path completions
--   - Snippet support
-- Keybindings:
--   <C-Space> - Trigger completion
--   <Tab> / <S-Tab> - Navigate items
--   <CR> - Confirm selection
--   <C-e> - Cancel completion
--   <C-b> / <C-f> - Scroll docs
return {
  "saghen/blink.cmp",
  version = "1.*",
  event = "InsertEnter",
  opts = {
    keymap = {
      preset = "default",
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<C-Space>"] = { "show" },
      ["<C-e>"] = { "cancel", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },
    sources = {
      default = { "lsp", "path", "buffer" },
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      menu = {
        draw = {
          columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
        },
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
}
