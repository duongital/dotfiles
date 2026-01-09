-- File Explorer Plugin
-- Provides a file tree sidebar for navigating and managing files/directories
-- Features:
--   - Visual file tree with icons
--   - Create, delete, rename, move files and folders
--   - Git integration (shows file status)
--   - Split/vsplit file opening
-- Keybindings (from keymaps.lua):
--   <leader>e / <leader>ef - Toggle/focus file explorer
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local function on_attach(bufnr)
      local api = require("nvim-tree.api")
      local opts = function(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- Default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- Custom: gf to grep in folder
      vim.keymap.set("n", "gf", function()
        local node = api.tree.get_node_under_cursor()
        local path = node.type == "directory" and node.absolute_path or vim.fn.fnamemodify(node.absolute_path, ":h")
        require("telescope.builtin").live_grep({ search_dirs = { path } })
      end, opts("Grep in folder"))
    end

    local function get_git_branch()
      local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null"):gsub("\n", "")
      if branch ~= "" and not branch:match("^fatal") then
        return " " .. branch
      end
      return ""
    end

    require("nvim-tree").setup({
      on_attach = on_attach,
      view = {
        width = 30,
      },
      renderer = {
        root_folder_label = function()
          return get_git_branch()
        end,
      },
      filters = {
        dotfiles = false,
      },
      git = {
        enable = true,
        ignore = false,
      },
    })
  end,
}
