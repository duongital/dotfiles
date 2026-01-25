-- Options
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = false -- Show relative line numbers (counts up/down from current line)
opt.numberwidth = 4

-- Word wrapping
opt.wrap = true
opt.linebreak = true

-- Sign column for git signs, diagnostics, etc.
opt.signcolumn = "yes"
opt.foldcolumn = "0"

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- UI
opt.termguicolors = true
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Diff
opt.diffopt:append("vertical")

-- Clipboard
opt.clipboard = "unnamedplus"

-- Folding (Treesitter-based)
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99      -- Start with all folds open
opt.foldlevelstart = 99

-- Backup
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true

-- Auto-reload files changed outside of Neovim
opt.autoread = true
opt.updatetime = 250

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "checktime",
})

-- Open quickfix list on bottom
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.cmd("botright wincmd J")
    vim.cmd("resize 10")
  end,
})

