-- File Explorer Plugin
-- Provides a file tree sidebar for navigating and managing files/directories
-- Features:
--   - Visual file tree with icons
--   - Create, delete, rename, move files and folders
--   - Git integration (shows file status)
--   - Split/vsplit file opening
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

      -- Remove 's' for system open (we'll use 'x' or another key)
      vim.keymap.del("n", "s", { buffer = bufnr })

      -- Custom: s to cycle sort method
      local sort_methods = { "name", "case_sensitive", "modification_time", "extension" }
      local current_sort_index = 1
      vim.keymap.set("n", "s", function()
        current_sort_index = (current_sort_index % #sort_methods) + 1
        local method = sort_methods[current_sort_index]
        require("nvim-tree").setup_called = false
        vim.g.nvim_tree_sort_by = method
        api.tree.reload()
        vim.notify("Sort by: " .. method)
      end, opts("Cycle sort method"))

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
      return "[no git]"
    end

    require("nvim-tree").setup({
      on_attach = on_attach,
      view = {
        width = {
          min = 30,
          max = -1, -- unbounded
          padding = 1,
        },
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
      sort = {
        sorter = function(nodes)
          table.sort(nodes, function(a, b)
            -- Folders always come first
            if a.type == "directory" and b.type ~= "directory" then
              return true
            elseif a.type ~= "directory" and b.type == "directory" then
              return false
            end

            local a_name = a.name
            local b_name = b.name
            local a_lower = a_name:lower()
            local b_lower = b_name:lower()

            -- If names are the same when lowercased, compare original
            if a_lower == b_lower then
              return a_name < b_name
            end

            -- Check if first char is uppercase
            local a_is_upper = a_name:match("^%u")
            local b_is_upper = b_name:match("^%u")

            -- If one starts with uppercase and other doesn't, lowercase comes first
            if a_is_upper and not b_is_upper then
              return false
            elseif not a_is_upper and b_is_upper then
              return true
            end

            -- Both same case priority, sort alphabetically (case-insensitive)
            return a_lower < b_lower
          end)
          return nodes
        end,
        folders_first = true,
      },
      filesystem_watchers = {
        enable = true,
      },
    })

    local keymap = vim.keymap.set
    keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    keymap("n", "<leader>fe", ":NvimTreeFindFile<CR>", { desc = "Find current file in explorer" })
    keymap("n", "<C-S-e>", ":NvimTreeFindFile<CR>", { desc = "Find current file in explorer" })
  end,
}
