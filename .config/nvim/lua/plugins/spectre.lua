return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>sr",
      function()
        require("spectre").toggle()
      end,
      desc = "Search and Replace",
    },
    {
      "<leader>sw",
      function()
        require("spectre").open_visual({ select_word = true })
      end,
      desc = "Search current word",
    },
  },
  config = function()
    -- Choose your preferred layout: "horizontal", "vertical", or "float"
    local horizontal = "new"
    local vertical = "vnew"
    local float = function()
      -- Create a floating window
      local width = math.floor(vim.o.columns * 0.9)
      local height = math.floor(vim.o.lines * 0.9)
      local buf = vim.api.nvim_create_buf(false, true)
      local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        col = math.floor((vim.o.columns - width) / 2),
        row = math.floor((vim.o.lines - height) / 2),
        style = "minimal",
        border = "rounded",
      })
      return { buf = buf, win = win }
    end

    local is_float_mode = type(float) == "function"

    require("spectre").setup({
      open_cmd = vertical, -- Change to vertical or float as needed
      mapping = {
        ["change_view_mode"] = {
          map = "<leader>v",
          cmd = "<cmd>lua require('spectre').change_view()<CR>",
          desc = "change result view mode",
        },
        ["send_to_qf"] = {
          map = "<leader>q",
          cmd = "<cmd>lua require('spectre.actions').send_to_qf(); require('spectre').close()<CR>",
          desc = "send all items to quickfix and close",
        },
        ["send_to_qf_alt"] = {
          map = "<C-q>",
          cmd = "<cmd>lua require('spectre.actions').send_to_qf(); require('spectre').close()<CR>",
          desc = "send all items to quickfix and close",
        },
      },
    })

    -- Auto-close Spectre when entering buffer (only for float mode)
    if is_float_mode then
      vim.api.nvim_create_autocmd("BufEnter", {
        group = vim.api.nvim_create_augroup("SpectreAutoClose", { clear = true }),
        callback = function()
          local spectre_ft = vim.bo.filetype
          if spectre_ft ~= "spectre_panel" then
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              local buf = vim.api.nvim_win_get_buf(win)
              if vim.api.nvim_buf_get_option(buf, "filetype") == "spectre_panel" then
                require("spectre").close()
                break
              end
            end
          end
        end,
      })
    end
  end,
}
