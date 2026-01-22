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
keymap("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", { desc = "Close other buffers" })

-- File explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap("n", "<leader>ef", ":NvimTreeFindFile<CR>", { desc = "Find file in explorer" })
keymap("n", "<leader>fe", ":NvimTreeFindFile<CR>", { desc = "Find current file in explorer" })
keymap("n", "<C-S-e>", ":NvimTreeFindFile<CR>", { desc = "Find current file in explorer" })

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
keymap("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
keymap("n", "<C-S-f>", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
keymap("n", "<leader>fS", function()
  require("telescope.builtin").live_grep({
    additional_args = { "--case-sensitive" },
  })
end, { desc = "Live grep (case sensitive)" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })
keymap("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Git status" })
keymap("n", "<leader>gh", "<cmd>Telescope git_bcommits<CR>", { desc = "Git bcommits" })

-- Gitsigns
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame_line full=true<cr>") -- Quick blame popup
vim.keymap.set("n", "<leader>gB", "<cmd>Gitsigns blame<cr>") -- Full commit info
vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns preview_hunk_inline<cr>") -- Diff current file

keymap("n", "<leader>gr", "<cmd>Gdiffsplit!<CR>", { desc = "Git resolves in 3-way" })
keymap("n", "<leader>gl", "<cmd>vert Gclog -n 100<CR>", { desc = "Git log (vertical)" })

-- Lazygit
keymap("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })

-- Better paste
keymap("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Stay in indent mode
keymap("v", "<", "<gv", { desc = "Indent left" })
keymap("v", ">", ">gv", { desc = "Indent right" })

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move text up" })

-- Clear search highlight
keymap("n", "<Esc>", ":noh<CR>", { desc = "Clear search highlight" })

-- Save and quit shortcuts
keymap("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap("n", "<leader>x", ":x<CR>", { desc = "Save and quit" })
--keymap("n", "<leader>Q", ":qa<CR>", { desc = "Quit all" })

-- Split windows
keymap("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertically" })
keymap("n", "<leader>sh", ":split<CR>", { desc = "Split horizontally" })
keymap("n", "<leader>sc", ":close<CR>", { desc = "Close split" })

-- Terminal
keymap("n", "<leader>tt", ":terminal<CR>", { desc = "Open terminal" })
keymap("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Run code
keymap("n", "<leader>rp", ":!uv run %<CR>", { desc = "Run Python file with uv" })
keymap("n", "<leader>rt", ":!bun %<CR>", { desc = "Run TypeScript file with bun" })
keymap("n", "<leader>rl", ":!lua %<CR>", { desc = "Run Lua file" })
keymap("n", "<leader>rg", ":!go run .<CR>", { desc = "Run Go project" })

-- LSP Diagnostics
keymap("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
keymap("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Show all diagnostics" })
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- LSP Code navigation
keymap("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Show diagnostics at cursor" })
keymap("n", "gr", function()
  require("telescope.builtin").lsp_references({ jump_type = "never" })
end, { desc = "Go to references" })

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
