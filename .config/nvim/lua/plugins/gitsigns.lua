-- Git Integration Plugin
-- Shows git diff indicators in the sign column (gutter)
-- Features:
--   - Visual indicators for added/changed/deleted lines
--   - Git blame and hunk operations
--   - Stage/unstage hunks
--   - Preview changes inline
return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = 'Next hunk' })

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = 'Previous hunk' })

        map("n", "<leader>gb", "<cmd>Gitsigns blame_line full=true<cr>", { desc = "Blame line" })
        map("n", "<leader>gB", "<cmd>Gitsigns blame<cr>", { desc = "Blame (full)" })
        map("n", "<leader>gd", "<cmd>Gitsigns preview_hunk_inline<cr>", { desc = "Preview hunk inline" })
      end,
    })
  end,
}
