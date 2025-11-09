#!/bin/bash

# Dotfiles installation script
# Compatible with macOS, Linux, and WSL

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the directory where the script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Detect OS
detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if grep -qi microsoft /proc/version 2>/dev/null; then
            echo "wsl"
        else
            echo "linux"
        fi
    else
        echo "unknown"
    fi
}

OS=$(detect_os)

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}  Dotfiles Installation Script${NC}"
echo -e "${BLUE}================================${NC}"
echo ""
echo -e "${YELLOW}Detected OS: ${OS}${NC}"
echo -e "${YELLOW}Dotfiles directory: ${DOTFILES_DIR}${NC}"
echo ""

# Function to create backup
backup_file() {
    local file=$1
    if [ -e "$file" ]; then
        local backup="${file}.backup.$(date +%Y%m%d_%H%M%S)"
        echo -e "${YELLOW}Backing up existing file: ${file} -> ${backup}${NC}"
        mv "$file" "$backup"
    fi
}

# Function to create symlink
create_symlink() {
    local source=$1
    local target=$2
    local target_dir=$(dirname "$target")

    # Create target directory if it doesn't exist
    if [ ! -d "$target_dir" ]; then
        echo -e "${BLUE}Creating directory: ${target_dir}${NC}"
        mkdir -p "$target_dir"
    fi

    # Backup existing file/directory
    backup_file "$target"

    # Create symlink
    echo -e "${GREEN}Linking: ${source} -> ${target}${NC}"
    ln -sf "$source" "$target"
}

# Install dependencies (optional)
install_dependencies() {
    echo ""
    read -p "Do you want to install recommended dependencies? (y/n) " -n 1 -r
    echo ""

    if [[ $REPLY =~ ^[Yy]$ ]]; then
        case $OS in
            macos)
                echo -e "${BLUE}Installing dependencies via Homebrew...${NC}"
                if ! command -v brew &> /dev/null; then
                    echo -e "${RED}Homebrew not found. Please install Homebrew first.${NC}"
                    return
                fi

                # Install packages
                brew install neovim tmux alacritty starship ripgrep fd
                ;;
            linux|wsl)
                echo -e "${BLUE}Installing dependencies via apt...${NC}"

                # Update package list
                sudo apt update

                # Install packages
                sudo apt install -y neovim tmux ripgrep fd-find

                # Starship
                if ! command -v starship &> /dev/null; then
                    echo -e "${BLUE}Installing Starship...${NC}"
                    curl -sS https://starship.rs/install.sh | sh
                fi

                if [ "$OS" != "wsl" ]; then
                    # Alacritty on Linux (not WSL)
                    echo -e "${YELLOW}Note: Alacritty installation on Linux may require additional steps.${NC}"
                    echo -e "${YELLOW}Visit: https://github.com/alacritty/alacritty/blob/master/INSTALL.md${NC}"
                fi
                ;;
        esac
    fi
}

# Main installation
echo -e "${BLUE}Installing dotfiles...${NC}"
echo ""

# Install tmux config
if [ -f "$DOTFILES_DIR/.tmux.conf" ]; then
    create_symlink "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
fi

# Install vim config
if [ -f "$DOTFILES_DIR/.vimrc" ]; then
    create_symlink "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
fi

# Install nvim config
if [ -d "$DOTFILES_DIR/.config/nvim" ]; then
    echo -e "${BLUE}Installing Neovim configuration...${NC}"

    # Remove old nvim config directory if it exists
    if [ -d "$HOME/.config/nvim" ]; then
        backup_file "$HOME/.config/nvim"
    fi

    # Create .config directory if it doesn't exist
    mkdir -p "$HOME/.config"

    # Symlink the entire nvim directory
    create_symlink "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
fi

# Install Alacritty config
if [ -d "$DOTFILES_DIR/.config/alacritty" ]; then
    create_symlink "$DOTFILES_DIR/.config/alacritty" "$HOME/.config/alacritty"
fi

# Install Starship config
if [ -f "$DOTFILES_DIR/.config/startship.toml" ]; then
    create_symlink "$DOTFILES_DIR/.config/startship.toml" "$HOME/.config/starship.toml"
fi

echo ""
echo -e "${GREEN}✓ Dotfiles installation complete!${NC}"
echo ""

# Install dependencies
install_dependencies

# Post-installation notes
echo ""
echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}  Post-installation notes${NC}"
echo -e "${BLUE}================================${NC}"
echo ""
echo -e "1. ${YELLOW}Neovim:${NC} Open nvim and run ${GREEN}:Lazy sync${NC} to install plugins"
echo -e "2. ${YELLOW}Tmux:${NC} Run ${GREEN}tmux${NC} to start a new session"
echo -e "3. ${YELLOW}Starship:${NC} Add to your shell config (~/.zshrc or ~/.bashrc):"
echo -e "   ${GREEN}eval \"\$(starship init zsh)\"${NC}  # for zsh"
echo -e "   ${GREEN}eval \"\$(starship init bash)\"${NC}  # for bash"
echo ""

if [ "$OS" == "wsl" ]; then
    echo -e "${YELLOW}WSL Note:${NC} You may want to configure Windows Terminal to use Alacritty settings."
    echo ""
fi

echo -e "${GREEN}Happy coding! 🚀${NC}"
