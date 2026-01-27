-- vim-fugitive: A Git wrapper so awesome, it should be illegal
-- Provides comprehensive Git integration within Neovim
-- Main commands: :Git, :Gwrite, :Gread, :Gmove, :Gdelete, :Gdiffsplit, :Gblame
-- Repository: https://github.com/tpope/vim-fugitive

return {
  "tpope/vim-fugitive",
  config = function()
    -- Show only date (no time) in :Git blame
    vim.g.fugitive_blame_date_format = "%Y-%m-%d"
  end,
}
