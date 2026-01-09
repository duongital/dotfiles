-- Flash: Quick navigation/jump plugin
-- Lets you jump to any location on screen using search labels
-- Keybindings:
--   s - Flash jump (type chars, then label to jump)
--   S - Flash Treesitter (select treesitter nodes)
--   r - Remote Flash (operator-pending mode)
--   R - Treesitter Search (search + select treesitter nodes)
--   <C-s> - Toggle Flash in search mode (/)
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
