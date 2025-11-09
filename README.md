# dotfiles

![image](https://github.com/duongital/dotfiles/assets/5635533/8ac2df85-dad2-4bb7-815b-04e495354e4f)

My personal dotfiles for macOS, Linux, and WSL.

## Quick Installation

```bash
# Clone the repository
git clone https://github.com/duongital/dotfiles.git
cd dotfiles

# Run the installation script
chmod +x install.sh
./install.sh
```

The install script will:
- Detect your OS (macOS, Linux, or WSL)
- Backup existing configurations
- Symlink dotfiles to your home directory
- Optionally install recommended dependencies

## Included Configurations

### Neovim

Modern Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager.

**Plugins included:**
- **TokyoNight** - Color scheme
- **Telescope** - Fuzzy finder
- **nvim-tree** - File explorer
- **Treesitter** - Syntax highlighting
- **lualine** - Status line
- **which-key** - Keybinding hints
- **Comment.nvim** - Easy commenting
- **nvim-autopairs** - Auto-closing pairs

**First time setup:**
1. Open nvim: `nvim`
2. Lazy.nvim will automatically install
3. Run `:Lazy sync` to install all plugins

**Key mappings:**
- Leader key: `Space`
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Find buffers
- `<leader>fh` - Help tags
- `<leader>e` - Toggle file explorer
- `<leader>o` - Focus file explorer

### Tmux

- Install [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
- Optional theme: [Catppuccin](https://github.com/catppuccin/tmux)
- Update plugins: `Ctrl B` + `Shift I`
- Reload config: `tmux source ~/.tmux.conf`

### Starship

Modern shell prompt. Add to your shell config:

```bash
# For zsh (~/.zshrc)
eval "$(starship init zsh)"

# For bash (~/.bashrc)
eval "$(starship init bash)"
```

### Alacritty

Modern GPU-accelerated terminal emulator.

- Setup guide: [Alacritty Installation](https://github.com/alacritty/alacritty)
- Font used: JetBrainsMono Nerd Font

## Dependencies

### macOS (via Homebrew)
```bash
brew install neovim tmux alacritty starship ripgrep fd
```

### Linux/WSL (via apt)
```bash
sudo apt update
sudo apt install neovim tmux ripgrep fd-find

# Starship
curl -sS https://starship.rs/install.sh | sh
```

## Structure

```
dotfiles/
├── .config/
│   ├── alacritty/
│   │   └── alacritty.toml
│   ├── nvim/
│   │   ├── init.lua
│   │   ├── lazy-lock.json
│   │   └── lua/
│   │       └── plugins/
│   │           ├── autopairs.lua
│   │           ├── colorscheme.lua
│   │           ├── comment.lua
│   │           ├── lualine.lua
│   │           ├── nvim-tree.lua
│   │           ├── telescope.lua
│   │           ├── treesitter.lua
│   │           └── which-key.lua
│   └── startship.toml
├── .tmux.conf
├── .vimrc
└── install.sh
```
