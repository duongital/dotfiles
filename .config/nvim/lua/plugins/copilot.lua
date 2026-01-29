return {
  "github/copilot.vim",
  cmd = "Copilot",
  event = "InsertEnter",
  init = function()
    -- Disable default Tab mapping to avoid conflict with blink.cmp
    vim.g.copilot_no_tab_map = true
  end,
  config = function()
    -- Use Ctrl+y to accept Copilot suggestion
    vim.keymap.set("i", "<C-y>", 'copilot#Accept("<CR>")', {
      expr = true,
      replace_keycodes = false,
      silent = true,
    })
  end,
}
