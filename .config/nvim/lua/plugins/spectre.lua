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
    require("spectre").setup({
      --open_cmd = "new", -- horizontal split instead of vertical
      mapping = {
        ["change_view_mode"] = {
          map = "<leader>v",
          cmd = "<cmd>lua require('spectre').change_view()<CR>",
          desc = "change result view mode",
        },
      },
    })
  end,
}
