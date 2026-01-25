return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local float = {
      size = 80,
      open_mapping = [[<C-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        width = 100,
        height = 40,
        row = 1,
        col = vim.o.columns - 105,
      },
    }

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

    require("toggleterm").setup(float)

    -- Terminal keymaps
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Toggle terminal
    keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float terminal" })
    keymap("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "Horizontal terminal" })
    keymap("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "Vertical terminal" })
    keymap("n", "<leader>ta", "<cmd>ToggleTermToggleAll<cr>", { desc = "Toggle all terminals" })

    -- Exit terminal mode with Escape
    keymap("t", "<Esc>", [[<C-\><C-n>]], opts)
    keymap("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
    keymap("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
    keymap("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
    keymap("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
  end,
}
