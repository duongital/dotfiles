return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local horizon = {
      size = math.floor(vim.o.lines * 0.25),
      open_mapping = [[<C-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "horizontal",
      close_on_exit = true,
      shell = vim.o.shell,
    }

    require("toggleterm").setup({
      open_mapping = [[<C-\>]],
      direction = "float",
    })

    -- Terminal keymaps
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Toggle terminal
    keymap("n", "<leader>ttf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float terminal" })
    keymap("n", "<leader>tth", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "Horizontal terminal" })
    keymap("n", "<leader>ttv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "Vertical terminal" })
    keymap("n", "<leader>tta", "<cmd>ToggleTermToggleAll<cr>", { desc = "Toggle all terminals" })

    -- Exit terminal mode with Escape
    keymap("t", "<Esc>", [[<C-\><C-n>]], opts)
    keymap("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
    keymap("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
    keymap("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
    keymap("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
  end,
}
