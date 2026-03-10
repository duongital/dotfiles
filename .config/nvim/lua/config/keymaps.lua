-- Keymaps
local keymap = vim.keymap.set

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
keymap("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
keymap("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Better paste
keymap("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Stay in indent mode
keymap("v", "<", "<gv", { desc = "Indent left" })
keymap("v", ">", ">gv", { desc = "Indent right" })

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move text up" })

-- Move lines up and down with Alt+arrows
keymap("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up" })
keymap("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down" })
keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })

-- Clear search highlight
keymap("n", "<Esc>", ":noh<CR>", { desc = "Clear search highlight" })

-- Save and quit shortcuts
keymap("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })
--keymap("n", "<leader>x", ":x<CR>", { desc = "Save and quit" })
--keymap("n", "<leader>Q", ":qa<CR>", { desc = "Quit all" })

-- Split windows
keymap("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertically" })
keymap("n", "<leader>sh", ":split<CR>", { desc = "Split horizontally" })
keymap("n", "<leader>sc", ":close<CR>", { desc = "Close split" })

-- Terminal
keymap("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Run code
keymap("n", "<leader>rcp", ":!uv run %<CR>", { desc = "Run Python file with uv" })
keymap("n", "<leader>rct", ":!bun %<CR>", { desc = "Run TypeScript file with bun" })
keymap("n", "<leader>rcl", ":!lua %<CR>", { desc = "Run Lua file" })
keymap("n", "<leader>rcg", ":!go run .<CR>", { desc = "Run Go project" })

-- Copy file path
keymap("n", "<leader>yp", function()
  local path = vim.fn.expand("%:p") .. ":" .. vim.fn.line(".")
  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path)
end, { desc = "Copy file path with line number" })
keymap("n", "<leader>cp", function()
  local path = vim.fn.expand("%")
  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path)
end, { desc = "Copy relative path" })
keymap("n", "<leader>cP", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path)
end, { desc = "Copy absolute path" })
