# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture

This is a Neovim configuration using **lazy.nvim** as the plugin manager. The configuration follows a modular structure:

- **init.lua**: Entry point that bootstraps lazy.nvim and loads configuration modules
- **lua/config/**: Core configuration files
  - `options.lua`: Vim options and editor behavior (indentation, search, UI, clipboard, etc.)
  - `keymaps.lua`: All keybindings and leader key configuration
- **lua/plugins/**: Plugin specifications (each plugin in its own file)
  - `init.lua`: Empty file - lazy.nvim automatically loads all `.lua` files in this directory
  - Individual plugin files: `nvim-tree.lua`, `telescope.lua`, `lualine.lua`, etc.

### Plugin Management

Plugins are managed via lazy.nvim. **Each plugin is defined in its own separate file** in `lua/plugins/`. The `init.lua` file in the plugins directory is empty because lazy.nvim automatically discovers and loads all `.lua` files in the directory.

Each plugin file returns a table (or array of tables for related plugins) with the plugin specification including optional `config`, `dependencies`, `build`, `cmd`, `keys`, etc.

### Key Configuration Details

- **Leader key**: Space (`<Space>`)
- **Indentation**: 2 spaces, expandtab enabled
- **Word wrapping**: Enabled with linebreak
- **Colorscheme**: catppuccin-mocha (set in `lua/plugins/colorschemes.lua`)
- **Clipboard**: Synced with system clipboard (`unnamedplus`)

### Essential Keybindings

Leader-based commands (prefix with `<Space>`):

- `<leader>e` / `<leader>ef`: Toggle/find file in nvim-tree
- `<leader>ff` / `<leader>fg` / `<leader>fb`: Telescope file/grep/buffer search
- `<leader>gg`: Open LazyGit
- `<leader>w` / `<leader>q` / `<leader>x`: Save/quit/save+quit
- `<leader>bd`: Delete buffer
- `<leader>sv` / `<leader>sh` / `<leader>sc`: Split vertical/horizontal/close

Window navigation: `<C-h/j/k/l>`
Buffer navigation: `<S-h>` / `<S-l>`

## Installed Plugins

- **File navigation**: nvim-tree
- **Fuzzy finding**: telescope, telescope-fzf-native
- **UI**: lualine (statusline), bufferline, gitsigns
- **Syntax**: nvim-treesitter
- **Editing**: vim-surround, Comment.nvim, nvim-autopairs, better-escape
- **Git**: lazygit, gitsigns
- **Utilities**: which-key
- **Colorschemes**: catppuccin (active), nord, tokyonight

## Adding New Plugins

Create a new file in `lua/plugins/` (e.g., `lua/plugins/plugin-name.lua`) that returns a plugin specification:

```lua
return {
  "author/plugin-name",
  config = function()
    require("plugin-name").setup()
  end,
}
```

For multiple related plugins, return an array:

```lua
return {
  { "plugin/one" },
  { "plugin/two", config = function() ... end },
}
```

lazy.nvim will automatically detect and load the new plugin on next Neovim startup.
