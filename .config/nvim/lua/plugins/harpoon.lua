return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
      default = {
        select = function(list_item, list, options)
          -- Support notes after: --, |, or #
          local path = list_item.value:match("^(.-)%s+%-%-")
            or list_item.value:match("^(.-)%s+|")
            or list_item.value:match("^(.-)%s*#")
            or list_item.value

          path = vim.trim(path)
          if path ~= "" then
            vim.cmd("edit " .. path)
          end
        end,
      },
    })

    harpoon:extend({
      UI_CREATE = function(cx)
        -- Set custom height & width
        local height = 20
        local width = 80
        vim.api.nvim_win_set_height(cx.win_id, height)
        vim.api.nvim_win_set_width(cx.win_id, width)

        -- Center the window
        local ui = vim.api.nvim_list_uis()[1]
        local row = math.floor((ui.height - height) / 2)
        local col = math.floor((ui.width - width) / 2)
        vim.api.nvim_win_set_config(cx.win_id, {
          relative = "editor",
          row = row,
          col = col,
        })
      end,
    })

    -- Keybindings
    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():prepend()
    end, { desc = "Harpoon: Add file" })
    vim.keymap.set("n", "<leader>h", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon: Toggle menu" })

    -- Navigate to marked files
    vim.keymap.set("n", "<leader>1", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon: Go to file 1" })
    vim.keymap.set("n", "<leader>2", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon: Go to file 2" })
    vim.keymap.set("n", "<leader>3", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon: Go to file 3" })
    vim.keymap.set("n", "<leader>4", function()
      harpoon:list():select(4)
    end, { desc = "Harpoon: Go to file 4" })

    -- Navigate between marks
    vim.keymap.set("n", "<C-S-P>", function()
      harpoon:list():prev()
    end, { desc = "Harpoon: Previous mark" })
    vim.keymap.set("n", "<C-S-N>", function()
      harpoon:list():next()
    end, { desc = "Harpoon: Next mark" })
  end,
}
